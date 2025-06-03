# TrustedForm API Complete Guide

Master the TrustedForm API v4.0 for certificate verification, retention, and advanced consent management. Learn to integrate TrustedForm programmatically for maximum flexibility and control.

## 📍 You Are Here

You need to integrate TrustedForm verification into your custom systems or want advanced control over certificate handling. This guide covers the complete API from basic verification to advanced features.

## 🎯 What You'll Learn

- API authentication and setup
- Certificate verification (v4.0)
- Retention strategies
- Advanced claims and features
- Error handling
- Performance optimization

## 🔐 API Authentication

### Getting Your API Credentials

1. Log into TrustedForm account
2. Navigate to Settings → API Keys
3. Create new API key with appropriate permissions
4. Store securely

```javascript
const trustedFormAPI = {
  baseURL: 'https://api.trustedform.com',
  version: 'v4.0',
  headers: {
    'Authorization': `Bearer ${process.env.TRUSTEDFORM_API_KEY}`,
    'Content-Type': 'application/json',
    'Accept': 'application/vnd.trustedform.v4+json'
  }
};
```

### API Key Permissions

Different scopes available:

```javascript
const apiScopes = {
  'certificate:read': 'View certificate details',
  'certificate:retain': 'Retain certificates',
  'certificate:verify': 'Verify certificates',
  'insights:read': 'Access analytics data',
  'consent:manage': 'Manage consent languages'
};
```

## 🔍 Certificate Verification

### Basic Verification Request

Verify a certificate:

```javascript
async function verifyCertificate(certUrl) {
  const endpoint = '/certificates/verify';
  
  const request = {
    method: 'POST',
    url: `${trustedFormAPI.baseURL}${endpoint}`,
    headers: trustedFormAPI.headers,
    data: {
      cert_url: certUrl,
      vendor: 'your_vendor_id',
      reference: 'lead_123456'
    }
  };
  
  try {
    const response = await axios(request);
    return response.data;
  } catch (error) {
    handleVerificationError(error);
  }
}

// Example response
{
  "cert": {
    "id": "5d3a8f9b7c4e6a2d1b8f9c3e",
    "url": "https://cert.trustedform.com/5d3a8f9b7c4e6a2d1b8f9c3e",
    "created_at": "2024-01-15T10:30:00Z",
    "expires_at": "2024-01-18T10:30:00Z",
    "status": "valid"
  },
  "verification": {
    "status": "passed",
    "checks_performed": ["age", "domain", "consent"],
    "reference": "lead_123456"
  },
  "insights": {
    "browser": "Chrome 120",
    "device": "Desktop",
    "ip_location": "San Francisco, CA"
  }
}
```

### Advanced Verification Options

Include additional checks:

```javascript
const advancedVerification = {
  cert_url: certUrl,
  vendor: 'your_vendor_id',
  
  // Verify specific claims
  claims: [
    'page_url',
    'ip',
    'browser',
    'operating_system',
    'geo',
    'timestamp',
    'event_duration',
    'page_scan'
  ],
  
  // Custom verification rules
  rules: {
    max_age_seconds: 300, // 5 minutes
    allowed_domains: ['example.com', 'landing.example.com'],
    require_consent: true,
    min_event_duration: 5
  },
  
  // Include page scan results
  include_page_scan: true,
  
  // Verify against specific consent language
  consent_language_id: 'lang_abc123'
};
```

### Page Scan Verification

Verify consent and page content:

```javascript
const pageScanVerification = {
  cert_url: certUrl,
  page_scan: {
    verify_consent: {
      required_text: [
        'I agree to be contacted',
        'Terms and Conditions'
      ],
      min_font_size: 10,
      min_contrast_ratio: 4.5,
      max_distance_from_button: 200
    },
    
    verify_fields: {
      email: {
        required: true,
        visible: true
      },
      phone: {
        required: true,
        format: 'US'
      }
    },
    
    blocked_content: [
      'free',
      'guarantee',
      'no obligation'
    ]
  }
};
```

## 💾 Certificate Retention

### Retain Certificate

Keep certificate beyond 72 hours:

```javascript
async function retainCertificate(certUrl, leadData) {
  const endpoint = '/certificates/retain';
  
  const request = {
    method: 'POST',
    url: `${trustedFormAPI.baseURL}${endpoint}`,
    headers: trustedFormAPI.headers,
    data: {
      cert_url: certUrl,
      reference: leadData.id,
      vendor: 'your_vendor_id',
      
      // Optional metadata
      metadata: {
        lead_id: leadData.id,
        source: leadData.source,
        retained_by: 'api_automation',
        reason: 'high_value_lead'
      },
      
      // Retention period (days)
      retention_days: 365,
      
      // Auto-retain similar certificates
      auto_retain: {
        enabled: true,
        rules: {
          same_ip: true,
          same_page_url: true,
          time_window_hours: 24
        }
      }
    }
  };
  
  const response = await axios(request);
  return response.data;
}

// Success response
{
  "retained": true,
  "retention": {
    "id": "ret_xyz789",
    "expires_at": "2025-01-15T10:30:00Z",
    "reference": "lead_123456",
    "cost": 0.10
  },
  "certificate": {
    "id": "5d3a8f9b7c4e6a2d1b8f9c3e",
    "status": "retained"
  }
}
```

### Bulk Retention

Retain multiple certificates:

```javascript
async function bulkRetain(certificates) {
  const endpoint = '/certificates/retain/bulk';
  
  const request = {
    method: 'POST',
    url: `${trustedFormAPI.baseURL}${endpoint}`,
    headers: trustedFormAPI.headers,
    data: {
      certificates: certificates.map(cert => ({
        cert_url: cert.url,
        reference: cert.leadId,
        retention_days: 365
      })),
      
      // Process options
      options: {
        continue_on_error: true,
        validate_before_retain: true
      }
    }
  };
  
  const response = await axios(request);
  
  // Handle mixed results
  const results = {
    successful: response.data.results.filter(r => r.success),
    failed: response.data.results.filter(r => !r.success)
  };
  
  return results;
}
```

## 📈 Certificate Claims

### Available Claims

Data available from certificates:

```javascript
const certificateClaims = {
  // Basic claims
  basic: {
    created_at: 'Certificate creation timestamp',
    page_url: 'URL where form was located',
    ip: 'User IP address',
    cert_id: 'Unique certificate identifier'
  },
  
  // Browser/Device claims
  device: {
    browser: 'Browser name and version',
    operating_system: 'OS information',
    device_type: 'Desktop/Mobile/Tablet',
    screen_resolution: 'Display dimensions'
  },
  
  // Geographic claims
  geo: {
    city: 'City name',
    state: 'State/Province code',
    postal_code: 'ZIP/Postal code',
    country: 'Country code',
    lat_lon: 'Coordinates'
  },
  
  // Behavioral claims
  behavior: {
    event_duration: 'Time on page (seconds)',
    page_history: 'Navigation path',
    mouse_movements: 'Interaction data',
    form_fill_time: 'Time to complete form'
  },
  
  // Page scan claims
  page_scan: {
    consent_text: 'Captured consent language',
    form_fields: 'Fields present on form',
    page_content: 'Full page snapshot',
    screenshots: 'Visual captures'
  }
};
```

### Accessing Claims

Retrieve specific claim data:

```javascript
async function getCertificateClaims(certId, claimTypes) {
  const endpoint = `/certificates/${certId}/claims`;
  
  const params = new URLSearchParams({
    claims: claimTypes.join(','),
    include_pii: false // Mask sensitive data
  });
  
  const response = await axios.get(
    `${trustedFormAPI.baseURL}${endpoint}?${params}`,
    { headers: trustedFormAPI.headers }
  );
  
  return response.data.claims;
}

// Example usage
const claims = await getCertificateClaims('cert_123', [
  'ip',
  'geo',
  'browser',
  'event_duration'
]);
```

## 🎯 Advanced Features

### Consent Language Management

Manage approved consent text:

```javascript
// Create consent language
async function createConsentLanguage(consentData) {
  const endpoint = '/consent-languages';
  
  const request = {
    method: 'POST',
    url: `${trustedFormAPI.baseURL}${endpoint}`,
    headers: trustedFormAPI.headers,
    data: {
      name: consentData.name,
      language: consentData.text,
      
      // Matching rules
      rules: {
        match_type: 'contains_all', // or 'exact', 'regex'
        case_sensitive: false,
        
        // Required phrases
        required_phrases: [
          'consent to be contacted',
          'privacy policy',
          'terms of service'
        ],
        
        // Forbidden phrases
        forbidden_phrases: [
          'no obligation',
          'free consultation'
        ]
      },
      
      // Auto-approve matching certificates
      auto_approve: true,
      
      // Compliance notes
      compliance: {
        tcpa_compliant: true,
        state_requirements: ['CA', 'NY'],
        effective_date: '2024-01-01'
      }
    }
  };
  
  return await axios(request);
}
```

### Lead Matching

Match leads to certificates:

```javascript
async function matchLeadToCertificate(leadData) {
  const endpoint = '/certificates/match';
  
  const request = {
    method: 'POST',
    url: `${trustedFormAPI.baseURL}${endpoint}`,
    headers: trustedFormAPI.headers,
    data: {
      // Lead identifiers
      lead: {
        email: leadData.email,
        phone: leadData.phone,
        ip: leadData.ip
      },
      
      // Search parameters
      search: {
        time_window_minutes: 30,
        page_url: leadData.source_url,
        
        // Matching strategy
        match_strategy: 'best_match', // or 'most_recent', 'exact'
        
        // Minimum match confidence (0-100)
        min_confidence: 80
      },
      
      // Include related certificates
      include_related: true
    }
  };
  
  const response = await axios(request);
  
  if (response.data.matches.length > 0) {
    return response.data.matches[0]; // Best match
  }
  
  return null;
}
```

### Insights API

Access aggregated data:

```javascript
async function getCertificateInsights(filters) {
  const endpoint = '/insights/certificates';
  
  const params = {
    start_date: filters.startDate,
    end_date: filters.endDate,
    group_by: 'day', // or 'hour', 'week', 'month'
    
    // Filters
    domain: filters.domain,
    vendor: filters.vendor,
    
    // Metrics to include
    metrics: [
      'total_certificates',
      'retained_certificates',
      'verification_rate',
      'average_age_at_verification',
      'consent_approval_rate',
      'geographic_distribution'
    ]
  };
  
  const response = await axios.get(
    `${trustedFormAPI.baseURL}${endpoint}`,
    {
      headers: trustedFormAPI.headers,
      params: params
    }
  );
  
  return response.data.insights;
}
```

## ⚡ Error Handling

### API Error Responses

Handle different error types:

```javascript
function handleAPIError(error) {
  if (error.response) {
    const status = error.response.status;
    const data = error.response.data;
    
    switch (status) {
      case 400:
        // Bad request - validation error
        console.error('Validation error:', data.errors);
        break;
        
      case 401:
        // Unauthorized - check API key
        console.error('Invalid API key');
        break;
        
      case 403:
        // Forbidden - check permissions
        console.error('Insufficient permissions:', data.required_scope);
        break;
        
      case 404:
        // Not found
        console.error('Certificate not found');
        break;
        
      case 409:
        // Conflict - already retained
        console.error('Certificate already retained');
        break;
        
      case 429:
        // Rate limited
        const retryAfter = error.response.headers['retry-after'];
        console.error(`Rate limited. Retry after ${retryAfter} seconds`);
        break;
        
      case 500:
        // Server error
        console.error('TrustedForm server error');
        break;
    }
  }
}
```

### Retry Logic

Implement smart retries:

```javascript
class TrustedFormClient {
  constructor(apiKey, options = {}) {
    this.apiKey = apiKey;
    this.maxRetries = options.maxRetries || 3;
    this.retryDelay = options.retryDelay || 1000;
  }
  
  async requestWithRetry(config, attempt = 1) {
    try {
      return await axios(config);
    } catch (error) {
      if (this.shouldRetry(error) && attempt <= this.maxRetries) {
        const delay = this.calculateDelay(attempt, error);
        
        console.log(`Retry attempt ${attempt} after ${delay}ms`);
        await this.sleep(delay);
        
        return this.requestWithRetry(config, attempt + 1);
      }
      
      throw error;
    }
  }
  
  shouldRetry(error) {
    if (!error.response) return true; // Network error
    
    const status = error.response.status;
    return [408, 429, 500, 502, 503, 504].includes(status);
  }
  
  calculateDelay(attempt, error) {
    // Exponential backoff
    let delay = this.retryDelay * Math.pow(2, attempt - 1);
    
    // Honor rate limit headers
    if (error.response?.headers['retry-after']) {
      delay = parseInt(error.response.headers['retry-after']) * 1000;
    }
    
    return delay;
  }
}
```

## 📋 Best Practices

### API Usage Guidelines

1. **Cache Certificates**: Store verified certificates to avoid re-verification
2. **Batch Operations**: Use bulk endpoints when possible
3. **Handle Rate Limits**: Implement exponential backoff
4. **Monitor Usage**: Track API calls and costs
5. **Secure Storage**: Encrypt API keys and certificate data

### Performance Optimization

```javascript
// Connection pooling
const https = require('https');
const agent = new https.Agent({
  keepAlive: true,
  maxSockets: 10
});

// Request optimization
const optimizedRequest = {
  timeout: 5000,
  httpsAgent: agent,
  
  // Only request needed fields
  fields: ['cert.id', 'cert.status', 'verification.status'],
  
  // Skip expensive operations if not needed
  skip_page_scan: true,
  skip_insights: true
};
```

### Testing Strategy

```javascript
// Test environment
const testConfig = {
  baseURL: 'https://sandbox-api.trustedform.com',
  testCertificates: [
    'https://cert.trustedform.com/test-valid',
    'https://cert.trustedform.com/test-expired',
    'https://cert.trustedform.com/test-invalid'
  ]
};

// Integration tests
describe('TrustedForm API', () => {
  it('should verify valid certificate', async () => {
    const result = await verifyCertificate(testConfig.testCertificates[0]);
    expect(result.verification.status).toBe('passed');
  });
  
  it('should handle expired certificate', async () => {
    const result = await verifyCertificate(testConfig.testCertificates[1]);
    expect(result.verification.status).toBe('failed');
    expect(result.verification.reason).toContain('expired');
  });
});
```

## 📚 Related Documentation

- [Implementing TrustedForm](./implementing-trustedform.md) - Basic implementation
- [TrustedForm Verify](./trustedform-verify-guide.md) - Verify product guide
- [Compliance Guide](./index.md) - Overall compliance strategy

---

🔐 **API Mastery**: The TrustedForm API provides powerful tools for consent verification and compliance. Use it wisely to protect your business while maintaining conversion rates!