class ApplicationController < ActionController::API

  def generate_token(data)
    JWT.encode(data, ENV["secret"])
  end 

  def decode_token
    token = request.headers["Authorization"]
    data = JWT.decode(token, ENV["secret"]).first["id"]
  end 

end

# Add RVM to PATH for scripting.Make sure this is the last PATH variable change
# export PATH="$PATH:$HOME/.rvm/bin"
# export secret="123"

# export secret="123"
# rails s