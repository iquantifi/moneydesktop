module Moneydesktop
  module Member

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    def members(token)
      response = query({
        api: :data,
        endpoint: "/members",
        token: token,
        method: :GET,
        params: {
        }
      })

      response.members
    end

    def member(token, member_guid)
      response = query({
        api: :data,
        endpoint: "/members/#{member_guid}",
        token: token,
        method: :GET,
        params: {
        }
      })

      response.member
    end

    #https://developerbeta.moneydesktop.com/alfred/v1-0/members.html#create-member
    def create_member(token, institution_guid, credentials)
      response = query({
        api: :data,
        endpoint: "/members",
        token: token,
        method: :POST,
        params: {
          institution_guid: "#{institution_guid}",
          credentials: credentials
        }
      })

      response.member
    end

    def delete_member(token, member_guid)
      response = query({
        api: :data,
        endpoint: "/members/#{member_guid}",
        token: token,
        method: :DELETE,
        params: {
        }
      })
    end

    def refresh(token, member_guid)
      response = query({
        api: :data,
        endpoint: "/members/#{member_guid}/refresh",
        token: token,
        method: :GET,
        params: {
        }
      })

      #most_recent_job_guid
      response.member
    end

    def refresh_all(token)
      response = query({
        api: :data,
        endpoint: "/members/refresh",
        token: token,
        method: :GET,
        params: {
        }
      })

      #most_recent_job_guid
      response.members
    end

    end
  end
end