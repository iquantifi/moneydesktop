module Moneydesktop
  module User

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    #https://developerbeta.moneydesktop.com/alfred/v1-0/api-data-flow.html#step-request-the-mfa-credentials




    #Accept: application/vnd.moneydesktop.sso.v3
    #MD-API-Key: YOUR_ENVIRONMENT_SPECIFIC_API_KEY


    #3
    def session_token(api_token)
      response = query({
        api: :data,
        endpoint: "/sessions",
        api_token: api_token,
        method: :DELETE,
        params: {
        }
      })

      #data
      #post https://int-data.moneydesktop.com/sessions
      #header: MD-API-TOKEN from step 2

    end


    #2
    def api_token(id)
      response = query({
        api: :sso,
        endpoint: "#{self.client_id}/users/#{id}/api_token.json",
        method: :GET,
        params: {
        }
      })
      #response.session.token

      #sso
      #https://int-sso.moneydesktop.com/iQuantifi-Test/users/2/api_token.json (2 = ID)
      #Accept application/vnd.moneydesktop.sso.v3

      response.session.token
    end

    def del_tokens(id)
      response = query({
        api: :sso,
        endpoint: "#{self.client_id}/users/#{id}/sessions",
        method: :DELETE,
        params: {
        }
      })
      #DELETE /:client_id/users/:id/sessions
    end

  #log in a user:
  #sso token (one time use), to get a session token

   #curl -D /dev/stdout https://int-data.moneydesktop.com/user -H 'MD-SESSION-TOKEN: {session_token}' -H 'content-type: application/json' -H "Accept: application/vnd.moneydesktop.v1+json"


   #1
   def create_user(id, email)
    response = query({
        api: :mdx,
        endpoint: "#{self.client_id}/users.json",
        method: :POST,
        params: {
          user: {
            id: id,
            email: email
          }
        }
      })

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