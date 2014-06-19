require 'base64'

module Moneydesktop
  module User

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    #https://developerbeta.moneydesktop.com/alfred/v1-0/api-data-flow.html#step-request-the-mfa-credentials

    #2
    def api_token(id)
      response = query({
        api: :sso,
        endpoint: "/#{self.client_id}/users/#{id}/api_token.json",
        method: :GET,
        params: {
        }
      })

      #sso
      #https://int-sso.moneydesktop.com/iQuantifi-Test/users/2/api_token.json (2 = ID)
      #Accept application/vnd.moneydesktop.sso.v3

      response.api_token.token
    end

    #3
    def session_token(api_token)
<<<<<<< HEAD
      #don't use this (docs are wrong)
      #api_token = Base64.encode64("#{id}|#{sso_token}|#{self.api_key}")
=======
      # api_token = Base64.encode64("#{id}|#{sso_token}|#{self.api_key}")
>>>>>>> 1162349c772e4ee25d8f1f5eab181e2dc0485dcf

      response = query({
        api: :data,
        endpoint: "/sessions",
        api_token: api_token,
        method: :POST,
        params: {
        }
      })

      #data
      #post https://int-data.moneydesktop.com/sessions
      #header: MD-API-TOKEN from step 2
      #curl -D /dev/stdout -X POST -d '{}' -H 'content-type: application/json' -H 'MD-API-TOKEN: VVNSLTU5N2Q0MmM3LWUxY2UtMDlhZC0zZWU5LTczYTg2NzQzYmI1Mnx4c3FOQlpGRDRyRmNfUGpfcHBMdTAwVFFSV0FxS2dkV3FtYlk1Nk5iNV9aZExDcW5wT1hDRkd0dHh2NVdTR0ZXVVl6LTQzV2k2MUp0VFZzQkgzMEVhQWU0ZDhhMjMwOTBkMjM1ZDY0ODA4MDcyOGUyMDhkYTA4fFlxM1RjcXM4T3oxTmZwdlNZTXRQdXJFNXlqVFJHTVpvdzRzdWZKU1pMblU=' https://int-data.moneydesktop.com/sessions

      response.session.token
    end

    def del_tokens(id)
      response = query({
        api: :sso,
        endpoint: "/#{self.client_id}/users/#{id}/sessions",
        method: :DELETE,
        params: {
        }
      })
      #DELETE /:client_id/users/:id/sessions

      response
    end

  #log in a user:
  #sso token (one time use), to get a session token

   #curl -D /dev/stdout https://int-data.moneydesktop.com/user -H 'MD-SESSION-TOKEN: {session_token}' -H 'content-type: application/json' -H "Accept: application/vnd.moneydesktop.v1+json"


   #1
   def create_user(id, email)
    response = query({
        api: :mdx,
        endpoint: "/#{self.client_id}/users.json",
        method: :POST,
        params: {
          user: {
            id: id,
            email: email
          }
        }
      })

    response

    #API token in header for every call
    #POST mdk  https://int-live.moneydesktop.com/iQuantifi-Test/users.json
    # { "user": {
    #   "id": "3",
    #   "email": "test3@iquantifi.com"
    #   }
    # }

   end

    end
  end
end
