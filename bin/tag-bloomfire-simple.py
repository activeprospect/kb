#!/usr/bin/env python3
"""
Tag Bloomfire Articles - Simple Version
Uses basic YAML handling without external dependencies
"""

import os
import re
from pathlib import Path
from typing import List, Dict, Tuple, Set

class SimpleArticleTagger:
    def __init__(self, base_dir: str = "."):
        self.base_dir = Path(base_dir).absolute()
        self.content_dir = self.base_dir / "content" / "bloomfire"
        self.files_updated = 0
        
        # Simplified tag detection rules
        self.tag_patterns = {
            # User roles
            'buyer-focused': ['buyer', 'vendor', 'purchase', 'quality', 'compliance', 'roi', 'vendor management'],
            'seller-focused': ['seller', 'source', 'submit', 'publisher', 'lead generation', 'submission'],
            'developer-focused': ['api', 'code', 'webhook', 'sdk', 'script', 'javascript', 'function'],
            'admin-focused': ['admin', 'permission', 'security', 'account', 'user management', 'settings'],
            
            # Experience levels  
            'beginner': ['introduction', 'basic', 'getting started', 'what is', 'overview', 'first'],
            'intermediate': ['configure', 'setup', 'common', 'standard'],
            'advanced': ['complex', 'optimize', 'advanced', 'pro tip', 'sophisticated'],
            
            # Content types
            'how-to': ['how to', 'steps', 'configure', 'implement', 'build', 'create'],
            'conceptual': ['what is', 'understanding', 'overview', 'introduction', 'about'],
            'reference': ['glossary', 'reference', 'specification', 'list', 'table'],
            'troubleshooting': ['error', 'issue', 'problem', 'fix', 'resolve', 'troubleshoot'],
            'best-practices': ['best practice', 'recommend', 'optimize', 'tip', 'proven'],
            
            # Feature areas
            'flows': ['flow', 'workflow', 'step', 'orchestration'],
            'data-management': ['field', 'data', 'transform', 'template', 'mapping'],
            'business-logic': ['rule', 'criteria', 'pricing', 'logic', 'condition'],
            'integrations': ['integration', 'connect', 'external', 'third party', 'addon'],
            'analytics': ['report', 'event', 'metric', 'analysis', 'export', 'insight'],
            'compliance': ['consent', 'suppress', 'tcpa', 'gdpr', 'trustedform', 'compliance'],
            
            # Products
            'trustedform': ['trustedform', 'certificate', 'consent', 'certify'],
            'leadsbridge': ['leadsbridge', 'bridge'],
            'leadconduit': ['leadconduit', 'flow'],
            
            # Technical depth
            'technical': ['code', 'api', 'function', 'script', 'sdk'],
            'semi-technical': ['configure', 'setting', 'option'],
            'non-technical': [],  # Default if no technical indicators
        }
    
    def extract_frontmatter(self, content: str) -> Tuple[Dict, str]:
        """Extract frontmatter and body from markdown"""
        if content.startswith('---\n'):
            parts = content.split('---\n', 2)
            if len(parts) >= 3:
                # Parse simple YAML manually
                frontmatter = {}
                for line in parts[1].split('\n'):
                    if ': ' in line:
                        key, value = line.split(': ', 1)
                        frontmatter[key.strip()] = value.strip()
                return frontmatter, parts[2]
        return {}, content
    
    def format_frontmatter(self, data: Dict) -> str:
        """Format dictionary as YAML frontmatter"""
        lines = []
        for key, value in data.items():
            if isinstance(value, list):
                lines.append(f"{key}:")
                for item in value:
                    lines.append(f"  - {item}")
            else:
                lines.append(f"{key}: {value}")
        return '\n'.join(lines)
    
    def analyze_content(self, content: str, title: str) -> Dict[str, int]:
        """Analyze content and return tag scores"""
        full_text = (title + ' ' + content).lower()
        
        tag_scores = {}
        
        for tag, patterns in self.tag_patterns.items():
            score = 0
            for pattern in patterns:
                pattern_lower = pattern.lower()
                # Title matches worth more
                if pattern_lower in title.lower():
                    score += 5
                # Count in content
                score += full_text.count(pattern_lower)
            
            if score > 0:
                tag_scores[tag] = score
        
        # Special rules for some tags
        if 'trustedform' in full_text:
            tag_scores['trustedform'] = tag_scores.get('trustedform', 0) + 10
            tag_scores['compliance'] = tag_scores.get('compliance', 0) + 5
            
        if 'facebook' in full_text and 'lead' in full_text:
            tag_scores['integrations'] = tag_scores.get('integrations', 0) + 5
            
        if 'leadsbridge' in full_text:
            tag_scores['leadsbridge'] = tag_scores.get('leadsbridge', 0) + 10
            tag_scores['integrations'] = tag_scores.get('integrations', 0) + 5
            
        # Industry detection
        if 'insurance' in full_text:
            tag_scores['insurance'] = 5
        elif 'lending' in full_text or 'loan' in full_text:
            tag_scores['lending'] = 5
        elif 'education' in full_text:
            tag_scores['education'] = 5
        elif 'legal' in full_text:
            tag_scores['legal'] = 5
        else:
            tag_scores['universal'] = 3
            
        # Lifecycle stage
        if 'getting started' in full_text or 'introduction' in full_text:
            tag_scores['implementation'] = 5
        elif 'optimize' in full_text or 'improve' in full_text:
            tag_scores['optimization'] = 5
        else:
            tag_scores['operation'] = 3
            
        # Technical depth - if no technical indicators found
        if not any(tag_scores.get(t, 0) > 0 for t in ['technical', 'semi-technical']):
            tag_scores['non-technical'] = 3
            
        return tag_scores
    
    def determine_tags(self, tag_scores: Dict[str, int], title: str) -> Tuple[List[str], List[str]]:
        """Determine primary and secondary tags"""
        if not tag_scores:
            return [], []
        
        # Sort by score
        sorted_tags = sorted(tag_scores.items(), key=lambda x: x[1], reverse=True)
        
        primary_tags = []
        secondary_tags = []
        
        # Categories
        user_roles = ['buyer-focused', 'seller-focused', 'developer-focused', 'admin-focused']
        experience = ['beginner', 'intermediate', 'advanced']
        content_types = ['how-to', 'conceptual', 'reference', 'troubleshooting', 'best-practices']
        features = ['flows', 'data-management', 'business-logic', 'integrations', 'analytics', 'compliance']
        tech_depth = ['technical', 'semi-technical', 'non-technical']
        lifecycle = ['evaluation', 'implementation', 'operation', 'optimization']
        industry = ['insurance', 'lending', 'education', 'legal', 'universal']
        products = ['trustedform', 'leadsbridge', 'leadconduit']
        
        # Select primary tags
        added_categories = set()
        
        for tag, score in sorted_tags:
            if len(primary_tags) >= 7:
                break
                
            # Skip if we already have from this category
            if tag in user_roles and 'user_role' in added_categories:
                continue
            elif tag in experience and 'experience' in added_categories:
                continue
            elif tag in tech_depth and 'tech_depth' in added_categories:
                continue
                
            # Add tag if score is significant
            if score >= 3:
                primary_tags.append(tag)
                
                # Track category
                if tag in user_roles:
                    added_categories.add('user_role')
                elif tag in experience:
                    added_categories.add('experience')
                elif tag in content_types:
                    added_categories.add('content_type')
                elif tag in features:
                    added_categories.add('feature')
                elif tag in tech_depth:
                    added_categories.add('tech_depth')
                elif tag in products and score >= 10:
                    # Products need high score to be primary
                    added_categories.add('product')
        
        # Secondary tags - related but not primary focus
        for tag, score in sorted_tags:
            if tag not in primary_tags and score >= 1:
                if len(secondary_tags) < 5:
                    # Don't add conflicting tags
                    if tag == 'technical' and 'non-technical' in primary_tags:
                        continue
                    if tag == 'beginner' and 'advanced' in primary_tags:
                        continue
                    secondary_tags.append(tag)
        
        # Ensure we have key categories
        if not any(t in primary_tags for t in user_roles):
            # Default based on content
            if 'trustedform' in title.lower() or 'pricing' in title.lower():
                primary_tags.insert(0, 'buyer-focused')
            else:
                primary_tags.insert(0, 'seller-focused')
                
        if not any(t in primary_tags for t in experience):
            if 'introduction' in title.lower() or 'getting started' in title.lower():
                primary_tags.insert(1, 'beginner')
            else:
                primary_tags.insert(1, 'intermediate')
                
        if not any(t in primary_tags + secondary_tags for t in lifecycle):
            secondary_tags.append('operation')
            
        if not any(t in primary_tags + secondary_tags for t in industry):
            secondary_tags.append('universal')
        
        return primary_tags[:7], secondary_tags[:5]
    
    def update_file(self, file_path: Path) -> bool:
        """Update a single file with tags"""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            frontmatter, body = self.extract_frontmatter(content)
            
            # Skip if already tagged
            if 'tags' in frontmatter and 'secondary_tags' in frontmatter:
                print(f"  Skipping {file_path.name} - already tagged")
                return False
            
            # Get title
            title = frontmatter.get('Page Title', file_path.stem.replace('-', ' '))
            
            # Analyze
            tag_scores = self.analyze_content(body, title)
            primary_tags, secondary_tags = self.determine_tags(tag_scores, title)
            
            # Update frontmatter
            frontmatter['tags'] = primary_tags
            frontmatter['secondary_tags'] = secondary_tags
            
            # Write back
            new_content = f"---\n{self.format_frontmatter(frontmatter)}\n---\n{body}"
            
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            
            print(f"  Tagged {file_path.name}:")
            print(f"    Primary: {', '.join(primary_tags)}")
            print(f"    Secondary: {', '.join(secondary_tags)}")
            
            return True
            
        except Exception as e:
            print(f"  Error with {file_path.name}: {e}")
            return False
    
    def run(self):
        """Process all files"""
        print("Tagging Bloomfire Articles")
        print("=" * 60)
        
        md_files = list(self.content_dir.glob("*.md"))
        print(f"Found {len(md_files)} files\n")
        
        for file_path in sorted(md_files):  # Process all files
            if self.update_file(file_path):
                self.files_updated += 1
        
        print(f"\nUpdated {self.files_updated} files")

def main():
    tagger = SimpleArticleTagger()
    tagger.run()

if __name__ == '__main__':
    main()