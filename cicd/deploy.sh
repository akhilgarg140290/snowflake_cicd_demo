#!/bin/bash
set -e

echo "Deploying to Snowflake with snowsql..."

snowsql -a $SNOWFLAKE_ACCOUNT \
  -u $USER \
  -p $PASSWORD \
  -r $ROLE \
  -w $WAREHOUSE \
  -d $DATABASE \
  -s $SCHEMA \
  -f dev/create_tables.sql

snowsql -a $SNOWFLAKE_ACCOUNT \
  -u $USER \
  -p $PASSWORD \
  -r $ROLE \
  -w $WAREHOUSE \
  -d $DATABASE \
  -s $SCHEMA \
  -f dev/stage_sales_data.sql

snowsql -a $SNOWFLAKE_ACCOUNT \
  -u $USER \
  -p $PASSWORD \
  -r $ROLE \
  -w $WAREHOUSE \
  -d $DATABASE \
  -s $SCHEMA \
  -f dev/transform_sales_data.sql
