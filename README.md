#### These bash functions can be used to deploy your static site to s3 with pretty URL's.

## Dependencies

* Existing static website hosting setup on S3
* AWS CLI installed and configured

## Usage

First, put the function defs into your `~/.bash_profile` and reload your shell.

### Push to your S3 bucket 
* `cd` into the directory containing the folder with your static website files.
* Run `deploy_static_site <directory> <s3 path to your hosting bucket>` where
`<directory>` is the name of the local directory containing your static website files.
* Check the output and make sure everything looks okay.
* Finished! No more S3 Upload UI's...

### Invalidate Cloudfront Cache
* NOTE: This invalidation specifies a single path for invalidation `/*`, which
invalidates any files so they are recached.
* Keep in mind that AWS charges for invalidations after the first 1k each month.
* Run `reload_static_site <cloudfront distribution id>`
* Check the output and make sure everything looks okay.
* Let the invalidation complete and your site should be refreshed.

### Disclaimer

* Not sure if `deploy_static_site` is friendly for file names with spaces.
* `deploy_static_site` strips the `.html` extension off of files and instead sets
their `content-type` on S3. This allows you use nice URL's on your website instead.
Just make sure you aren't pointing to any paths with `.html` or it'll give you a 404.
* This uses S3's `sync` operation. This will recursively copy new and updated
files from your local directory to the s3 destination you specify. NOTE: it will 
not remove files from S3 that have been deleted from your local directory.