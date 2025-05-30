---
URL: https://community.activeprospect.com/posts/5144897-do-i-need-an-aws-account-to-use-firehose
Page Title: Do I need an AWS account to use Firehose?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-d1a018bb-668d-44b1-a9c5-d921c8170f90.png
Scraped At: 2025-05-30 00:17:29.406
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567824&Signature=cYnnDSXr5ZeXlCOoQowhSte6peaqxZw3iho2LVP-pIwkAOsQpql8rNpS8b5eOdA0~5ALLrLxpySVzLxQ0o8UH9cIYmHSPi3bHFfQVKHhTDclCnABUuUzEPwmfo3ZuMIuUwpbm3pI0nTzSOc7HqQ2TNSso9Mvn4~komTd4ZE4dv15WyAm8Vdhy8MgcVqzb9~zN29~hzm58xcJHhgpeYIp5ri9kUr5qYZuULK1XFd4usOwNYRV8bKXqoGIZc~9B2lOOiNfMsLjSZuh2M2TV0ACjLjAXdFV7ATHfhRNFv021K-ZnShlXVDSok~074l~XtT7SD8p~MnF-qQy0gJVnxGcqA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated August 23, 2023. Published August 23, 2023.

Details

# Do I need an AWS account to use Firehose?

Yes, and you’ll need to [configure an S3 bucket](https://docs.aws.amazon.com/firehose/latest/dev/create-destination.html) with the [appropriate permissions](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html). It’s important that you scope the amount of access ActiveProspect has to your account by creating an IAM user.

Type something"

