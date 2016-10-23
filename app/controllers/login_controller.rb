class LoginController < ApplicationController
  def login
    email = params[:email]
    password = params[:password]
    if email.nil?
      return render json: { error: "Email required" }, status: 400
    end
    if password.nil?
      return render json: { error: "Password required" }, status: 400
    end
    user = User.find_by(email: email)
    if user.nil?
      return render json: { error: "User not found" }, status: 400
    end
    if !user.authenticate(password)
      return render json: { error: "Incorrect password" }, status: 401
    end
    token = JsonWebToken.create(user)
    render json: { token: token }
  end
end
