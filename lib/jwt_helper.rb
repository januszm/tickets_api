module JwtHelper

  def self.encode(payload, expiration = nil)
    payload = payload.dup
    JWT.encode payload, Rails.application.secrets.secret_key_base
  end

  def self.decode(token)
    begin
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base
      decoded_token.first
    rescue
      nil
    end
  end
end
