OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'mPWKrfbFenGIJfIIrIoJw', 'mfST3lQzlxnHVDwZNicKZmuE9zYOK2vpDXpCht1y48'
end
