# “Onboarding, from the lens of an Implementation Engineer”

*This piece is joined by its sister piece, the [“A Guide to being an Implementation Engineer”](https://docs.google.com/document/d/1K-wON5Z7S9SaBUlEio-RaV-lgdnlqcMVVpuV2Shn7v4/edit?usp=sharing)*  
*Read the other one first, if you haven’t already.*

*5-13-19 Notes: Continuing work on this today. Had an idea for a document detailing PAYG onboarding. Will be collapsing that into this, as there are many similarities.*  
*6-3-19 Notes: Complete*

# **Introduction**

Alright, you got the hang of IE-ing, and now you are ready to share the AP product suite “fire of the gods” with our brand-spanking new clients, who *may* still be living in the stone age in terms of lead delivery, lead authenticity, and TCPA consent recording. Or, maybe they just got the memo we are better and are now joining us\! Either way, that means it’s time to get ‘em onboarded\!

![][image1]  
*Stolen from Smartsheet.com*

This guide is intended to help you understand what it means to onboard a client.  There are 3 sections:

1. [Section 1: So, What exactly is Onboarding?](#bookmark=kix.tx8k42xg6ze7)   
2. [Section 2: Onboarding-Specific Considerations](#bookmark=kix.4n8e3fwlz1f)  
3. [Section 3: The Onboarding Process](#bookmark=kix.qfttjonq110p)

**Section 1: So, What *exactly* *is* Onboarding?**

A couple specifics and notes on Onboardings:

What is onboarding?  
Onboarding is the process by which a Client Success Manager discovers how a client wants to use the ActiveProspect software suite, and the Implementation Engineer sets it up for them and educates them, along the way, on how to set it up themselves and how the software suite works.

Where precisely does onboarding sit in the client’s lifecycle with us?  
Clients first hear of ActiveProspect through our Marketing and Sales team’s customer acquisition efforts or through client referrals from satisfied customers. The sales team convinces them we’re valuable to them, and they sign a contract to become clients. During the sales process, the implementation details and the metrics we will use to measure the success of the implementation are discussed, designed, and included in the contract. At that point, they are onboarded by a Client Success Manager and an Implementation Engineer (you) in order to implement what has previously been designed to meet their business objectives. .

Note: “Onboarding” as defined in this document only applies to contracted clients, and does not include PAYG customers. 

Why is onboarding so important to get right?  
Again, the Sales team has promised a better future for the prospects-turned-clients. It is the Client Success’s role to deliver on that promise for them, not only today but the entirety of their time with us. 

The onboarding process in particular is the client’s very *first* interaction with what they paid for, the software suite. To complicate matters, the software is fairly technical and our clients are often not; they are marketers, lead generators, lead buyers who have never heard of HTTP. By getting them set up and showing them the ropes as smoothly, quickly, and painlessly as possible, they can see the value in LeadConduit immediately and feel confident in our ability to provide that value for them long-term.

**Section 2: Onboarding-Specific Considerations**

A typical client onboarding involves 1 CSM and 1 Implementation Engineer. As the CSM manages the relationship with the client, explores what their needs are, and maximizes our revenue from that relationship, the Implementation Engineer configures our software to the needs of the client and finds sustainable, easily maintainable ways to do so. This also includes proactively offering suggestions about how to improve requests that are inefficient, surfacing up feature requests and edge cases to the Product team, and finding creative ways to solve problems our products might not be built to solve.

This requires you to be exceptionally familiar with the ActiveProspect software suite. You will have a more senior IE with you in the beginning there to assist you, but at this point you should:

* Have a strong, strong understanding of how and why clients use LeadConduit, SuppressionList, and TrustedForm.  
* Know the three means in which clients are able to use LeadConduit. While most clients will be using LeadConduit as a Passthrough, some clients may want to use LeadConduit as an Endpoint or just run a file full of leads on a flow. Review the [Implementation page](https://activeprospect.com/products/leadconduit/implementation/) on the 3 ways clients can use LeadConduit, and understand what information you need from the client and the clients needs from you in each of these configurations.  
* Know as much as you can about [the mechanics of TrustedForm](https://support.activeprospect.com/hc/en-us/categories/200128909-TrustedForm), how the script is implemented (and tricked), and how claims can be made via LeadConduit or the [TrustedForm API](https://support.activeprospect.com/hc/en-us/sections/200326529-API).   
* Know how to use the [SuppressionList API](https://support.activeprospect.com/hc/en-us/sections/200326559-The-SuppressionList-API) and the basics of the [LeadConduit API](https://docs.activeprospect.com/leadconduit/reference.html). Definitely have built out a small library for API calls for yourself by now

Knowing the items above, we can move forward to learning about the onboarding process.

**Section 3: The Onboarding Process**

I’m certain the Onboarding Process has been outlined for other role, in other spots, whether in Notion, Confluence, etc. *The aim of this guide, however, is to focus specifically on what it means to be the technical, Implementation Engineer on the onboarding*. 

I divide implementation into 3 phases: ***Discovery***, ***Implementation***, and ***Testing***.

Nested within these 3 phases are up to three items you will be juggling at once: ***Sources***, ***Processing***, and ***Recipients***. Why? Because, at the end of the day, the leads are coming from one place (Source), we’re doing something with it in LeadConduit (they’re being Processed) and they’re probably ultimately going to some other place (Recipients). 

So you could say the process can be boiled down to this wireframe:

1. Discovery  
   1. Sources  
   2. Processing  
   3. Recipients  
2. Processing  
   1. Sources  
   2. Processing  
   3. Recipients  
3. Recipients  
   1. Sources  
   2. Processing  
   3. Recipients

1. **Phase 1: Discovery**

***A) What is the “Discovery” phase?***

In the **Discovery** phase, you will learn about the business needs they’re trying to satisfy. 

For example, maybe they want all their Facebook Leads sent to their lead buyers’ Zoho.  
Or maybe they’re receiving leads from 5 sources and want to receive them all in their Salesforce.  
Or maybe they’re page scanning with TrustedForm and want the leads to send to their CRM dependent on the page scan.

You’ll want to able to summarize what exactly the client wants to do, and visualize how that should look like with LeadConduit, TrustedForm, and/or SuppressionList. At this point you should be able to do that fairly quickly.

***B) What does the “Discovery” phase entail for you?***

Relevant items about **Sources**:

* Clients may want to assign some sort of value with each Source, like a Source ID. The kick-off call is a good time to figure this out.  
* Determine what data format the Source will be sending data (JSON/XML/form POST)  
* Learn if it is valuable to the client to see lead performance by Source. This will become relevant in the Implementation phase because it is possible to process leads through a single Source but have each lead post come with a field value (like a Website URL), and inbound map a separate field (like, a Campaign Sub ID) to the lead *based* on that field value. What results is in one LC Source, with clients tracking the “Sub-source” within that LC Source in some fashion. The kick-off call is when you should learn about this.  
* Make sure you’ve *really* got an idea of all Sources they’re planning to send leads from. Make sure they haven’t left anything by double checking if there was anywhere else, at all, leads could come from.

Relevant items about **Processing**:

* There are a seemingly infinite number of ways to configure LeadConduit for lead processing. Obtain a *rock solid* understanding of what they are trying to do during that kick off call with the CSM. With more experience you will learn the possible hiccups in implementations and what information is necessary to obtain for a smooth implementation.  
  * It goes without saying, but it really helps to write this down.

Relevant items about **Recipients**:

* If their configuration involves lead delivery, remember to get access to the posting docs of the API in question. You’ll be using that in the Implementation step, next.  
* Keep in mind that recipients can span many types... it may be a CRM, a Dialer, purely an email delivery, Batch File Delivery, etc. It’s important to obtain and review whatever documentation the client has, on how to deliver their leads.   
  * Speaking from experience, clients can sometimes provide one API doc in the beginning of the onboarding, and literally 3 others at other points. Especially if the folks you’re speaking to are not technical or less experienced in digital marketing. This can be very frustrating, as you begin testing and people complain that it’s not working and you tell them you’re building around an API doc that turns out is not the right one.  
    * It is helpful to confirm, if you receive multiple different API docs or just sense something is off, whether the API doc you’re building your recipient integration around is accurate.

Note: It is easy to confuse “Recipient” with “Recipient Integration”. 

* When I say “Recipient” above, I mean the lead’s ultimate destination.  
* Keep in mind that all integrations (resold marketplace integrations, Bring-Your-Own-Credential integrations, all enhancements) are all technically recipient integrations. The purpose of these are to make a call to LeadConduit with some data, and return a response with some data (available going forth as Appended Data).

2. **Phase 2: Implementation**  
   

***A) What is the “Implementation” phase?***

In the **Implementation** phase, you actually build out the LeadConduit Flow as should serve the purpose of the client.

***B) What does the “Implementation” phase entail for you?***

Relevant items about **Sources**:

* You’ll add all known Sources to the Flow.

Relevant items about **Processing**:

* When building a Flow out, build solutions that are...  
  * Easy to Maintain  
    * You want to build the flow in a way that will not consume too much time the next time you need to tinker with it.  
      * Like for example, if you know or think some fields will change, be added, or be removed, you should design around that.   
  * “Childproof”  
    * Flows should account for imperfections in the Source’s submitted data.  
      * For example, if the Source sends, for an example, a Source ID that is not character-for-character, case-sensitive, a match with the client specs, the lead should not only be failed but a clear error message should be sent in the return so that the Source knows how to correct themselves.  
      * An added benefit of a set up like that it reduces work for you, pushing it back on the Source.  
    * Another example of building a childproof flow is ensuring Step Criteria account for all possible conditions, and if a lead comes through that does not satisfy Step Criteria, it is failed when appropriate. And of course a clear failure messages should be returned.

Relevant items about **Recipients**:

* \[None for this phase\]

3. **Phase 3: Testing**

***A) What is the “Testing” phase?***

In the **Testing** phase, you and the Sources will send some leads through the flow and ensure the Flow is working properly. 

In this stage there can be a lot of back and forth among yourself (the IE), the client, and any technical people managing any recipient’s systems, as you work towards ensuring everything is being processed and sent correctly. During this back and forth you will finetune aspects of the lead submission to LC, processing, or delivery to the recipients until the Flow operates according to the client’s needs.

***B) What does the “Testing” phase entail for you?***

This can be a lengthy phase of the onboarding. Unfortunately people you communicate with are sometimes confused about the flow of data or just bad at communication. This results in a lot of correspondence to resolve seemingly basic items.

This is the recommended order of testing:

1. ***First**, the **recipients**, test the recipient and ensure the data is delivered correctly.*   
   1. The response for early test leads will more often than not be a failure response. You will want to go back to the client with the HTTP Request and Response and see if the client can share that with someone familiar with the recipient’s technical system, and see where LC’s request can be optimized.  
2. ***Second**, **processing**, test the lead flow and ensure the data is being processed correctly and the filters are behaving as expected.*  
   1. This could be as simple as sending a lead through, sharing the Event with the client, and walking through each step to make sure everyone’s on the same page.  
   2. Usually though the client will have a specific idea of what they want to happen to the lead and you’ll know if the Flow does that or not.  
3. ***Third**, the **sources**, test with each vendor to ensure they’re able to successfully post data into LeadConduit.*  
   1. Share the posting docs for each Source with each Source and make sure everything looks good, end to end.  
      1. If Sources mess up on the data they send, try to get them to correct their post vs. using something like inbound mapping as a bandaid of a fix.  
4. ***Fourth**, go live.*

# **In Conclusion**

And there you have it.