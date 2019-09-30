class SecretCodesController < ApplicationController

	def index
		@secret_codes = SecretCode.all
	end

	def genrate_codes
    for i in 1..params["no_of_codes"].to_i do
    	SecretCode.create(code: (0..6).map { ('a'..'z').to_a[rand(26)] }.join)
    end

    redirect_to secret_codes_path
	end

end
