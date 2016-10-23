class JsonWebToken

  @@secret = "readingabook"
  @@algorithm = "HS256"

  def self.create(user)
    return JWT.encode(user.as_json, @@secret, @@algorithm)
  end

  def self.decode(token)
    begin
      payload = JWT.decode token, @@secret, true, algorithm: @@algorithm
      return User.find_by_id(payload[0]['id'].to_i)
    rescue JWT::DecodeError
      return { error: "Please give a valid token." }
    end
  end

  # def self.user_id(token)
  #   payload = JWT.decode token, @@secret, true, algorithm: @@algorithm
  #   return payload[0]['user_id']
  # end

end
