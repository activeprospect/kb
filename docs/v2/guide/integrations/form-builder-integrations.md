---
tags:
  - implementation
  - intermediate
  - how-to
  - integrations
  - form-builders
  - trustedform
  - third-party-tools
---

# Form Builder Integrations Guide

Connect popular form builders like 123FormBuilder, Formidable Forms, and Landbot to LeadConduit. This comprehensive guide covers setup, TrustedForm implementation, and best practices for each platform.

## 📍 You Are Here

You're integrating third-party form builders with LeadConduit to capture and process leads from various platforms. Each builder has unique implementation requirements, but all enable direct lead submission to your flows.

## 🎯 What You'll Achieve

- Direct integration with multiple form builders
- TrustedForm implementation across platforms
- Consistent lead data collection
- Platform-specific optimizations
- Unified lead processing workflow

## 📋 Prerequisites

Before starting any integration:

### General Requirements
- Active LeadConduit account with configured flow
- [Submission documentation](../getting-started/understanding-submission.md) ready
- TrustedForm account (for consent tracking)
- SSL certificate on form hosting domain

### Platform-Specific Requirements
- **123FormBuilder**: Starter plan or higher
- **Formidable Forms**: WordPress installation with plugin
- **Landbot**: Starter plan for custom code access

---

## 🔧 123FormBuilder Integration

### Overview

123FormBuilder requires hosting the TrustedForm script externally and referencing it via URL. This approach provides flexibility but requires additional setup.

### Step 1: Set Up Your Form

1. **Access Your Form**
   - Log into 123FormBuilder
   - Select existing form or create new
   - Navigate to form editor

2. **Configure Basic Settings**
   - Click **Set up** tab
   - Configure form fields
   - Set up validation rules

### Step 2: Implement TrustedForm

3. **Create JavaScript File**
   Create a file named `trustedform-123.js`:
   ```javascript
   (function() {
     var tf = document.createElement('script');
     tf.type = 'text/javascript'; 
     tf.async = true;
     tf.src = ('https:' == document.location.protocol ? 'https' : 'http') + 
       '://api.trustedform.com/trustedform.js?field=xxTrustedFormCertUrl&ping_field=xxTrustedFormPingUrl&l=' + 
       new Date().getTime() + Math.random();
     var s = document.getElementsByTagName('script')[0]; 
     s.parentNode.insertBefore(tf, s);
   })();
   ```

4. **Host the JavaScript File**
   - Upload to your web server
   - Ensure HTTPS access
   - Note the full URL (e.g., `https://yourdomain.com/scripts/trustedform-123.js`)

   ⚠️ **Security Note**: Host on a server you control. Avoid third-party JavaScript hosting services.

5. **Add Script to Form**
   - In form editor, click **Advanced** → **Form** tab
   - Select "Add a JS script to your form"
   - Enter your hosted script URL
   - Click **Save**

### Step 3: Configure LeadConduit Submission

6. **Set Up Webhook**
   - In 123FormBuilder, go to **Integrations**
   - Add new webhook integration
   - Enter LeadConduit posting URL
   - Configure field mappings

### Field Mapping Example

| 123FormBuilder Field | LeadConduit Field | Notes |
|---------------------|-------------------|-------|
| Name | first_name, last_name | May need splitting |
| Email | email | Validated by Types |
| Phone | phone_1 | Normalized automatically |
| Message | comments | Custom field |
| {Hidden} | trustedform_cert_url | Certificate URL |

### Testing Your Integration

```bash
# Test submission validation
curl -X POST https://next.leadconduit.com/v2/flows/YOUR_FLOW/sources/YOUR_SOURCE/submit \
  -d "first_name=Test" \
  -d "last_name=User" \
  -d "email=test@example.com" \
  -d "trustedform_cert_url=https://cert.trustedform.com/test"
```

---

## 🎨 Formidable Forms Integration

### Overview

Formidable Forms integrates directly within WordPress, allowing native HTML block implementation for TrustedForm.

### Step 1: Install and Configure

1. **Install Formidable Forms**
   - In WordPress: `Plugins → Add New`
   - Search "Formidable Forms"
   - Install and activate

2. **Create Your Form**
   - Navigate to `Formidable → Forms`
   - Click **Add New** or edit existing
   - Build your form structure

### Step 2: Add TrustedForm Script

3. **Insert HTML Block**
   - In form builder, click **Build** tab
   - From left sidebar, click `</> HTML`
   - Drag HTML block **before submit button**

4. **Add TrustedForm Code**
   - Click the HTML block
   - In left sidebar, find "Content" area
   - Paste TrustedForm script:
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
   - Click **Update**

### Step 3: Configure Submission

5. **Set Up Actions**
   - In form settings, go to **Actions & Notifications**
   - Add new action: "Send API data"
   - Configure endpoint and authentication

6. **Map Fields**
   ```
   Endpoint: https://next.leadconduit.com/v2/flows/YOUR_FLOW/sources/YOUR_SOURCE/submit
   Method: POST
   Format: Form
   ```

### Advanced Formidable Configuration

**Conditional Logic**:
```php
// Add to theme functions.php
add_filter('frm_validate_field_entry', 'custom_validation', 10, 3);
function custom_validation($errors, $posted_field, $posted_value){
    if($posted_field->id == 25){ // Your field ID
        if(!preg_match('/^[0-9]{10}$/', $posted_value)){
            $errors['field'. $posted_field->id] = 'Phone must be 10 digits';
        }
    }
    return $errors;
}
```

**Dynamic Population**:
```php
add_filter('frm_get_default_value', 'populate_default', 10, 2);
function populate_default($new_value, $field){
    if($field->id == 30){
        $new_value = $_GET['source'] ?? 'website';
    }
    return $new_value;
}
```

---

## 🤖 Landbot Integration

### Overview

Landbot's conversational interface requires special handling for TrustedForm implementation and lead data collection.

### Step 1: Create Your Bot

1. **Set Up Bot Flow**
   - Log into Landbot
   - Create new bot or edit existing
   - Switch to **Build mode**

2. **Add Form Component**
   - Click **Advanced** → **Questions** → **Forms**
   - Design your form fields
   - Configure validation

### Step 2: Implement TrustedForm

3. **Access Custom Code**
   - Click **Design** at top
   - Select **Custom code**
   - Requires Starter plan or higher

4. **Add JavaScript**
   Under "Add JS (Custom scripts)":
   ```javascript
   // TrustedForm implementation for Landbot
   (function() {
     // Create script element
     var tf = document.createElement('script');
     tf.type = 'text/javascript'; 
     tf.async = true;
     tf.src = 'https://api.trustedform.com/trustedform.js?field=xxTrustedFormCertUrl&ping_field=xxTrustedFormPingUrl&l=' + 
       new Date().getTime() + Math.random();
     
     // Append to document
     var s = document.getElementsByTagName('script')[0]; 
     s.parentNode.insertBefore(tf, s);
     
     // Store certificate in Landbot variable
     window.addEventListener('tf:cert:created', function(e) {
       Landbot.exec('setCustomData', {
         trustedform_cert_url: e.detail.certUrl
       });
     });
   })();
   ```
   - Click **Apply**

### Step 3: Configure Webhook

5. **Set Up Integration**
   - In bot flow, add **Webhook** block
   - Configure endpoint:
   ```
   URL: https://next.leadconduit.com/v2/flows/YOUR_FLOW/sources/YOUR_SOURCE/submit
   Method: POST
   Headers: Content-Type: application/json
   ```

6. **Map Variables**
   ```json
   {
     "first_name": "@{name}",
     "email": "@{email}",
     "phone_1": "@{phone}",
     "trustedform_cert_url": "@{trustedform_cert_url}",
     "bot_conversation_id": "@{conversation_id}"
   }
   ```

### Landbot-Specific Features

**Conversation Tracking**:
```javascript
// Track conversation flow
Landbot.on('conversation:started', function() {
  // Track start
  gtag('event', 'bot_started');
});

Landbot.on('form:submitted', function() {
  // Track completion
  gtag('event', 'form_completed');
});
```

**Conditional Routing**:
```javascript
// Route based on responses
if (Landbot.data.interest === 'insurance') {
  Landbot.exec('jump', 'insurance_flow');
} else {
  Landbot.exec('jump', 'general_flow');
}
```

---

## 🔧 Common Implementation Patterns

### Error Handling Across Platforms

**Generic Error Handler**:
```javascript
function handleSubmissionError(error) {
  console.error('Submission failed:', error);
  
  // User notification
  if (typeof showError === 'function') {
    showError('We encountered an issue. Please try again.');
  }
  
  // Track error
  if (typeof gtag !== 'undefined') {
    gtag('event', 'form_error', {
      'error_type': error.type || 'unknown',
      'form_builder': 'current_platform'
    });
  }
}
```

### Validation Patterns

**Email Validation**:
```javascript
function validateEmail(email) {
  const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return pattern.test(email);
}
```

**Phone Normalization**:
```javascript
function normalizePhone(phone) {
  return phone.replace(/\D/g, '').slice(-10);
}
```

### TrustedForm Verification

**Check Certificate Status**:
```javascript
function verifyCertificate() {
  const certField = document.querySelector('[name="xxTrustedFormCertUrl"]');
  if (certField && certField.value) {
    console.log('Certificate URL:', certField.value);
    return true;
  }
  console.error('No certificate found');
  return false;
}
```

---

## 🚫 Troubleshooting

### Platform-Agnostic Issues

**"Certificate Not Captured"**
- Verify SSL certificate on domain
- Check script placement (before submit)
- Test in incognito mode
- Confirm script loads without errors

**"Fields Not Mapping"**
- Verify exact field names in LeadConduit
- Check JSON formatting (Landbot)
- Confirm webhook URL is correct
- Test with minimal fields first

### 123FormBuilder Specific

**"Script Not Loading"**
- Verify hosted file is accessible
- Check HTTPS configuration
- Test direct script URL in browser
- Monitor browser console for errors

### Formidable Forms Specific

**"WordPress Conflicts"**
- Deactivate other form plugins
- Check theme compatibility
- Verify WordPress version
- Review PHP error logs

### Landbot Specific

**"Variables Not Passing"**
- Check variable naming (@{variable})
- Verify custom data storage
- Test webhook independently
- Review conversation flow logic

---

## 💡 Best Practices

### Security Considerations

1. **Always Use HTTPS**: All form pages must have SSL certificates
2. **Validate Server-Side**: Don't rely only on client-side validation
3. **Sanitize Input**: Clean data before submission to LeadConduit
4. **Monitor Scripts**: Regularly check external script availability

### Performance Optimization

1. **Async Loading**: Load scripts asynchronously
2. **Minimize Fields**: Only collect necessary data
3. **Cache Scripts**: Use CDN for hosted scripts
4. **Test Load Times**: Monitor form performance

### Compliance Guidelines

1. **Clear Consent**: Display consent language prominently
2. **Privacy Links**: Include privacy policy links
3. **Data Retention**: Configure appropriate retention
4. **Access Controls**: Limit form admin access

---

## 📊 Success Metrics

Track these KPIs across all platforms:

| Metric | Target | Measurement |
|--------|--------|-------------|
| Form Completion Rate | >60% | Submissions/Views |
| Certificate Capture Rate | >95% | Certs/Submissions |
| Submission Success Rate | >98% | Success/Total |
| Average Response Time | <500ms | API monitoring |
| Error Rate | <2% | Errors/Submissions |

---

## 🎯 Platform Comparison

| Feature | 123FormBuilder | Formidable | Landbot |
|---------|---------------|------------|---------|
| Setup Complexity | Medium | Low | Medium |
| TrustedForm Method | External JS | Inline HTML | Custom Code |
| Conditional Logic | ✓ | ✓ | ✓ |
| Multi-step Forms | ✓ | ✓ | Conversations |
| WordPress Required | ✗ | ✓ | ✗ |
| API Flexibility | Good | Excellent | Good |
| Visual Builder | ✓ | ✓ | ✓ |
| Price Point | $$ | $ | $$$ |

---

## 📚 Related Documentation

- [General Source Configuration](../getting-started/adding-sources.md)
- [Field Types & Validation](../data-management/field-configuration.md)
- [TrustedForm Deep Dive](../compliance/implementing-trustedform.md)
- [Webhook Configuration](./webhooks-and-apis.md)
- [Testing Strategies](../getting-started/testing-your-flow.md)

---

🎨 **Form Builders Connected**: You now have the knowledge to integrate any of these popular form builders with LeadConduit. Each platform offers unique advantages - choose based on your specific needs, technical requirements, and user experience goals!