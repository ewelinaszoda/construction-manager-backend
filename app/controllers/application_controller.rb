class ApplicationController < ActionController::API

  def secret
    ENV["secret"]
  end

  def encode_token(payload)
     # should store secret in env variable
    JWT.encode(payload, secret)
  end 

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

end

# Add RVM to PATH for scripting.Make sure this is the last PATH variable change
# export PATH="$PATH:$HOME/.rvm/bin"
# export secret="123"

# export secret="123"
# rails s