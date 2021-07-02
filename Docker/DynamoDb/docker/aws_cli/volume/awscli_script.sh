
# Cleanup dynamo db

aws dynamodb list-tables --endpoint-url http://dynamodb-local:8000 --region us-east-1  \
| jq .'TableNames[]' -r | xargs -ITABLE -n 1 aws dynamodb delete-table  \
--endpoint-url http://dynamodb-local:8000 --region us-east-1 --table-name TABLE

# Create table
aws dynamodb create-table --cli-input-json file://ProductCatalog_schema.json --endpoint-url http://dynamodb-local:8000 --region us-east-1

# Populate with data
aws dynamodb batch-write-item --request-items file://ProductCatalog_content.json --endpoint-url http://dynamodb-local:8000 --region us-east-1

