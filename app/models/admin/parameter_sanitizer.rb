class Admin::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name, :email, :password, :password_confirmation)
  end

  def account_update
  	default_params.permit(:name, :avatar, :password, :password_confirmation)
  end
end