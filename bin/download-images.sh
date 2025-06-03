#!/bin/bash
# Download images from the lead pricing document

set -e

# Create directory
mkdir -p "media/images/lead-pricing"

echo "Downloading images from lead pricing document..."

# Image 1 - Author avatar
echo "Downloading image 1..."
curl -L "https://content2.bloomfire.com/avatars/users/1316948/thumb/thumbnail.png?f=1606147181&Expires=1748567753&Signature=VfkgEPkvNhxlWa3O~JGUo1wZt8tb4FY5fJthGAVQc07ZaFmp7zSmnXWxKNMO25DJ3N4pSVx-V7FSDAEVj5HwE6X6SibKDQwIiIrf157-zY99GibgDbUDy-SpkDzD9kbHJCWHIOVTv7alOXcFAjUh91lY36MLoshP~c90qUZUoPiJcvYghhC1DFH4bKw4cgd3JfDmT0~pjeob6Wn4U9X5v1zKk97i8VBhZDbO8~IXqRbUejGEGHlsMNyIqDH76uEdjRSEA4O-othdVtz9et-r-4BcpyPBPzV1Q8LjWx9sZEKeW8G~9CsGifzfDdVCtALZwvda1PbxC0ir74gyiz8PCw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA" \
    -o "media/images/lead-pricing/lead-pricing-01-author.png" --silent --show-error

# Image 2 - Sources tab
echo "Downloading image 2..."
curl -L "https://content3.bloomfire.com/thumbnails/contents/002/373/743/original.png?f=1606258378&Expires=1748567753&Signature=h9980akWGtCaWB5cbnWQHFH0d9r~9yuIvKpGmtGYaeBhFujN6x5OiqXjurZ0SLJkaShvuYv2QcPqAVh6VA35w3RTkdd~r-eaKvBrQDi~Y~rnEA6XcFLR~9FN59YM1G8KgTQsZX0Y7~14a-VVGp5krkyNkHH2pegoGkgrLhVGRK0QF21UGzpxOdKuvWqQZNuVs1XH60HwkMkeaGifOCOVf51FJL2soS8g6golUKqGlCktM0INk3EAwWY14j-tgfartIvJ5yBDoWuJ~VNv03w31llMSjxytZGdWLSKiN9erNyDFYZ7UVQxhB0ruqi5SeaSW3aSfE-P7AtVYeG1u0ZXZg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA" \
    -o "media/images/lead-pricing/lead-pricing-02-sources-tab.png" --silent --show-error

# Image 3 - Submission docs price field
echo "Downloading image 3..."
curl -L "https://content2.bloomfire.com/thumbnails/contents/002/341/903/original.png?f=1605201927&Expires=1748567753&Signature=gWygNFlaxuzAZXdB2VtzIfj~yk4rn~8rbeMn0xgPHHzB2Ie8pjl2cjjWTpGTcXqvVibC~fSud~tnWhc8~bwEi47T~JqJTMNqXvqhjy2HFw036dUHpSjiyBF7kEe~WynOzddbwyRxFBYkGriSk4xC8NCtNCkVP~I2~wMoZ5KJILaAGypCkKBRBZ0oJ8qszl6JtMyf2gt7NoYAryMWcoQU-Qu0NmjHzD9LN6Q9Q~SlsmS1rUtzHYf8FNo-E46dunIwmSkyGZI2yoG2zdqJ66NzqrmjGZiUnf4SpMaBBS-2ka-gPTqfwk14ygzKrhYekTB7CBBNFzi9vSxHa59DA0WoYA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA" \
    -o "media/images/lead-pricing/lead-pricing-03-submission-docs.png" --silent --show-error

# Image 4 - Pricing toggle
echo "Downloading image 4..."
curl -L "https://content2.bloomfire.com/thumbnails/contents/002/341/905/original.png?f=1605201946&Expires=1748567753&Signature=sychOUJVqvk6w6evUxzKaXUaUi-hIY-Qpp9-PGrF3RTZOhxutwbI2Kgv8RPFTVl8a~sEY37fuWH1X4o00rqPdGmwyjNvuuwGe2Hkkgy5ILfMUlKXPgq5vKCxbS3yvKXSws9kVp8u30fz-H4fX-TmpAab5Pz6zv5BnDyiXwDDaF5HGiKpojHi4bl~olr76laGvtQRLNBRLcUlaN~tTI5rmjlqMws-FfVOhE828snu-gF~xVVXxJ5vePTxL9cNCC45~PzFypO7y5i7XV8seLjPn1Q0tvArDLVVAxWN60o0BXO0jQQzmTxEztU7uY4v16ADq1j3DiysW5X4EdOpAqmeiQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA" \
    -o "media/images/lead-pricing/lead-pricing-04-pricing-toggle.png" --silent --show-error

# Image 5 - Rule sets
echo "Downloading image 5..."
curl -L "https://content1.bloomfire.com/thumbnails/contents/002/341/906/original.png?f=1605201967&Expires=1748567753&Signature=vHzcS91YmcnYi47Nr9zQJkifRNlk6wLoh8u6UWlDNEvOdNYU8E7z85e~arbP5aJrncmGHS26~FwgIimElbGrxgI-Mm-Yr3fZMQD9pGLN6LJpuZDsnp6QO5BH5w2pVaCNKo2xoemovX~OZXT8F6C-C-17fRD~FSQWMhN1Ymhh0VXmdQPsA4YjVXuOfx8Tk0MpR6KzL4Ot1zQiBmCWUX27NbnmKF8sj2kFnUa39hqnPJw1eaIyA--SFJDj5mXQz4irUTLfl2wEgkCsO9zJlOOPKH7Eu8j593gEWGt2f8iMZHW~W1osQzj6lOK~0P53YtFsSEvyfaTMMSq13A8ndQll5Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA" \
    -o "media/images/lead-pricing/lead-pricing-05-rule-sets.png" --silent --show-error

# Image 6 - Navigation to buyers
echo "Downloading image 6..."
curl -L "https://content1.bloomfire.com/thumbnails/contents/002/373/758/original.png?f=1606258561&Expires=1748567753&Signature=iwygWIkfvKL46g0mT5QA-fj7NlM6OVFVuKMAzTsf0ou8WLjbt-gIZCJFaTCMSRHTmTmWO8sOjJeQmHTxlAhCTev3DOttVo-sDt3LofMCD~XeTsj2TepEZDuAL60ZAdZdMOjd6ewCbAIdjwkLoUZpQJUM5xoBbSn~e5vHGcJtihw6GkQ-DmN9SWs5XuRxhCtrldhHrwqrruKELBCH-DTAtCddVQaeBMn9c8zh8bQ-~rUdMWOsB9DZ3xi8kXptEWlupkx6G0j91b2aK9-fFaLaWMPqMwpzyaVjpIfR35MCqQPDYSXYO6coMqD70SzbCQtcQjKBb5Xr3kqGsPWmtImSbA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA" \
    -o "media/images/lead-pricing/lead-pricing-06-navigation.png" --silent --show-error

# Image 7 - Buyer pricing toggle
echo "Downloading image 7..."
curl -L "https://content2.bloomfire.com/thumbnails/contents/002/341/910/original.png?f=1605202033&Expires=1748567753&Signature=LDDsQ6DGtj25VEN1w4MEfcDs1S8YBFDWRb-oLGVon7pzQk4vrLsGW9mWy2KuqEGryVT-1sMh7IO5xbWhM4tAwTfygStO0WN5YNcnZEEFPZR9Vkct~EvB-UXQbafe5WCIsR-E1JKNspcvknx30~LV3ClPoffJw~A0GmBvDupPyq~lbvek4HdNqhcHyyDyxlHwkeRj6JWZwGHGldmBUUokKy43Bd~5jptMu-P8xAeur~7xtjN0NyEnfRpqM4XjcV5SnDLrwfXO3U38ieHflqEgAPtevsqf2J3o4cZRox3SMt7UaccFcsliank0GR2AKudVHr--dDzK64UDrPkEBHAe7Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA" \
    -o "media/images/lead-pricing/lead-pricing-07-buyer-pricing.png" --silent --show-error

# Image 8 - Page screenshot
echo "Downloading image 8..."
curl -L "https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-82ae8268-edf3-471f-b71a-82c436f90a4b.png" \
    -o "media/images/lead-pricing/lead-pricing-08-page-screenshot.png" --silent --show-error

# Two more images from the embedded links
echo "Downloading image 9..."
curl -L "https://community.activeprospect.com/memberships/7557576-caitie-clarke" \
    -o "media/images/lead-pricing/lead-pricing-09-profile-link.html" --silent --show-error || echo "Skipping profile link"

echo "Done! Downloaded images to media/images/lead-pricing/"
ls -la "media/images/lead-pricing/"