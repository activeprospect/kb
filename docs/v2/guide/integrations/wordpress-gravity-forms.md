---
tags:
  - implementation
  - intermediate
  - how-to
  - integrations
  - wordpress
  - gravity-forms
  - trustedform
  - form-builders
---

# WordPress & Gravity Forms Integration

Connect your WordPress site's Gravity Forms directly to LeadConduit for seamless lead submission. This guide covers installation, configuration, TrustedForm implementation, and advanced customization options.

## 📍 You Are Here

You're setting up Gravity Forms on your WordPress site to automatically submit leads to your LeadConduit flow. This integration enables real-time lead capture from your website forms with full field mapping capabilities and compliance tracking.

## 🎯 What You'll Achieve

- Direct form submission from WordPress to LeadConduit
- Automatic field mapping configuration
- TrustedForm consent tracking implementation
- Multi-step form support
- Custom field handling
- Error handling and validation
- Performance optimization

## 📋 Prerequisites

Before starting, ensure you have:

### WordPress Requirements
- **WordPress 5.0+** installed
- **Administrator access** to WordPress
- **Gravity Forms license** (Basic or higher)
- **SSL certificate** on your website (for TrustedForm)

### LeadConduit Requirements
- Active LeadConduit account
- Flow created and saved
- [Submission documentation](../getting-started/understanding-submission.md) ready
- API credentials if using authentication

## 🚀 Step 1: Install Required Components

### Install Gravity Forms

1. **Purchase and Download**
   - Get your Gravity Forms license from [gravityforms.com](https://www.gravityforms.com)
   - Download the plugin ZIP file

2. **Install in WordPress**
   ```
   WordPress Admin → Plugins → Add New → Upload Plugin
   ```
   - Select the Gravity Forms ZIP
   - Click "Install Now"
   - Activate the plugin

### Install Forms 3rd-Party Integration

3. **Add Integration Plugin**
   - In WordPress: `Plugins → Add New`
   - Search: "Forms 3rd-Party Integration"
   - Install and activate the plugin
   - This enables external submissions

<!-- Image placeholder -->

## 🔧 Step 2: Configure LeadConduit Connection

### Set Up the Integration

1. **Access 3rd-Party Settings**
   ```
   WordPress Admin → Forms → 3rd-party Services
   ```

2. **Configure Submission URL**
   - Find "Submission URL" field
   - Paste your LeadConduit posting URL:
   ```
   https://next.leadconduit.com/v2/flows/YOUR_FLOW_ID/sources/YOUR_SOURCE_ID/submit
   ```
   - Get this from your [Submission Docs](../getting-started/understanding-submission.md)

3. **Set Submission Method**
   - Method: POST
   - Format: Form (application/x-www-form-urlencoded)

### Map Your Fields

4. **Configure Field Mappings**
   Scroll to the "Mapping" section:
   
   | Form Submission Field | 3rd-Party Field | Notes |
   |---------------------|-----------------|-------|
   | First Name | first_name | Standard field |
   | Last Name | last_name | Standard field |
   | Email | email | Validated by Types |
   | Phone | phone_1 | Normalized automatically |
   | Message | comments | Custom field |

   ⚠️ **Important**: Only single underscore fields work (e.g., `input_1` ✓, `input_1.1` ✗)

## 🔐 Step 3: Implement TrustedForm

### Add TrustedForm Script

1. **Get Your TrustedForm Script**
   - Log into TrustedForm account
   - Navigate to Certify tab
   - Copy the JavaScript snippet

2. **Add HTML Block to Form**
   - Edit your Gravity Form
   - Drag "HTML" field from Standard Fields
   - Place it **just before** the Submit button
   - Paste the TrustedForm script:

   ```html
   <script type="text/javascript">
     (function() {
       var tf = document.createElement('script');
       tf.type = 'text/javascript'; tf.async = true;
       tf.src = ('https:' == document.location.protocol ? 'https' : 'http') + 
         '://api.trustedform.com/trustedform.js?field=xxTrustedFormCertUrl&ping_field=xxTrustedFormPingUrl&l=' + 
         new Date().getTime() + Math.random();
       var s = document.getElementsByTagName('script')[0]; 
       s.parentNode.insertBefore(tf, s);
     })();
   </script>
   ```

### Configure Hidden Field for Certificate

3. **Add Hidden Field**
   - Add a "Hidden Field" to your form
   - Note the field ID (e.g., "6")
   - Gravity Forms names it `input_6`

4. **Update TrustedForm Configuration**
   - Go to TrustedForm Certify tab
   - Update "Field" setting to match your hidden field name
   - Copy the updated script
   - Replace the script in your HTML block

<!-- Image placeholder -->

## 🎯 Step 4: Advanced Configurations

### Multi-Step Form Support

For multi-page Gravity Forms:

1. **Place Script on First Page**
   - Add TrustedForm script to page 1 only
   - Hidden field can be on any page

2. **Maintain Session**
   - TrustedForm tracks across pages automatically
   - Certificate URL persists through form navigation

### Conditional Logic

Handle conditional fields properly:

```php
// Add to your theme's functions.php
add_filter('gform_field_value_xxTrustedFormCertUrl', function($value) {
    // Only populate if conditions met
    if (/* your conditions */) {
        return $value;
    }
    return '';
});
```

### Custom Validation

Add server-side validation:

```php
add_filter('gform_validation', function($validation_result) {
    $form = $validation_result['form'];
    
    foreach($form['fields'] as &$field) {
        if($field->inputName == 'email') {
            $value = rgpost("input_{$field->id}");
            if(!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                $field->failed_validation = true;
                $field->validation_message = 'Please enter a valid email';
                $validation_result['is_valid'] = false;
            }
        }
    }
    
    $validation_result['form'] = $form;
    return $validation_result;
});
```

## 🔄 Testing Your Integration

### Submit Test Lead

1. **Preview Your Form**
   - Use Gravity Forms preview
   - Fill all fields with test data
   - Submit the form

2. **Verify in Browser**
   - Open browser developer tools (F12)
   - Search for `xxTrustedFormCertUrl`
   - Should contain: `https://cert.trustedform.com/...`

3. **Check LeadConduit**
   - Go to Events in your flow
   - Find your test submission
   - Verify all fields mapped correctly
   - Confirm TrustedForm certificate present

### Common Test Values

| Field | Test Value | Expected Result |
|-------|-----------|----------------|
| Email | test@example.com | Valid, normalized |
| Phone | (555) 123-4567 | Normalized to 5551234567 |
| First Name | Test | Capitalized |
| Last Name | User | Capitalized |

## 🚫 Troubleshooting

### "Fields Not Mapping"

**Problem**: Form data not appearing in LeadConduit
**Solutions**:
1. Check field input names (must have single underscore)
2. Verify mapping configuration in 3rd-Party settings
3. Ensure form is published (not draft)
4. Check LeadConduit field names match exactly

### "TrustedForm Certificate Missing"

**Problem**: No certificate URL in submissions
**Solutions**:
1. Verify script placement (before submit button)
2. Check hidden field ID matches configuration
3. Ensure SSL certificate on website
4. Test in incognito/private browsing

### "Form Submission Errors"

**Problem**: Forms fail to submit
**Solutions**:
1. Check WordPress error logs
2. Verify LeadConduit posting URL
3. Test with minimal fields first
4. Disable other form plugins temporarily

### "Validation Not Working"

**Problem**: Invalid data reaching LeadConduit
**Solutions**:
1. Add Gravity Forms validation rules
2. Implement server-side validation
3. Use LeadConduit acceptance criteria
4. Check field type configuration

## 💡 Best Practices

### Performance Optimization

**Async Loading**: Load forms asynchronously for better page speed:
```javascript
// Add to your theme
window.addEventListener('load', function() {
    // Initialize Gravity Forms
});
```

**Minimize Fields**: Only collect essential data to improve conversion.

**Progressive Disclosure**: Use multi-step forms for complex data collection.

### Security Considerations

**SSL Required**: Always use HTTPS for forms collecting personal data.

**Input Sanitization**: Gravity Forms handles this, but verify in LeadConduit.

**Rate Limiting**: Implement to prevent spam:
```php
// Limit submissions per IP
add_filter('gform_pre_render', 'limit_form_submissions');
```

### Compliance Tips

**Consent Language**: Add clear consent text above submit button.

**Privacy Policy**: Link to privacy policy on the form.

**Data Retention**: Configure both WordPress and LeadConduit retention policies.

## 📊 Success Checklist

- [ ] Gravity Forms installed and activated
- [ ] Forms 3rd-Party Integration configured
- [ ] LeadConduit posting URL set
- [ ] Field mappings configured
- [ ] TrustedForm script implemented
- [ ] Hidden field properly configured
- [ ] Test lead submitted successfully
- [ ] All fields appearing in LeadConduit
- [ ] TrustedForm certificate captured
- [ ] Production form tested

## 🔧 Advanced Integrations

### AJAX Form Submission

Enable AJAX for better user experience:

```php
// In your form shortcode
[gravityform id="1" ajax="true"]
```

### Custom Success Handling

```javascript
jQuery(document).on('gform_confirmation_loaded', function(event, formId){
    // Custom success tracking
    gtag('event', 'form_submit', {
        'form_id': formId,
        'form_name': 'Contact Form'
    });
});
```

### Dynamic Field Population

Pre-fill forms with URL parameters:
```
https://yoursite.com/contact?email=user@example.com&source=google
```

Configure in Gravity Forms:
- Enable "Allow field to be populated dynamically"
- Set parameter name
- LeadConduit receives pre-filled values

## 📚 Related Documentation

- [Source Configuration](../getting-started/adding-sources.md) - General source setup
- [Field Types & Validation](../data-management/field-configuration.md) - Data standardization
- [TrustedForm Implementation](../compliance/implementing-trustedform.md) - Detailed consent tracking
- [Testing Your Flow](../getting-started/testing-your-flow.md) - Comprehensive testing guide

---

🔌 **WordPress Connected**: Your Gravity Forms now flow seamlessly into LeadConduit, complete with validation, consent tracking, and real-time delivery. Every form submission is instantly available for routing, enhancement, and delivery to your recipients!