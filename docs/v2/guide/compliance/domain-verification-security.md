# Domain Verification & Security

Secure your lead operations with proper domain verification, form whitelisting, and data protection. Master security best practices to protect your business and maintain compliance.

## 📍 You Are Here

You need to verify domain ownership, implement form whitelisting, secure sensitive data, or establish security protocols for your lead operations. This guide covers comprehensive security measures.

## 🎯 What You'll Learn

- Domain verification process
- Form whitelisting
- Data security measures
- Access control
- Security monitoring
- Incident response

## 🔐 Domain Verification

### Why Verify Domains?

Domain verification provides:

```javascript
const verificationBenefits = {
  trust: {
    description: 'Proves legitimate ownership',
    impact: 'Buyers trust verified sources',
    compliance: 'Required by many networks'
  },
  
  security: {
    description: 'Prevents domain spoofing',
    impact: 'Protects against fraud',
    monitoring: 'Enables security alerts'
  },
  
  control: {
    description: 'Manage all forms on domain',
    impact: 'Centralized configuration',
    features: 'Bulk operations enabled'
  },
  
  analytics: {
    description: 'Domain-level insights',
    impact: 'Better performance tracking',
    reporting: 'Aggregated metrics'
  }
};
```

### Verification Methods

Multiple verification options:

```javascript
const verificationMethods = {
  dns_txt: {
    name: 'DNS TXT Record',
    difficulty: 'Medium',
    time: '5-60 minutes',
    permanent: true,
    
    steps: [
      'Get verification code',
      'Add TXT record to DNS',
      'Wait for propagation',
      'Verify in system'
    ],
    
    example: {
      type: 'TXT',
      name: '_verification',
      value: 'leadconduit-verify=abc123xyz789'
    }
  },
  
  file_upload: {
    name: 'HTML File Upload',
    difficulty: 'Easy',
    time: '5 minutes',
    permanent: false,
    
    steps: [
      'Download verification file',
      'Upload to root directory',
      'Ensure public access',
      'Click verify'
    ],
    
    example: {
      filename: 'leadconduit-verify-abc123.html',
      location: 'https://example.com/leadconduit-verify-abc123.html',
      content: 'leadconduit-verification: abc123xyz789'
    }
  },
  
  meta_tag: {
    name: 'HTML Meta Tag',
    difficulty: 'Easy',
    time: '5 minutes',
    permanent: false,
    
    steps: [
      'Get meta tag code',
      'Add to homepage <head>',
      'Publish changes',
      'Verify'
    ],
    
    example: '<meta name="leadconduit-verification" content="abc123xyz789">'
  },
  
  cname: {
    name: 'CNAME Record',
    difficulty: 'Advanced',
    time: '5-60 minutes',
    permanent: true,
    
    steps: [
      'Create subdomain',
      'Add CNAME record',
      'Point to verification URL',
      'Verify ownership'
    ],
    
    example: {
      type: 'CNAME',
      name: 'verify.example.com',
      value: 'verify-abc123.leadconduit.com'
    }
  }
};
```

### Verification Process

Step-by-step implementation:

```javascript
class DomainVerification {
  async verifyDomain(domain, method) {
    // Generate verification token
    const token = await this.generateToken(domain);
    
    // Provide instructions
    const instructions = this.getInstructions(method, token);
    
    // Wait for user to implement
    console.log('Instructions:', instructions);
    
    // Attempt verification
    const maxAttempts = 10;
    const delayMs = 30000; // 30 seconds
    
    for (let i = 0; i < maxAttempts; i++) {
      const result = await this.checkVerification(domain, method, token);
      
      if (result.verified) {
        return this.completeVerification(domain, result);
      }
      
      console.log(`Attempt ${i + 1} failed: ${result.reason}`);
      
      if (i < maxAttempts - 1) {
        await this.sleep(delayMs);
      }
    }
    
    throw new Error('Verification timeout');
  }
  
  async checkVerification(domain, method, token) {
    switch (method) {
      case 'dns_txt':
        return this.checkDNSVerification(domain, token);
        
      case 'file_upload':
        return this.checkFileVerification(domain, token);
        
      case 'meta_tag':
        return this.checkMetaTagVerification(domain, token);
        
      case 'cname':
        return this.checkCNAMEVerification(domain, token);
    }
  }
  
  async checkDNSVerification(domain, token) {
    try {
      const records = await this.resolveTXT(domain);
      const verifyRecord = `leadconduit-verify=${token}`;
      
      const found = records.some(record => 
        record.includes(verifyRecord)
      );
      
      return {
        verified: found,
        reason: found ? 'Success' : 'TXT record not found',
        records: records
      };
    } catch (error) {
      return {
        verified: false,
        reason: `DNS lookup failed: ${error.message}`
      };
    }
  }
  
  async checkFileVerification(domain, token) {
    const url = `https://${domain}/leadconduit-verify-${token}.html`;
    
    try {
      const response = await fetch(url);
      const content = await response.text();
      
      const expected = `leadconduit-verification: ${token}`;
      const verified = content.includes(expected);
      
      return {
        verified,
        reason: verified ? 'Success' : 'Invalid file content',
        url,
        status: response.status
      };
    } catch (error) {
      return {
        verified: false,
        reason: `File fetch failed: ${error.message}`
      };
    }
  }
}
```

### Subdomain Verification

Verify subdomains efficiently:

```javascript
class SubdomainVerification {
  async verifyWithWildcard(rootDomain) {
    // Wildcard verification covers all subdomains
    const wildcardToken = await this.generateWildcardToken(rootDomain);
    
    const dnsRecord = {
      type: 'TXT',
      name: '_leadconduit',
      value: `v=leadconduit1; d=${rootDomain}; t=${wildcardToken}`
    };
    
    // Verify root
    const rootVerified = await this.verifyDomain(rootDomain, dnsRecord);
    
    if (rootVerified) {
      // All subdomains now verified
      await this.enableSubdomains(rootDomain, '*');
      
      return {
        domain: rootDomain,
        subdomains: 'all',
        verified: true,
        method: 'wildcard'
      };
    }
  }
  
  async verifySpecificSubdomains(rootDomain, subdomains) {
    const results = [];
    
    for (const subdomain of subdomains) {
      const fullDomain = `${subdomain}.${rootDomain}`;
      
      try {
        const result = await this.verifyDomain(fullDomain, 'dns_txt');
        results.push({
          subdomain: fullDomain,
          verified: true,
          method: result.method
        });
      } catch (error) {
        results.push({
          subdomain: fullDomain,
          verified: false,
          error: error.message
        });
      }
    }
    
    return results;
  }
}
```

## 📝 Form Whitelisting

### Whitelist Configuration

Control which forms can submit:

```javascript
class FormWhitelist {
  constructor() {
    this.whitelist = new Map();
    this.rules = [];
  }
  
  addForm(config) {
    const formEntry = {
      id: this.generateFormId(),
      
      // Form identification
      url: config.url,
      domain: new URL(config.url).hostname,
      path: new URL(config.url).pathname,
      
      // Whitelist settings
      status: 'active',
      added_date: new Date(),
      expires: config.expires || null,
      
      // Security settings
      require_https: config.require_https !== false,
      allowed_methods: config.methods || ['POST'],
      
      // Validation rules
      validation: {
        required_fields: config.required_fields || [],
        blocked_fields: config.blocked_fields || [],
        
        consent_required: config.consent_required !== false,
        consent_selector: config.consent_selector,
        
        captcha_required: config.captcha_required || false,
        captcha_type: config.captcha_type || 'recaptcha_v2'
      },
      
      // Rate limiting
      rate_limits: {
        per_minute: config.rate_limit_minute || 60,
        per_hour: config.rate_limit_hour || 1000,
        per_day: config.rate_limit_day || 10000
      },
      
      // Tracking
      metrics: {
        submissions: 0,
        accepted: 0,
        rejected: 0,
        last_submission: null
      }
    };
    
    this.whitelist.set(formEntry.id, formEntry);
    return formEntry;
  }
  
  validateSubmission(request) {
    const url = request.headers.referer || request.headers.origin;
    
    if (!url) {
      return {
        allowed: false,
        reason: 'No referer header'
      };
    }
    
    // Find matching form
    const form = this.findMatchingForm(url);
    
    if (!form) {
      return {
        allowed: false,
        reason: 'Form not whitelisted',
        url
      };
    }
    
    // Validate form status
    if (form.status !== 'active') {
      return {
        allowed: false,
        reason: `Form ${form.status}`,
        form_id: form.id
      };
    }
    
    // Check expiration
    if (form.expires && new Date() > form.expires) {
      return {
        allowed: false,
        reason: 'Form whitelist expired',
        expired: form.expires
      };
    }
    
    // Validate HTTPS requirement
    if (form.require_https && !url.startsWith('https://')) {
      return {
        allowed: false,
        reason: 'HTTPS required'
      };
    }
    
    // Check rate limits
    const rateLimitCheck = this.checkRateLimits(form, request);
    if (!rateLimitCheck.allowed) {
      return rateLimitCheck;
    }
    
    // Validate fields
    const fieldCheck = this.validateFields(form, request.body);
    if (!fieldCheck.valid) {
      return {
        allowed: false,
        reason: fieldCheck.reason,
        field: fieldCheck.field
      };
    }
    
    // Update metrics
    this.updateMetrics(form, 'submission');
    
    return {
      allowed: true,
      form_id: form.id,
      validations_passed: true
    };
  }
}
```

### Dynamic Whitelisting

Auto-discover and whitelist forms:

```javascript
class DynamicWhitelist {
  async scanDomainForForms(domain) {
    const forms = [];
    
    // Scan common pages
    const pagesToScan = [
      '/',
      '/contact',
      '/quote',
      '/get-started',
      '/free-quote',
      '/request-info'
    ];
    
    for (const page of pagesToScan) {
      try {
        const url = `https://${domain}${page}`;
        const pageContent = await this.fetchPage(url);
        const pageForms = this.extractForms(pageContent, url);
        
        forms.push(...pageForms);
      } catch (error) {
        console.log(`Failed to scan ${page}: ${error.message}`);
      }
    }
    
    // Analyze forms
    const analyzed = forms.map(form => this.analyzeForm(form));
    
    // Auto-whitelist safe forms
    const safeFormsforms = analyzed.filter(f => f.safety_score > 0.8);
    
    return {
      found: forms.length,
      analyzed: analyzed,
      auto_whitelisted: safeFormsforms.length,
      require_review: analyzed.filter(f => f.safety_score <= 0.8)
    };
  }
  
  analyzeForm(form) {
    const analysis = {
      url: form.url,
      method: form.method,
      fields: form.fields,
      
      safety_score: 1.0,
      issues: [],
      recommendations: []
    };
    
    // Check HTTPS
    if (!form.url.startsWith('https://')) {
      analysis.safety_score -= 0.3;
      analysis.issues.push('Not using HTTPS');
      analysis.recommendations.push('Enable SSL/TLS');
    }
    
    // Check consent
    const hasConsent = form.fields.some(f => 
      f.type === 'checkbox' && 
      (f.name.includes('consent') || f.name.includes('agree'))
    );
    
    if (!hasConsent) {
      analysis.safety_score -= 0.2;
      analysis.issues.push('No visible consent checkbox');
      analysis.recommendations.push('Add clear consent language');
    }
    
    // Check for sensitive fields
    const sensitiveFields = form.fields.filter(f => 
      f.name.match(/ssn|social|tax|account/i)
    );
    
    if (sensitiveFields.length > 0) {
      analysis.safety_score -= 0.4;
      analysis.issues.push('Contains sensitive fields');
      analysis.recommendations.push('Review data collection necessity');
    }
    
    return analysis;
  }
}
```

## 🔒 Data Security Measures

### Field-Level Encryption

Protect sensitive data:

```javascript
class FieldEncryption {
  constructor(config) {
    this.algorithm = config.algorithm || 'aes-256-gcm';
    this.keyManagement = new KeyManagement(config.keyStore);
  }
  
  async encryptField(fieldName, value, context) {
    // Determine if encryption needed
    if (!this.shouldEncrypt(fieldName, value)) {
      return { encrypted: false, value };
    }
    
    // Get encryption key
    const key = await this.keyManagement.getKey(context.tenant);
    
    // Encrypt value
    const encrypted = await this.encrypt(value, key);
    
    // Store metadata
    const metadata = {
      field: fieldName,
      algorithm: this.algorithm,
      key_id: key.id,
      encrypted_at: new Date(),
      context: {
        user: context.user,
        ip: context.ip,
        purpose: context.purpose
      }
    };
    
    return {
      encrypted: true,
      value: encrypted,
      metadata
    };
  }
  
  shouldEncrypt(fieldName, value) {
    // Always encrypt certain fields
    const alwaysEncrypt = ['ssn', 'tax_id', 'account_number', 'routing_number'];
    if (alwaysEncrypt.includes(fieldName)) return true;
    
    // Pattern-based encryption
    const patterns = [
      { pattern: /^\d{3}-\d{2}-\d{4}$/, type: 'ssn' },
      { pattern: /^\d{9}$/, type: 'ssn_no_dashes' },
      { pattern: /^\d{2}-\d{7}$/, type: 'ein' }
    ];
    
    for (const { pattern, type } of patterns) {
      if (pattern.test(value)) {
        console.log(`Detected ${type} pattern in ${fieldName}`);
        return true;
      }
    }
    
    return false;
  }
  
  async decryptField(encryptedData, context) {
    // Verify permissions
    if (!this.canDecrypt(context)) {
      throw new Error('Insufficient permissions to decrypt');
    }
    
    // Log access
    await this.logDecryptAccess({
      field: encryptedData.metadata.field,
      user: context.user,
      reason: context.reason,
      timestamp: new Date()
    });
    
    // Get decryption key
    const key = await this.keyManagement.getKey(
      encryptedData.metadata.key_id
    );
    
    // Decrypt
    return this.decrypt(encryptedData.value, key);
  }
}
```

### Data Masking

Protect PII in logs and displays:

```javascript
class DataMasking {
  constructor() {
    this.rules = this.loadMaskingRules();
  }
  
  maskObject(obj, context) {
    const masked = {};
    
    for (const [key, value] of Object.entries(obj)) {
      masked[key] = this.maskValue(key, value, context);
    }
    
    return masked;
  }
  
  maskValue(fieldName, value, context) {
    if (!value) return value;
    
    // Find applicable rule
    const rule = this.findRule(fieldName, value);
    
    if (!rule) return value;
    
    // Apply masking based on context
    const maskLevel = this.getMaskLevel(context);
    
    switch (maskLevel) {
      case 'full':
        return this.fullMask(value, rule);
        
      case 'partial':
        return this.partialMask(value, rule);
        
      case 'none':
        return value;
        
      default:
        return this.defaultMask(value, rule);
    }
  }
  
  partialMask(value, rule) {
    switch (rule.type) {
      case 'ssn':
        return value.replace(/^(\d{3})-?(\d{2})-?(\d{4})$/, 'XXX-XX-$3');
        
      case 'phone':
        return value.replace(/^(\d{3})(\d{3})(\d{4})$/, '($1) XXX-$3');
        
      case 'email':
        const [local, domain] = value.split('@');
        const maskedLocal = local[0] + '*'.repeat(local.length - 2) + local.slice(-1);
        return `${maskedLocal}@${domain}`;
        
      case 'credit_card':
        return value.replace(/^(\d{4})(\d+)(\d{4})$/, '$1-XXXX-XXXX-$3');
        
      default:
        return this.genericMask(value);
    }
  }
  
  getMaskLevel(context) {
    // Production always masks
    if (context.environment === 'production') {
      return context.user?.role === 'admin' ? 'partial' : 'full';
    }
    
    // Development environments
    if (context.environment === 'development') {
      return 'partial';
    }
    
    // Based on user role
    const roleMaskLevels = {
      'admin': 'partial',
      'support': 'partial',
      'viewer': 'full',
      'api': 'full'
    };
    
    return roleMaskLevels[context.user?.role] || 'full';
  }
}
```

## 👥 Access Control

### Role-Based Access

Implement RBAC:

```javascript
class AccessControl {
  constructor() {
    this.roles = new Map();
    this.permissions = new Map();
    this.setupDefaultRoles();
  }
  
  setupDefaultRoles() {
    // Admin role
    this.addRole('admin', {
      permissions: ['*'], // All permissions
      description: 'Full system access'
    });
    
    // Manager role
    this.addRole('manager', {
      permissions: [
        'flows:read',
        'flows:write',
        'flows:delete',
        'leads:read',
        'leads:export',
        'reports:*',
        'users:read'
      ],
      description: 'Manage flows and view data'
    });
    
    // Operator role
    this.addRole('operator', {
      permissions: [
        'flows:read',
        'flows:write',
        'leads:read',
        'reports:read'
      ],
      description: 'Day-to-day operations'
    });
    
    // Viewer role
    this.addRole('viewer', {
      permissions: [
        'flows:read',
        'leads:read:masked',
        'reports:read'
      ],
      description: 'Read-only access'
    });
    
    // API role
    this.addRole('api', {
      permissions: [
        'leads:create',
        'leads:read:own',
        'webhooks:send'
      ],
      description: 'API access only'
    });
  }
  
  checkPermission(user, resource, action) {
    const permission = `${resource}:${action}`;
    
    // Get user's effective permissions
    const userPermissions = this.getUserPermissions(user);
    
    // Check exact match
    if (userPermissions.has(permission)) {
      return { allowed: true, matched: permission };
    }
    
    // Check wildcards
    if (userPermissions.has('*')) {
      return { allowed: true, matched: '*' };
    }
    
    if (userPermissions.has(`${resource}:*`)) {
      return { allowed: true, matched: `${resource}:*` };
    }
    
    // Check special conditions
    const conditionalCheck = this.checkConditionalPermissions(
      user,
      resource,
      action
    );
    
    if (conditionalCheck.allowed) {
      return conditionalCheck;
    }
    
    return {
      allowed: false,
      required: permission,
      user_permissions: Array.from(userPermissions)
    };
  }
  
  checkConditionalPermissions(user, resource, action) {
    // Own resource access
    if (action === 'read:own' || action === 'write:own') {
      const basePermission = `${resource}:${action}`;
      if (this.hasPermission(user, basePermission)) {
        return {
          allowed: true,
          matched: basePermission,
          condition: 'own_resource'
        };
      }
    }
    
    // Time-based access
    const timePermission = `${resource}:${action}:business_hours`;
    if (this.hasPermission(user, timePermission)) {
      const isBusinessHours = this.isBusinessHours();
      return {
        allowed: isBusinessHours,
        matched: timePermission,
        condition: 'business_hours',
        current_time: new Date()
      };
    }
    
    return { allowed: false };
  }
}
```

### API Key Management

Secure API access:

```javascript
class APIKeyManager {
  async createAPIKey(config) {
    const key = {
      id: this.generateKeyId(),
      key: this.generateSecureKey(),
      
      // Metadata
      name: config.name,
      description: config.description,
      created_at: new Date(),
      created_by: config.user,
      
      // Permissions
      permissions: config.permissions || [],
      role: config.role,
      
      // Restrictions
      restrictions: {
        ip_whitelist: config.ip_whitelist || [],
        rate_limit: config.rate_limit || 1000,
        expires_at: config.expires_at || null,
        
        allowed_origins: config.allowed_origins || [],
        allowed_methods: config.allowed_methods || ['GET', 'POST']
      },
      
      // Usage tracking
      usage: {
        last_used: null,
        total_requests: 0,
        
        daily_usage: {},
        hourly_usage: {}
      },
      
      // Status
      status: 'active',
      revoked: false
    };
    
    // Hash the key for storage
    const hashedKey = await this.hashKey(key.key);
    
    // Store key
    await this.storeKey({
      ...key,
      key: hashedKey // Store hash, not plain text
    });
    
    // Return key only once
    return {
      id: key.id,
      key: key.key, // Plain text - show only on creation
      name: key.name,
      permissions: key.permissions,
      
      message: 'Store this key securely. It will not be shown again.'
    };
  }
  
  async validateAPIKey(providedKey, request) {
    // Find key by hash
    const keyRecord = await this.findKeyByHash(
      await this.hashKey(providedKey)
    );
    
    if (!keyRecord) {
      return { valid: false, reason: 'Invalid key' };
    }
    
    // Check status
    if (keyRecord.status !== 'active' || keyRecord.revoked) {
      return { valid: false, reason: 'Key inactive' };
    }
    
    // Check expiration
    if (keyRecord.restrictions.expires_at && 
        new Date() > keyRecord.restrictions.expires_at) {
      return { valid: false, reason: 'Key expired' };
    }
    
    // Check IP whitelist
    if (keyRecord.restrictions.ip_whitelist.length > 0) {
      const clientIP = request.ip;
      if (!keyRecord.restrictions.ip_whitelist.includes(clientIP)) {
        return { valid: false, reason: 'IP not whitelisted' };
      }
    }
    
    // Check rate limit
    const rateLimitCheck = await this.checkRateLimit(keyRecord, request);
    if (!rateLimitCheck.allowed) {
      return { valid: false, reason: 'Rate limit exceeded' };
    }
    
    // Update usage
    await this.updateUsage(keyRecord);
    
    return {
      valid: true,
      key_id: keyRecord.id,
      permissions: keyRecord.permissions,
      role: keyRecord.role
    };
  }
}
```

## 📊 Security Monitoring

### Threat Detection

Monitor for security issues:

```javascript
class SecurityMonitor {
  constructor() {
    this.detectors = [];
    this.alerts = new AlertSystem();
    this.setupDetectors();
  }
  
  setupDetectors() {
    // Brute force detection
    this.addDetector({
      name: 'brute_force',
      
      check: (events) => {
        const failedLogins = events.filter(e => 
          e.type === 'login_failed'
        );
        
        const byIP = this.groupBy(failedLogins, 'ip');
        
        for (const [ip, attempts] of Object.entries(byIP)) {
          if (attempts.length > 10) {
            return {
              detected: true,
              severity: 'high',
              details: {
                ip,
                attempts: attempts.length,
                timeframe: '5 minutes'
              }
            };
          }
        }
        
        return { detected: false };
      },
      
      response: async (detection) => {
        await this.blockIP(detection.details.ip, '1 hour');
        await this.alerts.send('security', 
          `Blocked IP ${detection.details.ip} for brute force`
        );
      }
    });
    
    // Unusual access patterns
    this.addDetector({
      name: 'unusual_access',
      
      check: (events) => {
        const accessEvents = events.filter(e => 
          e.type === 'data_access'
        );
        
        for (const event of accessEvents) {
          // Check time
          const hour = new Date(event.timestamp).getHours();
          if (hour < 5 || hour > 22) {
            if (event.user.typical_hours && 
                !event.user.typical_hours.includes(hour)) {
              return {
                detected: true,
                severity: 'medium',
                details: {
                  user: event.user.id,
                  time: event.timestamp,
                  action: event.action
                }
              };
            }
          }
          
          // Check location
          if (event.location && event.user.usual_locations) {
            const distance = this.calculateDistance(
              event.location,
              event.user.usual_locations[0]
            );
            
            if (distance > 1000) { // 1000 miles
              return {
                detected: true,
                severity: 'high',
                details: {
                  user: event.user.id,
                  location: event.location,
                  distance: distance
                }
              };
            }
          }
        }
        
        return { detected: false };
      }
    });
    
    // Data exfiltration
    this.addDetector({
      name: 'data_exfiltration',
      
      check: (events) => {
        const exports = events.filter(e => 
          e.type === 'data_export'
        );
        
        const byUser = this.groupBy(exports, 'user.id');
        
        for (const [userId, userExports] of Object.entries(byUser)) {
          const totalRecords = userExports.reduce(
            (sum, e) => sum + e.record_count, 0
          );
          
          if (totalRecords > 10000) {
            return {
              detected: true,
              severity: 'critical',
              details: {
                user: userId,
                records: totalRecords,
                exports: userExports.length
              }
            };
          }
        }
        
        return { detected: false };
      }
    });
  }
  
  async monitorEvents() {
    const window = 5 * 60 * 1000; // 5 minutes
    
    while (true) {
      const events = await this.getRecentEvents(window);
      
      for (const detector of this.detectors) {
        const result = detector.check(events);
        
        if (result.detected) {
          console.log(`Security threat detected: ${detector.name}`);
          
          await this.logThreat({
            detector: detector.name,
            ...result
          });
          
          if (detector.response) {
            await detector.response(result);
          }
        }
      }
      
      await this.sleep(30000); // Check every 30 seconds
    }
  }
}
```

### Audit Logging

Comprehensive audit trail:

```javascript
class AuditLogger {
  async log(event) {
    const auditEntry = {
      id: this.generateId(),
      timestamp: new Date(),
      
      // Event details
      type: event.type,
      action: event.action,
      resource: event.resource,
      resource_id: event.resource_id,
      
      // Actor information
      actor: {
        type: event.actor_type, // user, api_key, system
        id: event.actor_id,
        name: event.actor_name,
        ip: event.ip,
        user_agent: event.user_agent
      },
      
      // Context
      context: {
        session_id: event.session_id,
        request_id: event.request_id,
        
        location: event.location,
        device: event.device
      },
      
      // Changes
      changes: event.changes || {},
      
      // Result
      result: event.result, // success, failure, partial
      error: event.error,
      
      // Security flags
      security: {
        risk_score: this.calculateRiskScore(event),
        flags: this.getSecurityFlags(event)
      }
    };
    
    // Store immutably
    await this.storeAuditLog(auditEntry);
    
    // Real-time analysis
    await this.analyzeForThreats(auditEntry);
    
    return auditEntry.id;
  }
  
  calculateRiskScore(event) {
    let score = 0;
    
    // High-risk actions
    const highRiskActions = ['delete', 'export', 'permission_change'];
    if (highRiskActions.includes(event.action)) {
      score += 30;
    }
    
    // Sensitive resources
    const sensitiveResources = ['users', 'api_keys', 'permissions'];
    if (sensitiveResources.includes(event.resource)) {
      score += 20;
    }
    
    // Unusual time
    const hour = new Date().getHours();
    if (hour < 6 || hour > 22) {
      score += 10;
    }
    
    // Failed attempts
    if (event.result === 'failure') {
      score += 15;
    }
    
    return Math.min(score, 100);
  }
}
```

## 🚨 Incident Response

### Response Procedures

Handle security incidents:

```javascript
class IncidentResponse {
  async handleIncident(threat) {
    const incident = {
      id: this.generateIncidentId(),
      threat: threat,
      started_at: new Date(),
      status: 'active',
      
      severity: this.assessSeverity(threat),
      
      response_plan: this.selectResponsePlan(threat),
      
      timeline: [],
      
      affected_resources: [],
      containment_actions: [],
      remediation_steps: []
    };
    
    // Execute response plan
    for (const step of incident.response_plan.steps) {
      try {
        const result = await this.executeStep(step, incident);
        
        incident.timeline.push({
          timestamp: new Date(),
          step: step.name,
          result: result,
          status: 'completed'
        });
        
      } catch (error) {
        incident.timeline.push({
          timestamp: new Date(),
          step: step.name,
          error: error.message,
          status: 'failed'
        });
        
        if (step.critical) {
          await this.escalateIncident(incident);
          break;
        }
      }
    }
    
    return incident;
  }
  
  selectResponsePlan(threat) {
    const plans = {
      'brute_force': {
        name: 'Brute Force Response',
        steps: [
          { name: 'Block source IP', action: 'block_ip', critical: true },
          { name: 'Reset affected accounts', action: 'reset_passwords' },
          { name: 'Notify users', action: 'send_notifications' },
          { name: 'Review logs', action: 'analyze_attempts' }
        ]
      },
      
      'data_breach': {
        name: 'Data Breach Response',
        steps: [
          { name: 'Isolate affected systems', action: 'isolate', critical: true },
          { name: 'Preserve evidence', action: 'snapshot_systems' },
          { name: 'Identify scope', action: 'trace_access' },
          { name: 'Notify legal', action: 'alert_legal', critical: true },
          { name: 'Prepare disclosure', action: 'draft_notification' }
        ]
      },
      
      'malware': {
        name: 'Malware Response',
        steps: [
          { name: 'Quarantine systems', action: 'quarantine', critical: true },
          { name: 'Scan all systems', action: 'full_scan' },
          { name: 'Clean infected', action: 'remove_malware' },
          { name: 'Patch vulnerabilities', action: 'apply_patches' },
          { name: 'Monitor for reinfection', action: 'enhanced_monitoring' }
        ]
      }
    };
    
    return plans[threat.type] || plans['generic'];
  }
}
```

## 💡 Best Practices

### Security Checklist

```javascript
const securityChecklist = {
  domain_verification: [
    'Verify all active domains',
    'Remove unused domains',
    'Monitor for new subdomains',
    'Annual reverification'
  ],
  
  form_security: [
    'Whitelist all forms',
    'Require HTTPS',
    'Implement rate limiting',
    'Add CAPTCHA for public forms',
    'Regular security scans'
  ],
  
  data_protection: [
    'Encrypt sensitive fields',
    'Mask PII in logs',
    'Implement retention policies',
    'Regular data audits',
    'Secure backups'
  ],
  
  access_control: [
    'Enforce least privilege',
    'Regular permission reviews',
    'Multi-factor authentication',
    'Session management',
    'API key rotation'
  ],
  
  monitoring: [
    'Real-time threat detection',
    'Comprehensive audit logs',
    'Regular security reports',
    'Incident response drills',
    'Vulnerability scanning'
  ]
};
```

### Implementation Timeline

```javascript
const securityRoadmap = {
  immediate: [
    'Enable HTTPS everywhere',
    'Implement basic access control',
    'Start audit logging'
  ],
  
  week_1: [
    'Domain verification',
    'Form whitelisting',
    'API key management'
  ],
  
  month_1: [
    'Field encryption',
    'Data masking',
    'Threat detection'
  ],
  
  quarter_1: [
    'Full RBAC implementation',
    'Security monitoring dashboard',
    'Incident response procedures'
  ],
  
  ongoing: [
    'Security training',
    'Regular audits',
    'Continuous improvement'
  ]
};
```

## 📚 Related Documentation

- [TrustedForm Implementation](./implementing-trustedform.md) - Consent security
- [Data Management](../data-management/) - Data handling practices
- [Compliance Guide](./index.md) - Regulatory requirements

---

🔒 **Security Excellence**: Robust security protects your business, your partners, and your customers. Implement comprehensively, monitor continuously, and respond swiftly to threats!