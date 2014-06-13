module Moneydesktop
  module User

    #https://developerbeta.moneydesktop.com/alfred/v1-0/api-data-flow.html#step-request-the-mfa-credentials

    #1 session token
    #2 search institution
    #3 request institution creds
    #4 create member with creds
    #5 refresh member
    #6 check job status
    #7 challenge: request mfa creds
    #8 challenge: create member creds
    #9 repeat #5
    #10 success: request accounts, transactions, categories


    #Accept: application/vnd.moneydesktop.sso.v3
    #MD-API-Key: YOUR_ENVIRONMENT_SPECIFIC_API_KEY

    def token
  #curl -D /dev/stdout -X POST -d '{}' -H 'content-type: application/json' -H 'MD-API-TOKEN: {API_TOKEN}' https://int-data.moneydesktop.com/sessions

      #response.session.token
    end

    def del_token
      #DELETE /:client_id/users/:id/sessions
    end

  #log in a user:
  #sso token (one time use), to get a session token

   #curl -D /dev/stdout https://int-data.moneydesktop.com/user -H 'MD-SESSION-TOKEN: {session_token}' -H 'content-type: application/json' -H "Accept: application/vnd.moneydesktop.v1+json"


  end
end