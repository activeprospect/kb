#!/usr/bin/env python3
"""
Safe Image Downloader with Validation
Downloads images and validates they are actual image files
"""

import os
import subprocess
import json
from pathlib import Path
from typing import Dict, List
import hashlib

class SafeImageDownloader:
    def __init__(self, base_dir: str = "."):
        self.base_dir = Path(base_dir).absolute()
        self.media_dir = self.base_dir / "media" / "images"
        self.download_log = []
        
    def validate_image_file(self, file_path: Path) -> Dict:
        """Validate if a file is an actual image"""
        if not file_path.exists():
            return {"valid": False, "reason": "File does not exist"}
        
        # Check file size
        file_size = file_path.stat().st_size
        if file_size < 500:  # Less than 500 bytes is suspicious
            # Check if it's XML/HTML error
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read(200)
                    if 'AccessDenied' in content or 'Error' in content or '<html' in content.lower():
                        return {"valid": False, "reason": "Access denied or error page", "content_preview": content[:100]}
            except:
                pass
            return {"valid": False, "reason": f"File too small ({file_size} bytes)"}
        
        # Use 'file' command to check MIME type
        try:
            result = subprocess.run(['file', '--mime-type', str(file_path)], 
                                  capture_output=True, text=True)
            mime_type = result.stdout.strip().split(': ')[-1]
            
            valid_image_types = ['image/png', 'image/jpeg', 'image/gif', 'image/webp', 'image/svg+xml']
            if any(valid_type in mime_type for valid_type in valid_image_types):
                return {"valid": True, "mime_type": mime_type, "size": file_size}
            else:
                return {"valid": False, "reason": f"Not an image file (type: {mime_type})"}
        except Exception as e:
            return {"valid": False, "reason": f"Could not determine file type: {e}"}
    
    def download_with_curl(self, url: str, output_path: Path) -> Dict:
        """Download a file using curl with proper error handling"""
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        # Download with curl
        cmd = [
            'curl', '-L', url,
            '-o', str(output_path),
            '--silent', '--show-error',
            '--max-time', '30',
            '-H', 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
        ]
        
        try:
            result = subprocess.run(cmd, capture_output=True, text=True)
            
            if result.returncode != 0:
                return {
                    "success": False,
                    "error": f"Curl failed: {result.stderr}",
                    "url": url,
                    "output_path": str(output_path)
                }
            
            # Validate the downloaded file
            validation = self.validate_image_file(output_path)
            
            if not validation["valid"]:
                # Remove invalid file
                output_path.unlink(missing_ok=True)
                return {
                    "success": False,
                    "error": f"Invalid image: {validation['reason']}",
                    "url": url,
                    "output_path": str(output_path),
                    "validation": validation
                }
            
            return {
                "success": True,
                "url": url,
                "output_path": str(output_path),
                "validation": validation
            }
            
        except Exception as e:
            return {
                "success": False,
                "error": f"Download exception: {e}",
                "url": url,
                "output_path": str(output_path)
            }
    
    def process_inventory_file(self, inventory_path: Path) -> Dict:
        """Process the image inventory JSON file"""
        if not inventory_path.exists():
            return {"error": f"Inventory file not found: {inventory_path}"}
        
        with open(inventory_path, 'r') as f:
            inventory = json.load(f)
        
        total_images = 0
        successful_downloads = 0
        failed_downloads = 0
        
        for doc in inventory:
            doc_name = doc['doc_name']
            print(f"\nProcessing document: {doc_name}")
            print("-" * 50)
            
            for img in doc['images']:
                total_images += 1
                url = img['url']
                local_path = Path(img['local_path'])
                
                # Skip non-HTTP URLs
                if not url.startswith(('http://', 'https://')):
                    print(f"  Skipping non-HTTP URL: {url[:50]}...")
                    continue
                
                print(f"  Image {img['image_number']}: ", end='')
                
                # Download the image
                result = self.download_with_curl(url, self.base_dir / local_path)
                
                if result['success']:
                    print(f"✓ Downloaded ({result['validation']['size']} bytes)")
                    successful_downloads += 1
                else:
                    print(f"✗ Failed - {result['error']}")
                    failed_downloads += 1
                
                self.download_log.append(result)
        
        return {
            "total_images": total_images,
            "successful_downloads": successful_downloads,
            "failed_downloads": failed_downloads,
            "download_log": self.download_log
        }
    
    def generate_report(self, results: Dict):
        """Generate a download report"""
        report_path = self.base_dir / "media" / "download-report.json"
        with open(report_path, 'w') as f:
            json.dump(results, f, indent=2)
        
        print("\n" + "=" * 60)
        print("DOWNLOAD SUMMARY")
        print("=" * 60)
        print(f"Total images found: {results['total_images']}")
        print(f"Successfully downloaded: {results['successful_downloads']}")
        print(f"Failed downloads: {results['failed_downloads']}")
        print(f"\nDetailed report saved to: {report_path}")
        
        # Show failed downloads
        if results['failed_downloads'] > 0:
            print("\nFailed downloads:")
            for log_entry in results['download_log']:
                if not log_entry.get('success', False):
                    print(f"  - {log_entry['url'][:60]}...")
                    print(f"    Reason: {log_entry['error']}")

def main():
    """Main entry point"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Safe image downloader with validation')
    parser.add_argument('--inventory', default='media/image-inventory-tagged.json', 
                       help='Path to inventory JSON file')
    parser.add_argument('--base-dir', default='.', help='Base directory of the project')
    
    args = parser.parse_args()
    
    downloader = SafeImageDownloader(base_dir=args.base_dir)
    inventory_path = Path(args.base_dir) / args.inventory
    
    results = downloader.process_inventory_file(inventory_path)
    downloader.generate_report(results)

if __name__ == '__main__':
    main()