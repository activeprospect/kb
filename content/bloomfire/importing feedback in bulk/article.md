---
URL: https://community.activeprospect.com/series/4180128/posts/4117497-importing-feedback-in-bulk
Page Title: Importing Feedback in Bulk
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-a5db1300-4c82-4a9e-a03a-fdc38be671fb.png
Scraped At: 2025-06-02 22:29:33.600
---


[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated June 9, 2021. Published December 23, 2020.

Details

# Importing Feedback in Bulk

If recipients provide Feedback in batches rather than real-time, you can import that Feedback from a CSV file.

Prepare a CSV file with a column holding the Event IDs and optionally a column holding the Reason for each lead’s Feedback. Column headers are optional. Feedback requires the lead's recipient Event ID to identify the lead being returned or converted.

Excel Example (Save as CSV):

![](images/image-1.png)

Notepad++ Example (Save with "".csv"" filename appendage:

![](images/image-2.png)

In LeadConduit's pop-out menu, click on ""Leads"", then ""Lead Events"". Click on the “Import Feedback” button in the upper right corner of the page:

![](images/image-3.png)

Select either Conversions or Returns and click “Next”:

![](images/image-4.png)

Browse to or drag and drop your CSV file into the Box:

![](images/image-5.png)

Click “Next”:

![](images/image-6.png)

The topmost warning appears because the file doesn’t have column headers. If your file doesn’t use a header line, uncheck the “CSV Column Header” box.

Select which columns contain the Event ID and the reason. Mark any other columns “Do Not Import”.

The warnings disappear as the conditions are corrected.

![](images/image-7.png)

Click “Next”

You’ll be presented with a summary of the number of Feedback records to be imported. Check the total and if it looks correct, click “Confirm Import”.

![](images/image-8.png)

When the progress gauge shows that the import has finished, clicking “View Events” will take you back to the “Events” tab:

![](images/image-9.png)

Type something
