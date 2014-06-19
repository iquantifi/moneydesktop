module Moneydesktop
  module Institution

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    def search_institutions(token, name)
      response = query({
        api: :data,
        endpoint: "/institutions/search",
        method: :POST,
        token: token,
        params: {
          name: "#{name}"
        }
      })

      #response.pagination_data
      response #.institutions

       #curl -D /dev/stdout -X POST -d '{"name":"Wells Fargo", "account_types":"1"}' https://int-data.moneydesktop.com/institutions/search -H 'MD-SESSION-TOKEN: {session_token}' -H 'content-type: application/json'

    end

    def institution(token, institution_guid)
      response = query({
        api: :data,
        endpoint: "/institutions/#{institution_guid}",
        token: token,
        method: :GET,
        params: {
        }
      })

      response.institution
    end

    #this gets a CSV file (cachable listing of all - 10's of thousands)
    def institutions(token)
      response = query({
        api: :data,
        endpoint: "/institutions",
        token: token,
        method: :GET,
        params: {
        }
      })

      response
    end

    def institution_credentials(token, institution_guid)
      response = query({
        api: :data,
        endpoint: "/institutions/#{institution_guid}/credentials",
        token: token,
        method: :GET,
        params: {
        }
      })

      response.credentials
    end

    #curl -D /dev/stdout https://int-data.moneydesktop.com/institutions -H 'MD-SESSION-TOKEN: WEq80Nu52rET_WlaiOAX3f21KXalx9T8iGwo9umU8nQ8PjFbxOEZLb3odUO8y4VImkup7E_5l3x0B0A4si6L9A' -H 'content-type: application/json'


    end
  end
end