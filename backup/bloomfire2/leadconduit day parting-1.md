---
URL: https://community.activeprospect.com/posts/4540073-leadconduit-day-parting?video_markers=day%2Cdays
Page Title: LeadConduit Day Parting
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:59.268
---
h1I6gvH4zedJ68ex-jaTCqDqcU0MrAHoBcVRJAk7uwgNyuCwxmGqSJS992FBZHnpUrkBwl8qFOsQHXOjlKQWorgezGSM-KtEIgcearIObR97axX5hADiNn3yqnMKBbmLeeGRyAbK~KCR5iZMkUw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated December 22, 2021. Published December 20, 2021.

Details

# LeadConduit Day Parting

Using Submission Timestamp in Rules

You can create rules that operate based on the time of day or day of the week to determine how a lead is handled.

Collapse

00:00

04:48

![](images/image-1.png)

#### Day\_Parting.mp4

**Use Cases:**

- Acceptance Criteria: Accepting lead submissions during specified date/time blocks, like Monday through Friday or 9:00AM to 5:00PM.
- Volume Caps: Limiting the number or rate at which lead submissions are accepted during specified time blocks.
- Pricing: Setting different Price values based on the submission date and/or time.
- Delivery to recipients:
  - Deliver to a recipient only during specified date/time blocks.
  - Distribute a lead to different recipients depending on the submission date/time. (Recipient “A’ gets weekday leads, Recipient “B” gets Weekend leads)
  - Recipient Mappings: Map parameters in delivery steps based on the current date or time. (Flag a lead as “Weekend” if submitted during the weekend, as “Weekday” if submitted during the week.)
- Filters: Specify date/time blocks in filter rules.
  - Allows you to reject a lead based on a combination of submission date/time and other submitted/appended data.

**How to use:**

1. In any rule, select “Submission Timestamp” as the left-hand side, and click the “Gear” icon.
2. In the menu, enter the desired format tokens (See the list below) and select the time zone to which you want the submission timestamp converted for the purposes of this rule.
3. Be sure to click “Save”.
4. Set up the rest of the rule as needed. See the examples shown below.

#### Date Format Tokens:

|  | Token | Output |
| --- | --- | --- |
| Month | M | 1 2 ... 11 12 |
|  | Mo | 1st 2nd ... 11th 12th |
|  | MM | 01 02 ... 11 12 |
|  | MMM | Jan Feb ... Nov Dec |
|  | MMMM | January February ... November December |
| Quarter | Q | 1 2 3 4 |
|  | Qo | 1st 2nd 3rd 4th |
| Day of Month | D | 1 2 ... 30 31 |
|  | Do | 1st 2nd ... 30th 31st |
|  | DD | 01 02 ... 30 31 |
| Day of Year | DDD | 1 2 ... 364 365 |
|  | DDDo | 1st 2nd ... 364th 365th |
|  | DDDD | 001 002 ... 364 365 |
| Day of Week | d | 0 1 ... 5 6 |
|  | do | 0th 1st ... 5th 6th |
|  | dd | Su Mo ... Fr Sa |
|  | ddd | Sun Mon ... Fri Sat |
|  | dddd | Sunday Monday ... Friday Saturday |
| Day of Week (Locale) | e | 0 1 ... 5 6 |
| Day of Week (ISO) | E | 1 2 ... 6 7 |
| Week of Year | w | 1 2 ... 52 53 |
|  | wo | 1st 2nd ... 52nd 53rd |
|  | ww | 01 02 ... 52 53 |
| Week of Year (ISO) | W | 1 2 ... 52 53 |
|  | Wo | 1st 2nd ... 52nd 53rd |
|  | WW | 01 02 ... 52 53 |
| Year | YY | 70 71 ... 29 30 |
|  | YYYY | 1970 1971 ... 2029 2030 |
|  | Y | 1970 1971 ... 9999 +10000 +10001 Note: This complies with the ISO 8601 standard for dates past the year 9999 |
| Week Year | gg | 70 71 ... 29 30 |
|  | gggg | 1970 1971 ... 2029 2030 |
| Week Year (ISO) | GG | 70 71 ... 29 30 |
|  | GGGG | 1970 1971 ... 2029 2030 |
| AM/PM | A | AM PM |
|  | a | am pm |
| Hour | H | 0 1 ... 22 23 |
|  | HH | 00 01 ... 22 23 |
|  | h | 1 2 ... 11 12 |
|  | hh | 01 02 ... 11 12 |
|  | k | 1 2 ... 23 24 |
|  | kk | 01 02 ... 23 24 |
| Minute | m | 0 1 ... 58 59 |
|  | mm | 00 01 ... 58 59 |
| Second | s | 0 1 ... 58 59 |
|  | ss | 00 01 ... 58 59 |
| Fractional Second | S | 0 1 ... 8 9 |
|  | SS | 00 01 ... 98 99 |
|  | SSS | 000 001 ... 998 999 |
|  | SSSS ... SSSSSSSSS | 000\[0..\] 001\[0..\] ... 998\[0..\] 999\[0..\] |
| Time Zone | z or zz | EST CST ... MST PST |
|  | Z | -07:00 -06:00 ... +06:00 +07:00 |
|  | ZZ | -0700 -0600 ... +0600 +0700 |
| Unix Timestamp | X | 1360013296 |
| Unix Millisecond Timestamp | x | 1360013296123 |

**Examples:**

Monday through Friday:

Use format ""dddd"" and operator ""is not included in"" to exclude Saturday and Sunday:

![](images/image-2.png)

8:30AM to 4:45PM every day. Use format ""HHmm"" and operator ""is between"" with value ""0830-1645"":

![](images/image-3.png)

Block of hours on Weekdays only. Combine the above techniques in an ""All"" rule set:

![](images/image-4.png)

Weekday business hours with lunch break. Make a 2-rule ""OR"" set to handle the pre-lunch and post-lunch hours ""ALL""ed with a solo rule to exclude Saturdays and Sundays:

![](images/image-5.png)

Type something"
