class UsersController < ApplicationController

  skip_before_action :auth, only: [:create]

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    password_confirm = params[:password_confirm]
    phone_number = params[:phone_number]
    if password != password_confirm
      render json: { created: false, error: "Passwords do not match" }, status: 400
    elsif password.length < 6
      render json: { created: false, error: "Password is too short."}, status: 400
    else
      success = User.create first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirm, phone_number: phone_number
      if success
        render json: { created: true }
      else
        render json: { created: false, error: "User create failed." }, status: 400
      end
    end
  end

  def show
    id = params[:id]
    valid_id = handle_id_param id
    if !valid_id[:valid]
      render json: valid_id[:json], status: 400
    else
      user = User.find_by_id id
      if !user
        render json: { error: "User not found" }
      else
        render json: user
      end
    end
  end

  def update
    render json: { showed: "hello" }
  end

  def destroy
    User.destroy params[:id]
  end
end
