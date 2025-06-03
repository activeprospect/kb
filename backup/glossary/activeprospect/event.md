---
URL: https://community.activeprospect.com/series/4051250/posts/4054502-activeprospect-product-glossary
Page Title: Event
Screenshot URL: 
Scraped At: 2025-05-30 00:16:21.154
---

# Event

The state of a lead at a particular step in a flow. Each lead typically has multiple events. An event includes a complete snapshot of the lead at the step, including :
- The data as submitted by the source.
- Certain system data such as the identity of the source and the timestamp of the submission.
- The outcome status of each step, as in "success", "failure", "error" or "skip"
- Data parsed from the response bodies of enhancement or delivery steps ("appended" data).
- Time stamps and technical details (connection information, request and response) of each step in the flow for that lead.
- The response that LeadConduit returns to the source. This includes the final lead status, a unique lead identifier, and optionally a reason if the final lead status is not "success".