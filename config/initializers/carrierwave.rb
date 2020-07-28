# frozen_string_literal: true

unless Rails.env.development? || Rails.env.test?

  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws' # required
    config.fog_credentials = {
      provider: 'AWS', # required
      aws_access_key_id: ENV['AWS_S3_ACCESS_KEY_ID'], # required
      aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'], # required
      region: 'ap-northeast-1' # optional, defaults to 'us-east-1' オハイオ＝us-east-2
      # host:                  'https://s3-ap-northeast-1.amazonaws.com/shelf-images',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = 'shelf-images' # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  end
end
