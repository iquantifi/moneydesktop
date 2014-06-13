module Moneydesktop
  module Institution

    def search_institutions(name)
      response = query({
        endpoint: "/institutions/search",
        method: :POST,
        params: {
          name: "#{name}"
        }
      })

      #response.pagination_data
      response.institutions
    end

    def institution(institution_guid)
      response = query({
        endpoint: "/institutions/#{institution_guid}",
        method: :GET,
        params: {
        }
      })

      response.institution
    end

    def institution_credentials(institution_guid)
      response = query({
        endpoint: "/institutions/#{institution_guid}/credentials",
        method: :GET,
        params: {
        }
      })

      response.credentials
    end

    #https://developerbeta.moneydesktop.com/alfred/v1-0/members.html#create-member
    def create_member(institution_guid, credentials)
      response = query({
        endpoint: "/members",
        method: :POST,
        params: {
          institution_guid: "#{institution_guid}",
          credentials: credentials
        }
      })

      response.member
    end

  end
end