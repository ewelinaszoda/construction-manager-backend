class UsersController < ApplicationController

  def index
    users = User.all
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: 500
      # puts user.errors.full_messages
      # render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end
  
  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { user: user, token: encode_token({ id: user.id }) }
    else
      # render json: { message: 'Invalid email or password' }, status: 400
      render json: { message: 'Invalid email or password' }
    end 
  end 

  def validate
  #   id = decode_token
    # id = decode_token[0]['id']
    # user = User.find_by(id: id)
    user = logged_in_user
    if user 
      render json: { user: user, token: encode_token({ id: user.id }) }
    else 
      render json: { message: 'Failure' }
    end 

  end 

  # def validate
  #   #   id = decode_token
  #     id = decode_token[0]['id']
  #     user = User.find_by(id: id)
  
  #     if current_user 
  #       render json: { name: current_user.name, token: encode_token( id: current_user.id )}
  #     else 
  #       render json: { message: 'Failure' }
  #     end 
  
  #   end 
  
  def home 
  end 

  def show
  end 

  def update
    user = logged_in_user
    user.update(user_params)
    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def delete 
    user = logged_in_user
    user.destroy

    render json: user
  end 

private

def user_params
  params.require(:user).permit(:name, :surname, :email, :password, :phone_number)
end 

end
