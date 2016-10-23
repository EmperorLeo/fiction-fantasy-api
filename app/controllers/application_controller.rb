class ApplicationController < ActionController::API

  before_action :auth, except: [:login]

  def auth
    authorization = request.headers['Authorization']
    if authorization.nil?
      return render json: { error: 'Required format for authorization header - Bearer <token>' }, status: 401
    end
    split_auth = authorization.split(' ')
    if split_auth.length < 2 || split_auth[0] != 'Bearer'
      return render json: { error: 'Required format for authorization header - Bearer <token>' }, status: 401
    end
    @current_user = JsonWebToken.decode(split_auth[1])
    if @current_user[:error]
      return render json: @current_user, status: 401
    end
  end

  protected
  def current_user
    return @current_user
  end

  def handle_id_param(id)
    if !id
      return { valid: false, json: { error: "Missing id" } }
    elsif !id.is_number?
      return { valid: false, json: { error: "Id is not a number"} }
    else
      return { valid: true }
    end
  end

end
