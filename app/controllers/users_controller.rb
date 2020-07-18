class UsersController < ApplicationController
  
  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { email: user.email, token: generate_token({ id: user.id }) }
    else
      render json: { message: 'Invalid email or password' }
    end 
  end 

  def validate
    id = decode_token
    user = User.find_by(id: id)
    if user 
      render json: { email: user.email, token: generate_token({ id: user.id }) }
    else 
      render json: { message: 'Failure' }
    end 
  end 

  def create
  end

  #def user_params
    # params { user: {email: 'ewelinasz@gmail.com', password: '123' } }
   # params.require(:user).permit(:email, :password)
  #end
  
end

# token = JWT.encode({ id: 1 }, "123")
#  => "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.FV13-2Lov3ot6O7MVmypiHMQI0Azc09bjnYHqf1-5c0" 