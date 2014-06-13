module Moneydesktop
  module Member

    def members
      response = query({
        endpoint: "/members",
        method: :GET,
        params: {
        }
      })

      response.members
    end

    def member(member_guid)
      response = query({
        endpoint: "/members/#{member_guid}",
        method: :GET,
        params: {
        }
      })

      response.member
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

    def delete_member(member_guid)
      response = query({
        endpoint: "/members/#{member_guid}",
        method: :DELETE,
        params: {
        }
      })
    end

    def refresh(member_guid)
      response = query({
        endpoint: "/members/#{member_guid}/refresh",
        method: :GET,
        params: {
        }
      })

      #most_recent_job_guid
      response.member
    end

    def refresh_all
      response = query({
        endpoint: "/members/refresh",
        method: :GET,
        params: {
        }
      })

      #most_recent_job_guid
      response.members
    end

  end
end