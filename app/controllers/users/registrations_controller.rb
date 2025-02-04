class Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
        
    def create
      @user = User.new(sign_up_params)

      if @user.save
        # Send the token as part of the response
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
        }, status: :created
      else
        # If validation fails, return errors
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end



  end
  
