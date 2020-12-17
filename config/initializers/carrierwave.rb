CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
 
    case Rails.env
    when 'development'
        config.fog_directory  = 'furima202032048'
        config.asset_host = 'https://s3.amazonaws.com/furima202032048'
    when 'production'
        config.fog_directory  = 'furima202032048'
        config.asset_host = 'https://s3.amazonaws.com/furima202032048'
    end
end