deploy_static_site () {
  s3_bucket_path=$2
  aws s3 sync $1 "s3://$s3_bucket_path"
  for i in `aws s3 ls s3://$s3_bucket_path --recursive | grep '.html' | awk '{print $4}'`;do
    [ -f "$i" ] || break
    original_file_name=$i
    new_file_name="${original_file_name/.html/}"
    aws s3 mv "s3://$s3_bucket_path/$original_file_name" "s3://$s3_bucket_path/$new_file_name" --content-type 'text/html'
  done
}

reload_static_site () {
  cloudfront_distro_id=$1
  aws cloudfront create-invalidation --distribution-id $cloudfront_distro_id --paths "/*"
}
