class UsersController < ApplicationController
  
  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { user: user, token: encode_token({ id: user.id }) }
    else
      render json: { message: 'Invalid email or password' }
    end 
  end 

  def validate
    id = decode_token
    user = User.find_by(id: id)

    if user 
      render json: { user: user, token: encode_token({ id: user.id }) }
    else 
      render json: { message: 'Failure' }
    end 

  end 

  def home 
  end 

  def sign_up
  end 

  def create
  end
  
end
