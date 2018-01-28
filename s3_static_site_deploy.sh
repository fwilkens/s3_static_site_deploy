staticsitedeploy () {
  aws s3 sync $1 "s3://$STATIC_SITE_S3_BUCKET"
  for i in `aws s3 ls s3://$STATIC_SITE_S3_BUCKET --recursive | grep '.html' | awk '{print $4}'`;do
    [ -f "$i" ] || break
    original_file_name=$i
    new_file_name="${original_file_name/.html/}"    
    aws s3 mv "s3://$STATIC_SITE_S3_BUCKET/$original_file_name" "s3://fletcherwilkens.com/$new_file_name" --content-type 'text/html'
  done      
}