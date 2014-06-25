require 'base64'

module Moneydesktop
  module User

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      #https://developerbeta.moneydesktop.com/alfred/v1-0/api-data-flow.html#step-request-the-mfa-credentials

      #1
      def create_user(id, email)
        response = query({
          api: :mdx,
          endpoint: "/#{self.client_id}/users.json",
          method: :POST,
          data: {
            user: {
              id: id,
              email: email
            }
          }
        })

        response
      end

      #2
      def api_token(id)
        response = query({
          api: :sso,
          endpoint: "/#{self.client_id}/users/#{id}/api_token.json",
          method: :GET
        })

        response.api_token.token
      end

      #3
      def session_token(api_token)
        #don't use this (docs are wrong)
        #api_token = Base64.encode64("#{id}|#{sso_token}|#{self.api_key}")

        response = query({
          api: :data,
          endpoint: "/sessions.json",
          api_token: api_token,
          method: :POST
        })

        response.session.token
      end

      def delete_session(id)
        response = query({
          api: :sso,
          endpoint: "/#{self.client_id}/users/#{id}/sessions.json",
          method: :DELETE
        })

        response
      end

      def delete_user(id)
        response = query({
            api: :mdx,
            endpoint: "/#{self.client_id}/users/#{id}.json",
            method: :DELETE
          })

        response
      end

    end
  end
end
