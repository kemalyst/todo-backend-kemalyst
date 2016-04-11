Kemalyst::Handler::Session.config do |config|

  # The secret is used to avoid the session data being changed.  The session
  # data is stored in a cookie.  To avoid changes being made, a security token
  # is generated using this secret.  To generate a secret, you can use the
  # following command:
  # crystal eval "require \"secure_random\"; puts SecureRandom.hex(64)"
  #
  config.secret = "f6b70c7d8e924133097516c5f597031136467d2ea93c7f375e3eccace714b4bef9b6b510ce565b5efd81cd168815a1133f470ca346becfe601469eaed3e6561c"
  
end
