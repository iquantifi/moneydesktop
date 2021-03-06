module Moneydesktop
  module Member

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def members(token)
        response = query({
          api: :data,
          endpoint: "/members.json",
          token: token,
          method: :GET
        })

        response.members
      end

      def member(token, member_guid)
        response = query({
          api: :data,
          endpoint: "/members/#{member_guid}.json",
          token: token,
          method: :GET
        })

        response.member
      end

      #https://developerbeta.moneydesktop.com/alfred/v1-0/members.html#create-member
      def create_member(token, institution_guid, credentials)
        response = query({
          api: :data,
          endpoint: "/members.json",
          token: token,
          method: :POST,
          data: {
            institution_guid: "#{institution_guid}",
            credentials: credentials
          }
        })

        response.member
      end

      def delete_member(token, member_guid)
        response = query({
          api: :data,
          endpoint: "/members/#{member_guid}.json",
          token: token,
          method: :DELETE
        })

        response
      end

      def refresh(token, member_guid)
        response = query({
          api: :data,
          endpoint: "/members/#{member_guid}/refresh.json",
          token: token,
          method: :GET
        })

        #most_recent_job_guid
        response.member
      end

      def refresh_all(token)
        response = query({
          api: :data,
          endpoint: "/members/refresh.json",
          token: token,
          method: :GET
        })

        #most_recent_job_guid
        response.members
      end

      def create_member_credential(token, member_guid, credential_guid, value)
        response = query({
          api: :data,
          endpoint: "/members/#{member_guid}/credentials.json",
          token: token,
          method: :POST,
          data: {
            credential_guid: credential_guid,
            value: value
          }
          })
      end

    end
  end
end
