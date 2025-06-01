# Providing Feedback via LeadConduit

## What is feedback?

After you have accepted a lead submission it often becomes necessary to “close the loop” by providing follow up on that lead. For example, if you are unable to contact the consumer, you might want to return the lead. LeadConduit provides a feedback feature to enable this. 

Lead returns are an example of negative feedback. You can also provide positive feedback about a lead using the feedback feature. If you converted the lead into a customer, you can use feedback to indicate the lead was converted.

## What types of feedback are supported?

Currently, LeadConduit only supports the `return` and the `conversion` feedback types. In the future we may add additional or customizable feedback types.

## How do I provide feedback on a lead?

Send an HTTP POST to the following URL: `/feedback?event_id=#{event_id}`

Provide the event ID sent along with the lead for which you are providing feedback. See the below section for an explanation of the event ID. The request body should include XML, JSON, or a standard URL encoded form post. You must provide the correct Content-Type header so that LeadConduit knows which format you are sending.

Provide the `type` and `reason` fields. The only accepted types are `return` and `conversion`.

### Example XML (Content-Type: text/xml)

`<?xml version="1.0" encoding="utf-8" ?>`  
`<feedback>`  
  `<type>return</type>`  
  `<reason>Wrong number</reason>`  
`</feedback>`

### Example JSON (Content-Type: application/json)

`{`  
  `“type”: “return”,`  
  `“reason”: “Wrong number”`  
`}`

### Example Form POST (Content-Type: application/x-www-form-urlencoded)

`type=return&reason=Wrong+number`

## How does LeadConduit respond to a feedback request?

Your feedback may be accepted or not accepted by LeadConduit. The decision to accept feedback is configured by the LeadConduit account holder who is receiving your feedback. For example, if you are only allowed to provide rejects within 7 days of receipt of the lead, and you are trying to return it on the 8th day, your return may not be accepted. Your system should record and track whether feedback was accepted, otherwise your end of the month numbers may be different from the numbers recorded by LeadConduit.

LeadConduit can respond to feedback requests with XML, JSON, or plain text. If you want to receive XML, you must provide the `Accept: text/xml` header. If you want JSON, you must provide the `Accept: application/json` header. If you want plain text, you must provide the `Accept: text/plain header`.

### Example XML response (Accept: text/xml)

`<?xml version="1.0" encoding="utf-8" ?>`  
`<result>`  
  `<outcome>success</type>`  
`</result>`

Or 

`<?xml version="1.0" encoding="utf-8" ?>`  
`<result>`  
  `<outcome>failure<type>`  
  `<reason>Must provide return within 7 days</reason>`  
`</result>`

### Example JSON response (Accept: application/json)

`{`   
  `“outcome”: “success”`  
`}`

Or

`{`  
  `“outcome”: “failure”,`  
  `“reason”: “Must provide return within 7 days”`  
`}`

### Example plain text response (Accept: text/plain)

`outcome: success`

Or 

`outcome: failure`  
`reason: Must provide return within 7 days`

If something goes wrong while processing your feedback request, you will get an error response. You can try to resend the feedback, but it’s best to follow up with the LeadConduit account holder for help resolving the error. Below is an example of an error response given in JSON.

`{`  
  `“outcome”: “error”,`  
  `“reason”: “Something really unexpected happened!”`  
`}`

## What is an Event ID?

Every lead in LeadConduit has one or more associated events. An event describes something that happened to the lead during processing in LeadConduit.

An event is recorded when flow processing is complete. This event records the source which submitted the lead, the time the submission was received, how long the flow took, how many flow steps were processed, and the time the flow was completed. 

An event is also recorded for every step in your flow. These events record the time the step processing started, which recipient is receiving the lead (except for filter steps, which have no recipient), how long the step took, and the time the step was completed. 

When sending a lead to a recipient, the LeadConduit account holder can send the lead ID and/or the event ID for that flow step. Normally, you might expect that the lead ID could be used to provide feedback about a lead. The reason we require the event ID instead is that it reveals who is providing the feedback, what flow should handle the feedback, and what acceptance criteria and mappings to apply to the feedback request. The lead ID would only tell us which lead you are providing feedback on, but not how to process your feedback.

## What if I don’t have an event ID? Can I still provide feedback using the API?

No. If you are not receiving an event ID with leads coming from LeadConduit, contact the LeadConduit account holder and request that they start sending the event ID. You will need to tell them which field in your system should be used to record the event ID. 