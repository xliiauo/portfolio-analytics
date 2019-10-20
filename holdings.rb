require "airrecord"

Airrecord.api_key = AIRTABLE_API_KEY

class Holdings < Airrecord::Table
    self.base_key = AIRTABLE_BASE_KEY
    self.table_name = AIRTABLE_TABLE_NAME
end