class Users::SessionsController < DeviseTokenAuth::SessionsController
    def create
      @user = User.find_by(email: params[:user][:email])
  
      
      # binding.pry
      
      if @user && @user.valid_password?(params[:user][:password])
       
        token = @user.create_new_auth_token
        render json: {
          status: 'success',
          data: @user.as_json.merge({
            'access-token' => token['access-token'],
            'bearer' => token["Authorization"],
            'client' => token['client'],
            'expiry' => token['expiry'],
            'uid' => @user.email
          })
        }
      else
        render json: { errors: ['Invalid email or password'] }, status: :unauthorized
      end
    end
end
  