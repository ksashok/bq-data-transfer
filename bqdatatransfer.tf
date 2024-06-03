resource "google_bigquery_data_transfer_config" "customer_data_transfer" {

  display_name           = "customer-data-transfer-tf"
  location               = "us"
  data_source_id         = "google_cloud_storage"
  schedule               = "every 24 hours"
  destination_dataset_id = "bq_data_transfer_demo"
  params = {
    destination_table_name_template = "customers"
    data_path_template = "gs://customers-data-load/customers-*.csv"
    write_disposition = "APPEND"
    file_format = "CSV"
    skip_leading_rows = 1
  }
}

