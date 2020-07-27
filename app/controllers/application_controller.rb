class ApplicationController < ActionController::API

  def secret
    ENV["secret"]
  end

  def encode_token(payload)
    JWT.encode(payload, secret)
  end 

  def auth_header
    request.headers['Authorization']
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, secret, true, algorithm: 'HS256')[0]
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    id = decode_token["id"]
    User.find_by(id: id)
  end

end

# Add RVM to PATH for scripting.Make sure this is the last PATH variable change
# export PATH="$PATH:$HOME/.rvm/bin"
# export secret="123"

# export secret="123"
# rails s