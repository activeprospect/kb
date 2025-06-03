---
URL: https://community.activeprospect.com/posts/4096909-sending-feedback-to-leadconduit
Page Title: Sending Feedback to LeadConduit
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:32.170
---
Vb9j6Vj2kH5A-wBK2ldtVtOpctHAj8aQxwagcmgbkFvBT4CA0FIgD7DO3vZ71~Qp-K-Es7tpWkdy9-QOL~XLrwjfxX2Ttci9yixS8x~ZBKa61lR3TJZ1cHd98K~07d6m14DpSmVyRBt37w5hbeQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 13, 2022. Published November 30, 2020.

Details

# Sending Feedback to LeadConduit

Code examples for recipients sending individual feedback to LeadConduit.

Note: You must [Enable Feedback for Recipients](https://community.activeprospect.com/posts/4096395-enabling-a-recipient-to-send-feedback-to-leadconduit) to use this feature.

**Generic Instructions**

Make an HTTP POST (web hook) request to the following URL:

```
https://app.leadconduit.com/feedback?event_id=#{event_id}
```

Replace #{event\_id} with the event ID sent along with the lead data.

You may send the body of the request in one of three formats: JSON, XML, or form encoding. You must include the Content-Type header so LeadConduit knows which format you have chosen to provide.

- For JSON use Content-Type: application/json
- For XML use Content-Type: text/xml
- For a standard submission form use Content-Type: application/x-www-form-urlencoded

LeadConduit will reply with JSON or XML. You may choose the format of the response using the Accept header.

- For JSON use Accept: application/json
- For XML use Accept: text/xml
- If you do not specify an **Accept** header, LeadConduit defaults to application/json.

# Example curl POST feedback with JSON response

## HTTP Request to LeadConduit

```
curl -X POST ""https://app.leadconduit.com/feedback?event_id=5af4b98aa8065fa3a79bf4b3"" \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'type=conversion&reason=SMS Delivery Succeeded'
```

## HTTP Response from LeadConduit

```
HTTP/1.1 201 Created
Header Content-Type: application/json; charset=utf-8
Body:
{
    ""lead"": {
        ""first_name"": ""HULK"",
        ""id"": ""5bb3890e9000974b35a55133"",
        ""last_name"": ""SMASH""
    },
    ""outcome"": ""success""
}
```

# Example form POST feedback with JSON response

## HTTP Request

```
Method: POST
URL: https://app.leadconduit.com/feedback?event_id=5af4b98aa8065fa3a79bf4b3
Header: Content-Type: application/x-www-form-urlencoded
Header: Accept: application/json
Body:
type=return&reason=Wrong+number
```

## HTTP Response

```
HTTP/1.1 201 Created
Header: Content-Type: application/json
Body:
{
    ""lead"": {
        ""email"": ""joeblow@gmail.com"",
        ""first_name"": ""Joe"",
        ""id"": ""57913b9911c754b2cb643cf3"",
        ""last_name"": ""Blow"",
        ""phone_1"": ""5125551212""
    },
    ""outcome"": ""success"",
    ""reason"": null
}
```

# Example JSON feedback with JSON response

## HTTP Request

```
Method: POST
URL: https://app.leadconduit.com/feedback?event_id=5af4b98aa8065fa3a79bf4b3
Header: Content-Type: application/json
Header: Accept: application/json
Body:
{
    ""reason"": ""Wrong number"",
    ""type"": ""return""
}
```

## HTTP Response

```
HTTP/1.1 201 Created
Header: Content-Type: application/json
Body:
{
    ""outcome"": ""success"",
    ""reason"": null,
    ""lead"": {
        ""id"": ""57913b9911c754b2cb643cf3"",
        ""email"": ""joeblow@gmail.com"",
        ""first_name"": ""Joe"",
        ""last_name"": ""Blow"",
        ""phone_1"": ""5125551212""
    }
}
```

# Example XML feedback with XML response

## HTTP Request

```
Method: POST
URL: https://app.leadconduit.com/feedback?event_id=5af4b98aa8065fa3a79bf4b3
Header: Content-Type: text/xml
Header: Accept: text/xml
Body:
<?xml version=""1.0""?>
<feedback>
  <type>return</type>
  <reason>Wrong number</reason>
</feedback>
```

## HTTP Response

```
HTTP/1.1 201 Created
Header: Content-Type: application/json
Body:
<?xml version=""1.0""?>
<result>
  <outcome>success</outcome>
  <reason/>
  <lead>
    <id>57913b9911c754b2cb643cf3</id>
    <first_name>Joe</first_name>
    <last_name>Blow</last_name>
    <email>joeblow@gmail.com</email>
    <phone_1>5125551212</phone_1>
  </lead>
</result>

```

Type something"
