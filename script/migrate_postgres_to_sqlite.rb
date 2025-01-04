require 'active_record'
require 'irb'

# connect postgres
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'postgres',
  password: 'password',
  database: 'aleben'
)
pg_conn = ActiveRecord::Base.connection
# connect sqlite
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'storage/development.sqlite3'
)
lite_conn = ActiveRecord::Base.connection

# NOTE: run manually and then put them in tables array in correct order to satisfy foreign key constraints
# table_select = "select table_name from information_schema.tables where table_schema='public' AND table_type='BASE TABLE'"
# puts pg_conn.select_all(table_select).rows.flatten.to_json
# exit
tables = %w[
  active_storage_blobs
  active_storage_variant_records
  campyears
  camps
  downloads
  events
  helpers
  messages
  pages
  parents
  children
  registrations
  teams
  users
  active_storage_attachments
]

tables.each do |table_name|
  data = pg_conn.select_all("SELECT * FROM #{table_name}")

  # Insert data into SQLite
  data.rows.each do |row|
    attributes = data.columns.zip(row).to_h
    begin
      lite_conn.insert_fixture(attributes, table_name)
    rescue Error => e
      puts "Error inserting into #{table_name}: #{e.message}"
    end
  end
end
