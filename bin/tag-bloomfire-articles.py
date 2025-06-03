#!/usr/bin/env python3
"""
Tag Bloomfire Articles with Primary and Secondary Tags
Analyzes content and adds appropriate tags to frontmatter
"""

import os
import re
import yaml
from pathlib import Path
from typing import List, Dict, Tuple, Set
from collections import Counter

class ArticleTagger:
    def __init__(self, base_dir: str = "."):
        self.base_dir = Path(base_dir).absolute()
        self.content_dir = self.base_dir / "content" / "bloomfire"
        self.tags_analyzed = 0
        self.files_updated = 0
        
        # Define tag detection rules based on content patterns
        self.tag_rules = {
            # User roles
            'buyer-focused': {
                'keywords': ['buyer', 'vendor', 'purchase', 'quality control', 'compliance verification', 'roi', 'cost', 'vendor management'],
                'phrases': ['managing vendors', 'vendor relationships', 'lead quality', 'buying leads']
            },
            'seller-focused': {
                'keywords': ['seller', 'source', 'monetiz', 'distribut', 'acceptance rate', 'submit', 'publisher'],
                'phrases': ['selling leads', 'lead generation', 'submission docs', 'source pricing']
            },
            'developer-focused': {
                'keywords': ['api', 'code', 'webhook', 'integration', 'json', 'xml', 'sdk', 'script', 'function', 'method'],
                'phrases': ['code example', 'api endpoint', 'technical implementation', 'javascript', 'html']
            },
            'admin-focused': {
                'keywords': ['admin', 'permission', 'security', 'account', 'user management', 'settings', 'configuration'],
                'phrases': ['account settings', 'user permissions', 'access control', 'account management']
            },
            
            # Experience levels
            'beginner': {
                'keywords': ['introduction', 'basic', 'getting started', 'first', 'simple', 'what is', 'overview'],
                'phrases': ['new to', 'step by step', 'for beginners', 'basic concepts']
            },
            'intermediate': {
                'keywords': ['configure', 'standard', 'common', 'typical', 'setup'],
                'phrases': ['best practices', 'common patterns', 'standard configuration']
            },
            'advanced': {
                'keywords': ['complex', 'optimize', 'advanced', 'sophisticated', 'custom', 'pro tip'],
                'phrases': ['power user', 'advanced techniques', 'complex scenarios', 'optimization']
            },
            
            # Content types
            'how-to': {
                'keywords': ['how to', 'steps', 'configure', 'setup', 'create', 'implement', 'build'],
                'phrases': ['step by step', 'follow these steps', 'to do this', 'instructions']
            },
            'conceptual': {
                'keywords': ['what is', 'understanding', 'concept', 'overview', 'introduction', 'about'],
                'phrases': ['explains what', 'learn about', 'understanding the']
            },
            'reference': {
                'keywords': ['glossary', 'field', 'operator', 'specification', 'list', 'table', 'reference'],
                'phrases': ['field reference', 'api reference', 'complete list', 'all options']
            },
            'troubleshooting': {
                'keywords': ['error', 'issue', 'problem', 'fix', 'resolve', 'troubleshoot', 'fail', 'wrong'],
                'phrases': ['common issues', 'error messages', 'problem solving', 'if you see']
            },
            'best-practices': {
                'keywords': ['best practice', 'recommend', 'optimize', 'proven', 'should', 'tip'],
                'phrases': ['we recommend', 'proven approach', 'pro tip', 'best way']
            },
            
            # Feature areas
            'flows': {
                'keywords': ['flow', 'workflow', 'step', 'orchestration'],
                'phrases': ['flow configuration', 'flow design', 'flow steps']
            },
            'data-management': {
                'keywords': ['field', 'type', 'data', 'transform', 'template', 'format', 'value'],
                'phrases': ['data transformation', 'field mapping', 'data types']
            },
            'business-logic': {
                'keywords': ['rule', 'criteria', 'cap', 'pricing', 'logic', 'condition', 'decision'],
                'phrases': ['business rules', 'acceptance criteria', 'pricing rules']
            },
            'integrations': {
                'keywords': ['integration', 'connect', 'entity', 'external', 'third party', 'addon'],
                'phrases': ['external system', 'connect to', 'integrate with']
            },
            'analytics': {
                'keywords': ['report', 'event', 'metric', 'analysis', 'export', 'insight', 'data'],
                'phrases': ['reporting on', 'analyze data', 'view metrics']
            },
            'compliance': {
                'keywords': ['consent', 'suppress', 'complian', 'regulatory', 'tcpa', 'gdpr', 'trustedform'],
                'phrases': ['consent verification', 'compliance requirements', 'regulatory compliance']
            },
            
            # Special purpose
            'trustedform': {
                'keywords': ['trustedform', 'certificate', 'consent', 'certify', 'retain', 'claim'],
                'phrases': ['trustedform certificate', 'consent verification', 'certificate retention']
            },
            'leadsbridge': {
                'keywords': ['leadsbridge', 'bridge', 'facebook'],
                'phrases': ['facebook lead ads', 'create a bridge', 'leadsbridge account']
            },
            'facebook': {
                'keywords': ['facebook', 'meta', 'lead ads', 'custom audience'],
                'phrases': ['facebook lead ads', 'facebook conversion', 'facebook pixel']
            }
        }
    
    def extract_frontmatter(self, content: str) -> Tuple[Dict, str, str]:
        """Extract frontmatter and content from markdown file"""
        if content.startswith('---\n'):
            parts = content.split('---\n', 2)
            if len(parts) >= 3:
                try:
                    frontmatter = yaml.safe_load(parts[1]) or {}
                    body = parts[2]
                    return frontmatter, parts[1], body
                except:
                    pass
        return {}, "", content
    
    def analyze_content(self, content: str, title: str) -> Dict[str, float]:
        """Analyze content and return tag scores"""
        content_lower = content.lower()
        title_lower = title.lower()
        
        # Combine title and content, giving title more weight
        full_text = title_lower + ' ' + title_lower + ' ' + content_lower
        
        tag_scores = {}
        
        for tag, rules in self.tag_rules.items():
            score = 0
            
            # Check keywords
            for keyword in rules.get('keywords', []):
                # Title matches are worth more
                if keyword in title_lower:
                    score += 3
                # Count occurrences in content
                score += full_text.count(keyword) * 0.5
            
            # Check phrases
            for phrase in rules.get('phrases', []):
                if phrase in title_lower:
                    score += 5
                score += full_text.count(phrase) * 1
            
            if score > 0:
                tag_scores[tag] = score
        
        # Add industry tags
        if 'insurance' in full_text:
            tag_scores['insurance'] = 2
        elif 'lending' in full_text or 'loan' in full_text or 'mortgage' in full_text:
            tag_scores['lending'] = 2
        elif 'education' in full_text or 'student' in full_text:
            tag_scores['education'] = 2
        elif 'legal' in full_text or 'attorney' in full_text:
            tag_scores['legal'] = 2
        else:
            tag_scores['universal'] = 1
        
        # Add lifecycle stage based on content
        if 'getting started' in full_text or 'introduction' in full_text:
            tag_scores['implementation'] = 3
        elif 'optimize' in full_text or 'improve' in full_text or 'advanced' in full_text:
            tag_scores['optimization'] = 3
        else:
            tag_scores['operation'] = 2
        
        # Add technical depth
        if any(word in full_text for word in ['code', 'api', 'function', 'script', 'sdk']):
            tag_scores['technical'] = 3
        elif any(word in full_text for word in ['configure', 'setting', 'option']):
            tag_scores['semi-technical'] = 2
        else:
            tag_scores['non-technical'] = 1
        
        return tag_scores
    
    def determine_tags(self, tag_scores: Dict[str, float]) -> Tuple[List[str], List[str]]:
        """Determine primary and secondary tags from scores"""
        if not tag_scores:
            return [], []
        
        # Sort tags by score
        sorted_tags = sorted(tag_scores.items(), key=lambda x: x[1], reverse=True)
        
        primary_tags = []
        secondary_tags = []
        
        # Rules for primary tags (main purpose)
        user_roles = ['buyer-focused', 'seller-focused', 'developer-focused', 'admin-focused']
        experience_levels = ['beginner', 'intermediate', 'advanced']
        content_types = ['how-to', 'conceptual', 'reference', 'troubleshooting', 'best-practices']
        feature_areas = ['flows', 'data-management', 'business-logic', 'integrations', 'analytics', 'compliance']
        
        # Select primary tags (strongest signals for main purpose)
        for tag, score in sorted_tags:
            if len(primary_tags) >= 7:  # Limit primary tags
                break
                
            # User role (pick top one)
            if tag in user_roles and not any(t in primary_tags for t in user_roles):
                if score >= 2:  # Minimum score threshold
                    primary_tags.append(tag)
            
            # Experience level (pick top one)
            elif tag in experience_levels and not any(t in primary_tags for t in experience_levels):
                if score >= 1:
                    primary_tags.append(tag)
            
            # Content type (can have 1-2)
            elif tag in content_types and sum(1 for t in primary_tags if t in content_types) < 2:
                if score >= 2:
                    primary_tags.append(tag)
            
            # Feature areas (can have 1-2)
            elif tag in feature_areas and sum(1 for t in primary_tags if t in feature_areas) < 2:
                if score >= 3:
                    primary_tags.append(tag)
            
            # Special high-scoring tags
            elif tag in ['trustedform', 'leadsbridge'] and score >= 5:
                primary_tags.append(tag)
        
        # Select secondary tags (related/referenced topics)
        for tag, score in sorted_tags:
            if tag not in primary_tags and score >= 1:
                # Add as secondary if it's a valid but lower-scoring tag
                if len(secondary_tags) < 5:  # Limit secondary tags
                    # Don't add conflicting tags
                    if tag == 'technical' and 'non-technical' in primary_tags:
                        continue
                    if tag == 'non-technical' and 'technical' in primary_tags:
                        continue
                    if tag in experience_levels and any(t in primary_tags for t in experience_levels):
                        continue
                    
                    secondary_tags.append(tag)
        
        # Always add a lifecycle stage if missing
        lifecycle_stages = ['evaluation', 'implementation', 'operation', 'optimization']
        if not any(t in primary_tags + secondary_tags for t in lifecycle_stages):
            if 'beginner' in primary_tags:
                secondary_tags.append('implementation')
            elif 'advanced' in primary_tags:
                secondary_tags.append('optimization')
            else:
                secondary_tags.append('operation')
        
        # Add industry tag if missing
        industry_tags = ['insurance', 'lending', 'education', 'legal', 'universal']
        if not any(t in primary_tags + secondary_tags for t in industry_tags):
            secondary_tags.append('universal')
        
        return primary_tags, secondary_tags
    
    def update_file(self, file_path: Path) -> bool:
        """Update a single markdown file with tags"""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            frontmatter, original_yaml, body = self.extract_frontmatter(content)
            
            # Skip if already has tags
            if 'tags' in frontmatter and 'secondary_tags' in frontmatter:
                print(f"  Skipping {file_path.name} - already tagged")
                return False
            
            # Get title from frontmatter or filename
            title = frontmatter.get('Page Title', file_path.stem)
            
            # Analyze content
            tag_scores = self.analyze_content(body, title)
            primary_tags, secondary_tags = self.determine_tags(tag_scores)
            
            # Update frontmatter
            frontmatter['tags'] = primary_tags
            frontmatter['secondary_tags'] = secondary_tags
            
            # Write back
            new_content = f"---\n{yaml.dump(frontmatter, default_flow_style=False, sort_keys=False)}---\n{body}"
            
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            
            print(f"  Tagged {file_path.name}:")
            print(f"    Primary: {', '.join(primary_tags)}")
            print(f"    Secondary: {', '.join(secondary_tags)}")
            
            return True
            
        except Exception as e:
            print(f"  Error processing {file_path.name}: {e}")
            return False
    
    def run(self):
        """Process all Bloomfire articles"""
        print("Tagging Bloomfire Articles")
        print("=" * 60)
        
        # Find all markdown files
        md_files = list(self.content_dir.glob("*.md"))
        print(f"Found {len(md_files)} markdown files\n")
        
        # Process each file
        for file_path in sorted(md_files):
            if self.update_file(file_path):
                self.files_updated += 1
            self.tags_analyzed += 1
        
        # Summary
        print("\n" + "=" * 60)
        print("SUMMARY")
        print("=" * 60)
        print(f"Files analyzed: {self.tags_analyzed}")
        print(f"Files updated: {self.files_updated}")

def main():
    """Main entry point"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Tag Bloomfire articles with primary and secondary tags')
    parser.add_argument('--base-dir', default='.', help='Base directory of the project')
    
    args = parser.parse_args()
    
    tagger = ArticleTagger(base_dir=args.base_dir)
    tagger.run()

if __name__ == '__main__':
    main()