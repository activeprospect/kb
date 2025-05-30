---
URL: https://community.activeprospect.com/posts/4125276-sendgrid
Page Title: SendGrid
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-8b93ac54-5b9f-4380-88c9-62bf15eb6660.png
Scraped At: 2025-05-30 00:15:59.322
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 8, 2021. Published January 8, 2021.

Details

# SendGrid

ActiveProspect integrates with SendGrid to offer the Mail Send action of [the SendGrid v2 REST API](https://sendgrid.com/docs/API_Reference/Web_API/mail.html) directly through LeadConduit.

SendGrid is found in the list of Recipient Integrations:

![](https://content1.bloomfire.com/thumbnails/contents/002/452/766/original.png?f=1610142388&Expires=1748567752&Signature=la0FrIIyDVN8eDgkv9232Ldo2Ky58AJ~YA45URu5htGgQVY8g0J5uysNhMM-5pchxEJnZec62ZPqzpV0jJKB0jGoXFZL3lnLeAAQJ~chhm-EO0X5gciUiY5YYd-aY0ghw1HLzcYpeD-r-cQSzk1ct7nCXBO9s0qvALfFcCRr95tWcFP7LE1cYK1ngECmrpV3dsrYwxWwDz1p-~hK4PR84f39~FVEeNR7xPT8Hq1NtdxXpsIthXXY6DwhdO~amhZRP9P1IJwTrU~FrP06vtgnTTD2Qp91~p3eXkp9B7VArP2xil6-mRyprK8b4YbOepnCZ2qdHlanPMt5Pk9~f9ku6A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Finding What You Need

[Log in to get your SendGrid API User & Key.](https://app.sendgrid.com/settings/api_keys)

# Send Mail

## Required Configuration

- **API User:** The API User to invoke
- **API Key:** The Key associated with the API User
- **Subject:** The Email subject
- **From:** The email address the email will be shown as ""From""

## Optional Configuration

- **HTML:** The HTML version of your email body
- **Text:** The text version of your email body
- **Fromname:** The Name showed with the From Email
- **BCC:** A Blind Carbon Copy will be sent to any valid email address provided
- **Name:** Defaults to Title + First Name + Last Name, as available

## Required Lead Fields

- **Email:** LeadConduit email

## Optional Mapped Data

- **First Name:** LeadConduit first\_name
- **Last Name:** LeadConduit last\_name
- **Title:** LeadConduit title

Type something"

