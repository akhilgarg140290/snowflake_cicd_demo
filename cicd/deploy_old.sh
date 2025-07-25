#!/bin/bash
set -e

# Log into Snowflake using env vars
snowsql -a "$SNOWFLAKE_ACCOUNT" \
        -u "$SNOWFLAKE_USER" \
        -p "$SNOWFLAKE_PASSWORD" \
        -r "$SNOWFLAKE_ROLE" \
        -w "$SNOWFLAKE_WH" \
        -d "$SNOWFLAKE_DB" \
        -s "$SNOWFLAKE_SCHEMA" \
        -f dev/create_tables.sql

snowsql -a "$SNOWFLAKE_ACCOUNT" \
        -u "$SNOWFLAKE_USER" \
        -p "$SNOWFLAKE_PASSWORD" \
        -r "$SNOWFLAKE_ROLE" \
        -w "$SNOWFLAKE_WH" \
        -d "$SNOWFLAKE_DB" \
        -s "$SNOWFLAKE_SCHEMA" \
        -f dev/stage_sales_data.sql

snowsql -a "$SNOWFLAKE_ACCOUNT" \
        -u "$SNOWFLAKE_USER" \
        -p "$SNOWFLAKE_PASSWORD" \
        -r "$SNOWFLAKE_ROLE" \
        -w "$SNOWFLAKE_WH" \
        -d "$SNOWFLAKE_DB" \
        -s "$SNOWFLAKE_SCHEMA" \
        -f dev/transform_sales_data.sql
