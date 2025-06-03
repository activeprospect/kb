# Suppression Lists Management

Suppression lists are your defense against duplicates, unwanted contacts, and compliance violations. This guide shows you how to implement effective suppression strategies, from basic duplicate checking to advanced multi-list configurations.

## 📍 You Are Here

You're learning to use suppression lists to control which leads enter your flow. Whether preventing duplicates, honoring DNC requests, or excluding existing customers, suppression lists ensure you only process the leads you want.

## 🎯 What You'll Master

- Basic duplicate prevention
- Advanced rapid-fire deduplication
- DNC and exclusion list management
- Multi-list strategies
- Performance optimization

## 🔑 Understanding Suppression Lists

### What They Do

Suppression lists store values (like phone numbers or emails) that you want to check against incoming leads. When a match is found, you can reject the lead or take other actions.

### Common Use Cases

1. **Duplicate Prevention** - Block leads you've already received
2. **DNC Lists** - Honor do-not-call requests
3. **Existing Customers** - Prevent remarketing to current clients
4. **Geographic Restrictions** - Block specific area codes
5. **Known Litigators** - Exclude high-risk contacts

## 🛠️ Method 1: Query → Filter → Add (Standard Approach)

This is the simplest and most common pattern for duplicate checking.

### Step 1: Add Query Step

1. In your flow steps, click **Add Step**
2. Choose **Enhancement** → **SuppressionList Query**
3. Configure:
   - **List**: Select or create your duplicate list
   - **Query Field**: Choose the field to check (e.g., `phone` or `email`)
   - **Name**: "Check Duplicates"

### Step 2: Add Filter Step

Immediately after the query, add a filter:

1. **Add Step** → **Filter**
2. Configure the rule:
   ```
   Rule: appended.suppressionlist.query_item_found is false
   On match: Continue processing
   On no match: Stop with "Duplicate lead"
   ```

### Step 3: Add to List (End of Flow)

For accepted leads, add them to your duplicate list:

1. Near the end of your flow, **Add Step** → **Enhancement**
2. Choose **SuppressionList Add**
3. Configure:
   - **Same list** as your query
   - **Same field** to add
   - **Name**: "Add to Duplicate List"

### Complete Pattern

```
1. SuppressionList Query (check if duplicate)
2. Filter (reject if found)
3. [... rest of your flow ...]
4. SuppressionList Add (add new leads)
```

💡 **Pro tip**: Place the Add step after all your acceptance logic so only good leads get added to the list.

## 🚀 Method 2: Query & Add → Filter → Delete (Rapid-Fire Protection)

This method catches duplicates submitted milliseconds apart, before the first lead finishes processing.

### How It Works

The "Query & Add" step simultaneously:
1. Adds the value to the list
2. Checks if it was already there
3. Returns `is_unique` = false if it was a duplicate

### Implementation

1. **Add Step** → **Enhancement** → **SuppressionList Query & Add**
2. Configure:
   - **List**: Your duplicate list
   - **Field**: Key field to check
   - Returns: `appended.suppressionlist.is_unique`

3. **Add Filter** immediately after:
   ```
   Rule: appended.suppressionlist.is_unique is true
   On match: Continue
   On no match: Stop with "Duplicate submission"
   ```

4. **Add Delete Steps** before any rejection points:
   - Before each filter that might reject
   - Configure with same list/field
   - Use step rules to match filter conditions

⚠️ **Complexity Warning**: This method requires careful maintenance as you need delete steps for every rejection point.

## 🎯 Best Practice: Hybrid Approach with Auto-Pruning

Combine both methods for optimal duplicate protection with minimal complexity:

### Step 1: Create Rapid-Fire List

1. In SuppressionList dashboard, create new list
2. Name: "Rapid Fire Duplicates"
3. **Set Auto-Pruning**: 1 minute
4. This list self-cleans!

### Step 2: Implement Two-Layer Check

At the **top** of your flow:
```
1. SuppressionList Query & Add (rapid-fire list)
2. Filter: is_unique is false → Stop "Rapid duplicate"
```

After that initial check:
```
3. SuppressionList Query (main duplicate list)  
4. Filter: query_item_found is true → Stop "Duplicate"
```

At the **end** of your flow:
```
5. SuppressionList Add (main duplicate list)
```

### Why This Works

- Rapid-fire list catches same-second duplicates
- Auto-pruning means no delete steps needed
- Main list provides long-term duplicate checking
- Simple to maintain

## 📋 Managing Other Suppression Lists

### DNC Lists

For Do-Not-Call compliance:

1. **Create List**: "DNC Numbers"
2. **Import**: Upload your DNC file (CSV format)
3. **Query Early**: Check before any processing
4. **No Add Step**: Manually maintained

```
Flow Pattern:
1. SuppressionList Query (DNC list)
2. Filter: query_item_found is true → Stop "DNC listed"
```

### Existing Customer Lists

Prevent remarketing to current clients:

1. **Create List**: "Current Customers"  
2. **Update Method**:
   - Manual import from CRM
   - Or automated via API
3. **Consider Expiration**: Remove after win-back period

### Geographic Exclusions

Block specific regions:

1. **Create List**: "Excluded Area Codes"
2. **Import**: List of area codes to block
3. **Query**: Check `phone.area` field
4. **Maintain**: Update as territories change

## 🔧 Advanced Configuration

### Multi-Field Duplicate Checking

Check multiple fields for duplicates:

```
Option 1: Composite Key
- Create custom field: phone_email
- Template: {{phone}}_{{email}}
- Query this composite field

Option 2: Multiple Lists
- Phone duplicate list
- Email duplicate list
- Check both separately
```

### Time-Based Suppression

For temporary exclusions:

1. Use **Auto-Pruning** for time limits:
   - 30 days for recent inquiries
   - 90 days for cool-down periods
   - 1 year for annual campaigns

2. Or use **Manual Pruning**:
   - Schedule regular list cleanups
   - Export before pruning for records

### Performance Optimization

For high-volume flows:

1. **Order Queries Efficiently**:
   - Most likely matches first
   - Smallest lists first
   - Critical checks early

2. **Use Appropriate Match Types**:
   - Exact match for phones/emails
   - Consider normalized formats

3. **Limit List Sizes**:
   - Archive old entries
   - Use pruning strategically

## 🚫 Common Issues and Solutions

### "Duplicates Still Getting Through"

1. **Check Timing**: Use rapid-fire method
2. **Verify Normalization**: Ensure consistent formats
3. **Review Placement**: Query before any branches

### "False Duplicates"

1. **Check Capitalization**: SuppressionList ignores case
2. **Watch Punctuation**: "O'Brien" ≠ "OBrien"
3. **Trim Whitespace**: Leading/trailing spaces matter

### "Performance Degradation"

1. **Prune Lists**: Remove old entries
2. **Optimize Queries**: Check list sizes
3. **Review Step Order**: Move queries earlier

## 💡 Best Practices

**Place Filters Immediately**: Always put filters right after queries to avoid confusion with multiple queries.

**Document List Purpose**: Name lists clearly: "90-Day Phone Duplicates" not "List 1".

**Test with Known Values**: Add test entries to verify queries work correctly.

**Monitor List Growth**: Set up alerts for lists growing too large.

**Regular Maintenance**: Schedule monthly reviews of list sizes and effectiveness.

## 📊 Implementation Checklist

- [ ] Identify what needs suppression (duplicates, DNC, etc.)
- [ ] Create appropriately named lists
- [ ] Configure auto-pruning where applicable
- [ ] Implement query steps early in flow
- [ ] Add filters immediately after queries
- [ ] Place add steps after acceptance
- [ ] Test with known duplicates
- [ ] Document your suppression strategy
- [ ] Schedule regular maintenance

## 📚 Related Documentation

- [Filter Steps Guide](../flow-management/filter-routing.md) - Advanced filtering
- [Data Validation](./data-validation.md) - Quality control strategies
- [Acceptance Criteria](../flow-management/acceptance-criteria.md) - Pre-processing rules

---

🛡️ **Protection Achieved**: Well-configured suppression lists protect your business from duplicates, ensure compliance, and improve lead quality. Start simple with basic duplicate checking, then expand as your needs grow!