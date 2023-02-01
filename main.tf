resource "aws_s3_bucket" "s3bucket" {
  count  = var.no_of_buckets
  bucket = var.bucket_name[count.index]
  versioning {
    enabled = var.enabled
  }
}
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id
  acl   = "private"
  
  /*owner {
    id = var.owner_canonical_id
  }
  access_control_policy {
    grant {
      grantee {
        id   = var.user_canonical_id
        type = "CanonicalUser"
      }
      permission = var.user_permission
    }  */
}


