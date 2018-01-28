#### This script can be used to deploy your static site to s3 with pretty URL's.

## Dependencies

* Existing static website hosting setup on S3
* AWS CLI installed and configured

## Usage

* Ensure you have the following environment variable set `STATIC_SITE_S3_BUCKET`. The value should match the s3 bucket name where you're hosting your website (i.e. myexamplesite.com)
* This uses S3's `sync` operation. This will recursively copy new and updated files from your local directory to the s3 destination you specify. NOTE: it will not remove files from S3 that have been deleted from your local directory.
* `cd` into the directory containing the folder with your static website files, then run `staticsitedeploy <directory>` where `<directory>` is the name of directory containing your static website files. 
* Check the output and make sure

## Disclaimer

* Not sure if this script is friendly for file names with spaces.