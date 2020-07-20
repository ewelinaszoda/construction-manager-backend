class UsersController < ApplicationController

  def create
    user = User.create(name: params[:name], surname: params[:surname], email: params[:email], password: params[:password], phone_number: params[:phone_number])
    if user.valid?
      token = encode_token(user_id: user.id, email: user.email)
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end
  
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

private

def user_params
  params.require(:user).permit(:name, :surname, :email, :password, :phone_number)
end 

end
