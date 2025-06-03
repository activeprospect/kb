---
tags:
  - buyer-focused
  - intermediate
  - how-to
  - data-management
  - quality-control
  - integrations
  - semi-technical
---

# Content Filtering with SuppressionList

Filter unwanted content from your leads by checking against custom word lists. This guide shows you how to implement content filtering for profanity, spam indicators, or any other unwanted text patterns.

## 📍 You Are Here

You're learning to use SuppressionList as a content filter to automatically reject leads containing specific words or phrases. This technique helps maintain lead quality by filtering out unreliable or inappropriate submissions.

## 🎯 What You'll Build

- Custom content filter lists
- Automated content checking in your flow
- Multi-field filtering strategies
- Proper rejection handling

## 🛠️ Step-by-Step Implementation

### Step 1: Create Your Filter List

First, prepare your list of words to filter:

1. **Create a CSV File**
   - One word or phrase per line
   - Save as `.csv` format
   - Example content:
   ```
   spam
   test
   fake
   inappropriate_word1
   inappropriate_word2
   ```

2. **Consider Variations**
   - Include common misspellings
   - Add variations with numbers (e.g., "test123")
   - Remember: SuppressionList ignores capitalization

### Step 2: Upload to SuppressionList

1. **Access SuppressionList**
   - Log into your SuppressionList dashboard
   - Click "Create New List"

2. **Configure Your List**
   - Name: "Content Filter - Profanity" (or appropriate name)
   - Description: "Words to filter from lead submissions"
   - Auto-pruning: Set to "Never" (these are permanent filters)

3. **Import Your Words**
   - Click "Bulk Import"
   - Upload your CSV file
   - Verify the import count matches your list

### Step 3: Add Query Steps to Your Flow

For EACH field you want to check, add a separate query:

#### Configuration That WORKS ✅

**For First Name:**
1. Add Step → Enhancement → SuppressionList Query
2. Configure:
   - List: "Content Filter - Profanity"
   - Query Field: `first_name`
   - Step Name: "Check First Name Content"

3. Add Filter immediately after:
   - Rule: `appended.suppressionlist.query_item_found is true`
   - Action: Stop with reason "Inappropriate content in first name"

**For Last Name:**
1. Add another SuppressionList Query step
2. Configure:
   - List: Same list
   - Query Field: `last_name`
   - Step Name: "Check Last Name Content"

3. Add Filter:
   - Rule: `appended.suppressionlist.query_item_found is true`
   - Action: Stop with reason "Inappropriate content in last name"

#### Configuration That FAILS ❌

**DON'T try to check multiple fields in one query:**

❌ **Wrong Approach 1**: Using array syntax
```
Query Field: ["first_name", "last_name"]
```
This will NOT work - SuppressionList doesn't support arrays.

❌ **Wrong Approach 2**: Creating composite field
```
Query Field: {{first_name}} {{last_name}}
```
This creates a single string that won't match individual words.

### Step 4: Complete Pattern for Multiple Fields

Here's the correct pattern for checking multiple fields:

```
Flow Steps:
1. SuppressionList Query - Check First Name
2. Filter: Stop if found
3. SuppressionList Query - Check Last Name  
4. Filter: Stop if found
5. SuppressionList Query - Check Email
6. Filter: Stop if found
7. SuppressionList Query - Check Company
8. Filter: Stop if found
[Continue with rest of flow...]
```

## 🎯 Advanced Filtering Strategies

### Check Message Fields

For longer text fields like comments or messages:

1. **Consider Partial Matching**
   - SuppressionList does exact word matching
   - "badword" will match in "This badword test"
   - Won't match in "thisbadwordtest" (no spaces)

2. **Handle Multi-Word Phrases**
   - Add complete phrases to your list
   - "inappropriate phrase" as single entry
   - Checks for exact phrase match

### Performance Optimization

When checking many fields:

1. **Order by Priority**
   - Check most likely fields first
   - Name fields before comment fields
   - Stop processing on first match

2. **Group Related Checks**
   ```
   === CONTENT FILTERING ===
   Check First Name
   Check Last Name
   Check Email Local Part
   
   === CONTINUE WITH VALIDATION ===
   [Rest of your flow]
   ```

### Different Lists for Different Purposes

Create separate lists for different filtering needs:

1. **Profanity Filter**
   - Inappropriate language
   - Offensive terms

2. **Spam Indicators**
   - "test", "asdf", "qwerty"
   - "123456", "aaaaaa"

3. **Competitor Names**
   - Filter leads mentioning competitors
   - Protect exclusive relationships

4. **High-Risk Terms**
   - Litigation-related terms
   - Compliance red flags

## 💡 Important Considerations

### Case Sensitivity

SuppressionList automatically lowercases all values:
- "Test" and "test" are treated the same
- "SPAM" and "spam" match identically

### Punctuation Matters

Punctuation creates different values:
- "test" ≠ "test!" ≠ "test."
- Consider adding variations or preprocessing

### Whitespace Handling

Leading/trailing spaces are significant:
- " test" ≠ "test" ≠ "test "
- Trim fields before checking if needed

### Performance Impact

Each SuppressionList query adds processing time:
- 4 queries = ~40ms additional time
- Acceptable for most flows
- Consider impact at high volume

## 🚫 Common Mistakes to Avoid

### Mistake 1: Trying to Check Multiple Fields at Once
**Wrong**: One query for all fields
**Right**: Separate query for each field

### Mistake 2: Forgetting the Filter Step
**Wrong**: Query without filter (does nothing)
**Right**: Query + immediate filter

### Mistake 3: Complex Field Combinations
**Wrong**: Creating concatenated fields
**Right**: Check each field independently

### Mistake 4: Not Testing Edge Cases
**Test these scenarios**:
- Mixed case: "TeSt"
- With punctuation: "test!"
- In context: "this is a test"

## 📊 Monitoring and Maintenance

### Track Effectiveness

Monitor in Events:
- How many leads filtered?
- Which words triggered most?
- False positive rate?

### Regular Updates

Schedule monthly reviews:
- Add new problem words
- Remove overly restrictive terms
- Adjust based on lead quality

### Document Your Lists

Maintain documentation:
- Why each word was added
- Date added
- Impact on lead flow

## 🎯 Complete Implementation Example

Here's a full content filtering setup:

```
Pre-Processing:
1. Acceptance Criteria (basic validation)

Content Filtering:
2. SuppressionList Query - Profanity in First Name
3. Filter: Stop if found "Inappropriate first name"
4. SuppressionList Query - Profanity in Last Name
5. Filter: Stop if found "Inappropriate last name"
6. SuppressionList Query - Spam in Email
7. Filter: Stop if found "Spam email pattern"

Continue Processing:
8. Enhancement steps
9. Delivery steps
```

## 📚 Related Documentation

- [Suppression Lists Management](./suppression-lists.md) - Complete suppression guide
- [Filter Steps](../flow-management/filter-routing.md) - Advanced filtering
- [Data Validation](./data-validation.md) - Other validation techniques

---

🛡️ **Quality Protected**: Content filtering helps maintain lead quality by automatically removing inappropriate or unreliable submissions. Start with a conservative list and expand based on your actual lead patterns!