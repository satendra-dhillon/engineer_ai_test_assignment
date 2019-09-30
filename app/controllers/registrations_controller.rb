class RegistrationsController < Devise::RegistrationsController
	
	def create
		build_resource(sign_up_params)
		resource.secret_code = SecretCode.find(params["user"]["secret_code"].to_i)
		resource.save!
		respond_with resource, :location => after_sign_up_path_for(resource)
	end

	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, secret_code: :secret_code)
	end

	def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
