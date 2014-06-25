module Moneydesktop
  # Raised when Moneydesktop returns a 4xx HTTP status code
  class ClientError < HTTParty::ResponseError; end

  # Raised when Moneydesktop returns the HTTP status code 404
  class NotFound < ClientError; end

  # Raised when Moneydesktop returns a 5xx HTTP status code
  class ServerError < HTTParty::ResponseError; end

  # Raised when Moneydesktop returns the HTTP status code 500
  class InternalServerError < ServerError; end
end
