# Buyer Step and Connection Management

Master the buyer step configuration and invite-to-connect system. Learn to manage buyer relationships, configure delivery settings, and streamline partner connections.

## 📍 You Are Here

You're setting up buyer delivery steps or managing partner connections through LeadConduit's invite system. This guide covers both buyer configuration and the connection management workflow.

## 🎯 What You'll Learn

- Buyer step configuration
- Invite-to-connect process
- Connection management
- Security and permissions
- Best practices
- Troubleshooting

## 🤝 Understanding Connections

### The Connection System

LeadConduit's secure partner management:

```
Seller (You) → Invite Sent → Buyer Reviews → Connection Established
      ↓                                                    ↓
 Configure Step                                    Exchange Credentials
```

### Benefits

**For Sellers**:
- No credential sharing
- Easy buyer onboarding
- Centralized management
- Change tracking

**For Buyers**:
- Self-service setup
- Secure credential storage
- Direct configuration
- Testing capabilities

## 🔧 Buyer Step Configuration

### Creating a Buyer Step

Add buyer to your flow:

```yaml
Step Configuration:
  Type: Buyer
  Name: Premium Insurance Buyer
  
  # Connection method
  Connection:
    Method: Invite to Connect
    # OR
    Method: Manual Configuration
  
  # Delivery settings
  Delivery:
    Method: POST
    Format: JSON
    Timeout: 30 seconds
    
  # Business rules
  Rules:
    Active: true
    Accept Duplicates: false
    Price: $45.00
```

### Manual Configuration

Direct setup without invite:

```javascript
const manualBuyerConfig = {
  // Endpoint configuration
  endpoint: {
    url: "https://api.buyer.com/leads",
    method: "POST",
    
    // Authentication
    auth: {
      type: "bearer", // basic, bearer, api_key, custom
      token: process.env.BUYER_API_TOKEN
    },
    
    // Headers
    headers: {
      "Content-Type": "application/json",
      "X-Partner-ID": "leadconduit_123",
      "X-Test-Mode": "{{test_mode}}"
    }
  },
  
  // Request format
  request: {
    format: "json",
    
    // Field mappings
    mappings: {
      "lead_id": "{{event_id}}",
      "email": "{{lead.email}}",
      "phone": "{{lead.phone_1}}",
      "first_name": "{{lead.first_name}}",
      "last_name": "{{lead.last_name}}",
      "state": "{{lead.state}}",
      "zip": "{{lead.zip_code}}",
      "source": "{{lead.source}}",
      "ip_address": "{{lead.ip_address}}",
      "timestamp": "{{event_timestamp}}"
    },
    
    // Conditional fields
    conditional_mappings: [
      {
        condition: "lead.state == 'CA'",
        mappings: {
          "ca_privacy_notice": true,
          "ccpa_consent": "{{lead.ccpa_consent}}"
        }
      }
    ]
  },
  
  // Response handling
  response: {
    success_codes: [200, 201],
    
    // Parse response
    parser: {
      type: "json",
      success_path: "status",
      success_value: "accepted",
      id_path: "lead_id",
      price_path: "payout",
      reason_path: "rejection_reason"
    }
  }
};
```

## 📬 Invite to Connect Process

### Sending Invitations

Initiate partner connection:

1. **In Buyer Step**:
   - Click "Invite to Connect"
   - Enter buyer email
   - Add custom message (optional)
   - Send invitation

2. **Invitation Details**:
   ```javascript
   const invitation = {
     recipient: "buyer@company.com",
     sender: "seller@mycompany.com",
     flow: "Insurance Leads - California",
     
     message: `
       Hi Partner,
       
       Please configure your endpoint for receiving 
       California insurance leads.
       
       Expected volume: 500-1000 leads/day
       Format: JSON POST
       
       Thanks,
       Your Partner Team
     `,
     
     expires: "7 days",
     
     // What buyer can configure
     permissions: {
       endpoint_url: true,
       authentication: true,
       field_mappings: true,
       test_mode: true
     }
   };
   ```

### Buyer Acceptance Flow

What buyers see and do:

1. **Email Received**:
   ```
   Subject: Connection Request from [Seller Company]
   
   You've been invited to connect to receive leads.
   Flow: Insurance Leads - California
   
   [Accept Invitation]
   ```

2. **Configuration Page**:
   ```yaml
   Your Endpoint Configuration:
     URL: [Enter your endpoint]
     Method: POST (fixed)
     
   Authentication:
     Type: [Select type]
     Credentials: [Enter credentials]
     
   Field Mapping:
     - Review available fields
     - Map to your schema
     - Set required fields
     
   Testing:
     - Send test lead
     - Verify reception
     - Confirm mapping
   ```

3. **Testing Process**:
   ```javascript
   // Test lead sent
   const testLead = {
     test_mode: true,
     lead_id: "TEST_123",
     email: "test@example.com",
     phone: "5555551234",
     first_name: "Test",
     last_name: "Lead",
     // ... other fields
   };
   
   // Buyer must successfully receive and acknowledge
   ```

### Managing Connections

Ongoing connection management:

```javascript
const connectionManagement = {
  // View all connections
  connections: [
    {
      buyer: "Premium Buyer Inc",
      status: "active",
      created: "2024-01-01",
      last_delivery: "2024-01-15 10:30:00",
      total_delivered: 15234,
      success_rate: "98.5%"
    }
  ],
  
  // Connection actions
  actions: {
    pause: "Temporarily stop delivery",
    resume: "Restart delivery",
    test: "Send test lead",
    revoke: "Permanently disconnect",
    modify: "Request configuration change"
  },
  
  // Monitoring
  health: {
    status: "healthy",
    avg_response_time: "245ms",
    last_error: null,
    uptime: "99.9%"
  }
};
```

## 🔒 Security and Permissions

### Credential Management

Secure handling of authentication:

```javascript
// Seller side - no visibility
const sellerView = {
  buyer_endpoint: "Configured by buyer",
  authentication: "**** Hidden ****",
  status: "Active",
  can_see_credentials: false
};

// Buyer side - full control
const buyerView = {
  endpoint: "https://api.ourcompany.com/leads",
  auth_type: "bearer",
  auth_token: "abc123xyz789", // Only visible to buyer
  can_update: true,
  can_test: true
};

// Credential rotation
const rotation = {
  schedule: "quarterly",
  notification: "30 days before expiry",
  process: [
    "Buyer updates credentials",
    "Tests with new credentials",
    "Activates new credentials",
    "Old credentials deactivated"
  ]
};
```

### Permission Levels

Control what partners can do:

```javascript
const permissionLevels = {
  // Seller permissions
  seller: {
    send_invites: true,
    view_connection_status: true,
    see_delivery_stats: true,
    modify_buyer_config: false,
    see_buyer_credentials: false
  },
  
  // Buyer permissions  
  buyer: {
    configure_endpoint: true,
    update_credentials: true,
    view_field_mappings: true,
    test_connection: true,
    pause_delivery: true,
    view_lead_data: false // Only what's sent
  },
  
  // Admin permissions
  admin: {
    override_connections: true,
    view_all_configs: true,
    force_disconnect: true,
    audit_access: true
  }
};
```

## 📧 Communication Features

### In-System Messaging

Communicate with partners:

```javascript
// Message thread
const messageThread = {
  connection: "Premium Buyer Inc",
  
  messages: [
    {
      from: "seller",
      date: "2024-01-15 09:00:00",
      message: "We'll be adding new fields next week. Please review.",
      attachments: ["field_spec_v2.pdf"]
    },
    {
      from: "buyer",
      date: "2024-01-15 10:30:00",
      message: "Reviewed and ready. Our endpoint supports the new fields."
    }
  ],
  
  // Notification preferences
  notifications: {
    email: true,
    in_app: true,
    urgent_sms: false
  }
};
```

### Change Notifications

Automatic alerts:

```javascript
const changeAlerts = [
  {
    type: "field_added",
    trigger: "New required field",
    notification: "Email buyer 7 days before"
  },
  {
    type: "volume_change",
    trigger: "50% increase in daily volume",
    notification: "Alert buyer immediately"
  },
  {
    type: "format_change",
    trigger: "JSON structure modified",
    notification: "Require buyer acknowledgment"
  }
];
```

## ⚡ Advanced Configuration

### Dynamic Buyer Selection

Route to different buyers:

```javascript
class DynamicBuyerRouter {
  selectBuyer(lead) {
    // Time-based routing
    const hour = new Date().getHours();
    if (hour < 12) {
      return this.morningBuyers;
    } else {
      return this.afternoonBuyers;
    }
  }
  
  // Geographic routing
  routeByGeography(lead) {
    const buyersByState = {
      'CA': ['buyer_west_1', 'buyer_west_2'],
      'NY': ['buyer_east_1', 'buyer_east_2'],
      'TX': ['buyer_central_1']
    };
    
    return buyersByState[lead.state] || this.defaultBuyers;
  }
  
  // Quality-based routing
  routeByQuality(lead) {
    if (lead.credit_score > 750) {
      return this.premiumBuyers;
    } else if (lead.credit_score > 650) {
      return this.standardBuyers;
    } else {
      return this.subprimeBuyers;
    }
  }
}
```

### Conditional Delivery

Smart delivery rules:

```javascript
const conditionalDelivery = {
  // Only deliver during buyer hours
  time_restrictions: {
    timezone: "America/Los_Angeles",
    days: ["Mon", "Tue", "Wed", "Thu", "Fri"],
    hours: { start: "08:00", end: "18:00" },
    
    outside_hours: "queue" // or "reject", "alternate_buyer"
  },
  
  // Volume management
  caps: {
    daily: 1000,
    hourly: 100,
    
    when_exceeded: {
      action: "overflow_to_backup",
      backup_buyer: "buyer_overflow"
    }
  },
  
  // Quality thresholds
  quality_requirements: {
    min_score: 70,
    required_fields: ["email", "phone", "consent"],
    
    when_not_met: {
      action: "route_to_remediation",
      remediation_buyer: "buyer_lowquality"
    }
  }
};
```

### Failover Configuration

Handle delivery failures:

```javascript
const failoverConfig = {
  primary_buyer: "buyer_main",
  
  failure_detection: {
    timeout_ms: 5000,
    error_codes: [500, 502, 503, 504],
    
    // Circuit breaker
    circuit_breaker: {
      failure_threshold: 5,
      time_window: "5 minutes",
      recovery_timeout: "30 minutes"
    }
  },
  
  failover_chain: [
    {
      buyer: "buyer_backup_1",
      conditions: { max_attempts: 3 }
    },
    {
      buyer: "buyer_backup_2",
      conditions: { business_hours_only: true }
    },
    {
      action: "queue_for_retry",
      retry_after: "1 hour"
    }
  ]
};
```

## 📊 Monitoring Connections

### Connection Health

Track buyer performance:

```javascript
const healthMetrics = {
  buyer: "Premium Buyer Inc",
  
  real_time: {
    status: "healthy",
    current_response_time: "189ms",
    active_connections: 3,
    queue_depth: 0
  },
  
  daily_stats: {
    delivered: 892,
    accepted: 875,
    rejected: 17,
    errors: 0,
    
    acceptance_rate: "98.1%",
    avg_response_time: "210ms",
    
    revenue: 39285.00,
    avg_price: 44.00
  },
  
  trends: {
    volume_trend: "+12% vs last week",
    acceptance_trend: "stable",
    response_time_trend: "improving"
  },
  
  alerts: [
    {
      level: "warning",
      message: "Response time increased 50% in last hour",
      time: "2024-01-15 14:30:00"
    }
  ]
};
```

### Connection Reports

Regular performance reviews:

```javascript
const monthlyReport = {
  period: "January 2024",
  
  summary: {
    total_delivered: 24567,
    total_revenue: 1102515.00,
    avg_daily_volume: 792,
    uptime: "99.7%"
  },
  
  by_buyer: [
    {
      name: "Premium Buyer Inc",
      volume: 12345,
      revenue: 555525.00,
      acceptance_rate: "97.8%",
      avg_response_time: "198ms",
      
      issues: [
        {
          date: "2024-01-07",
          type: "Downtime",
          duration: "2 hours",
          impact: "156 leads queued"
        }
      ]
    }
  ],
  
  recommendations: [
    "Increase Premium Buyer Inc cap by 20%",
    "Add backup buyer for weekend coverage",
    "Review rejection reasons for optimization"
  ]
};
```

## 🔄 Troubleshooting

### Common Issues

**Connection Problems**:
```javascript
// Invitation not received
const troubleshootInvite = {
  checks: [
    "Verify email address",
    "Check spam folder",
    "Resend invitation",
    "Try alternate email"
  ],
  
  solution: "Contact support if issue persists"
};

// Test failures
const troubleshootTest = {
  common_causes: [
    "Incorrect endpoint URL",
    "Authentication failure",
    "Field mapping mismatch",
    "Firewall blocking"
  ],
  
  debugging: {
    enable_verbose_logging: true,
    capture_raw_request: true,
    test_with_minimal_fields: true
  }
};
```

### Delivery Issues

Resolve delivery problems:

```javascript
// Timeout errors
const timeoutFix = {
  immediate: "Increase timeout to 60 seconds",
  
  investigation: [
    "Check buyer endpoint performance",
    "Review payload size",
    "Test network latency",
    "Consider batch delivery"
  ]
};

// High rejection rate
const rejectionAnalysis = {
  steps: [
    "Review rejection reasons",
    "Check field mapping accuracy",
    "Verify data quality",
    "Confirm buyer requirements",
    "Test with known good lead"
  ],
  
  common_fixes: {
    "missing_field": "Add required field mapping",
    "invalid_format": "Apply field transformation",
    "duplicate": "Check deduplication window"
  }
};
```

## 💡 Best Practices

### Connection Management

1. **Clear Communication**: Set expectations upfront
2. **Test Thoroughly**: Always test before going live
3. **Monitor Actively**: Watch for performance changes
4. **Document Requirements**: Keep specs updated
5. **Plan for Growth**: Design for scale

### Security

1. **Never Share Credentials**: Use invite system
2. **Rotate Regularly**: Update credentials quarterly
3. **Monitor Access**: Audit connection logs
4. **Limit Permissions**: Minimum necessary access
5. **Encrypt Everything**: Data in transit and at rest

### Performance

1. **Set Reasonable Timeouts**: Balance speed and reliability
2. **Implement Retries**: Handle transient failures
3. **Use Connection Pooling**: Reuse connections
4. **Monitor Latency**: Track response times
5. **Have Backups**: Always have alternate buyers

## 📚 Related Documentation

- [Multi-Buyer Distribution](./multi-buyer-distribution.md) - Advanced routing
- [Integration Errors](../troubleshooting/integration-errors.md) - Error handling
- [Vendor Management](../best-practices/vendor-management.md) - Relationship tips

---

🤝 **Connection Excellence**: Strong buyer connections are the foundation of successful lead distribution. Use the invite system for security, monitor performance closely, and maintain open communication!