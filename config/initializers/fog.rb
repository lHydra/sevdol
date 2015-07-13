CarrierWave.configure do |config|

  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS', # required
      aws_access_key_id:     '', # required
      aws_secret_access_key: '', # required
    }
    config.fog_directory  = 'sevdol'                                         # required
    config.fog_public     = false                                            # optional, defaults to true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
