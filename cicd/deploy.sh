#!/bin/bash

set -e

echo "Logging into Snowflake..."

# Use the passed environment variables
snow login --authenticator password \
  --account "$SNOWFLAKE_ACCOUNT" \
  --user "$USER" \
  --password "$SNOWFLAKE_PASSWORD"

echo "Running deployment for database: $DATABASE, schema: $SCHEMA"

# Run SQL scripts (adjust files as needed)
for sql_file in dev/create_tables.sql dev/stage_sales_data.sql dev/transform_sales_data.sql; do
  echo "Executing $sql_file..."
  snow sql -a "$SNOWFLAKE_ACCOUNT" -u "$USER" \
    -r "$ROLE" -w "$WAREHOUSE" \
    -d "$DATABASE" -s "$SCHEMA" \
    -f "$sql_file"
done

echo "✅ Deployment completed successfully."
