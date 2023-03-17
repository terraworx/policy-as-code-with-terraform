# Examples

### Policy as Code using HashiCorp Sentinel

```python
import "tfplan/v2" as tfplan

// Sentinel filter expression used to filter out all aws_s3_bucket resources 
// that will change once the Terraform plan has been applied.
aws_s3_buckets = filter tfplan.resource_changes as _, resource_changes {
    resource_changes.type is "aws_s3_bucket" and
        resource_changes.mode is "managed" and
        (resource_changes.change.actions contains "create" or
            resource_changes.change.actions is ["update"])
}

// Sentinel rule used to evaluate the configuration of all filtered aws_s3_bucket resources. 
// The rule ensures when all changes have been applied, the S3 bucket configuration will 
// have the "private" ACL configured.   
aws_s3_bucket_acl_is_private = rule {
    all aws_s3_buckets as _, aws_s3_bucket {
        aws_s3_bucket.change.after.acl is "private"
    }
}

main = rule {
    aws_s3_bucket_acl_is_private
}

```
