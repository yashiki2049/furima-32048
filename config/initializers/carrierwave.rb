require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'].
    region: 'ap-northeast-1' #アジアパシフィック（東京）を表している
  }

  config.fog_directory  = 'furima202032048'
  config.asset_host = 'https://s3.amazonaws.com/furima202032048'
  config.asset_host = 'https://furima202032048.s3.amazonaws.com'
end