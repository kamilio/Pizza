# initializers/s3.rb
if Rails.env == "production"
  S3_CREDENTIALS = { 
    :access_key_id => ENV['S3_KEY'], 
    :secret_access_key => ENV['S3_SECRET'], 
    :bucket => "pizza-bestellung"
   }
else
  S3_CREDENTIALS = YAML.load_file Rails.root.join("config/s3.yml")
end