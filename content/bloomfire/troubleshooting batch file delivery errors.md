---
URL: https://community.activeprospect.com/posts/4124323-troubleshooting-batch-file-delivery-errors
Page Title: Troubleshooting Batch File Delivery Errors
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-312aec58-7c70-42ca-a4fd-d48ce3b71173.png
Scraped At: 2025-05-30 00:15:58.447
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 7, 2021. Published January 7, 2021.

Details

# Troubleshooting Batch File Delivery Errors

**Error:** Not delivered due to error: Message length is more than 10485760 bytes long: 'XXX'.

**Resolution:**

1. Enable .zip file deliveries by checking **Compress delivered files into .zip files** under the Advanced setting in File Settings.
2. After saving the settings, click ""Resend"" under Processed Files and select the option to use new settings.

* * *

**Error:** Not delivered due to error: Message rejected: could not be delivered to 'xxx@xxx.xx'

Note: If no action is taken, leads will be included in the next scheduled delivery.

**Resolution:**

1. Please ensure that **delivery@yourlead.info** is whitelisted
2. Ensure all email addresses the batch file is being delivered to are active and not responding with bounce notifications - this includes both Permanent bounces (account issues) and transient bounces (typically an Out of Office notification).
   - **Optional:** Edit Batch File Delivery to remove out of office emails from the delivery.
3. After ensuring that there are no bounce notifications, click ""Resend"" under Processed Files.

* * *

**Error:** Not delivered due to error: Error establishing initial connection to SFTP: getaddrinfo ENOTFOUND

**Resolution:**

1. Please ensure that domain/subdomain that you are trying to deliver to exists and is publicly accessible.
2. Ensure all the domain is spelled correctly in the the batch file configuration.

Type something"

