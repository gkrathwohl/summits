Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, "3764", "e0b897e6bc461b774c73fbff6936f656d2e376f3"
end