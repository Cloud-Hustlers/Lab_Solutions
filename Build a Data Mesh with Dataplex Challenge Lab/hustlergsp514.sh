curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh




cat > dq-customer-orders.yaml <<EOF_END
metadata_registry_defaults:
  dataplex:
    projects: $DEVSHELL_PROJECT_ID
    locations: $REGION
    lakes: sales-lake
    zones: curated-customer-zone
row_filters:
  NONE:
    filter_sql_expr: |-
      True
rule_dimensions:
  - completeness
rules:
  NOT_NULL:
    rule_type: NOT_NULL
    dimension: completeness
rule_bindings:
  VALID_CUSTOMER:
    entity_uri: bigquery://projects/$DEVSHELL_PROJECT_ID/datasets/customer_orders/tables/ordered_items
    column_id: user_id
    row_filter_id: NONE
    rule_ids:
      - NOT_NULL
  VALID_ORDER:
    entity_uri: bigquery://projects/$DEVSHELL_PROJECT_ID/datasets/customer_orders/tables/ordered_items
    column_id: order_id
    row_filter_id: NONE
    rule_ids:
      - NOT_NULL

EOF_END


gsutil cp dq-customer-orders.yaml gs://$DEVSHELL_PROJECT_ID-dq-config

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
