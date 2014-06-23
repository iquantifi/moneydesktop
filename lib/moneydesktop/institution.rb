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
      response.institutions
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

    end
  end
end
