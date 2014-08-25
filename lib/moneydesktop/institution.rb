module Moneydesktop
  module Institution

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def search_institutions(token, name)
        response = query({
          api: :data,
          endpoint: "/institutions/search.json",
          token: token,
          method: :POST,
          data: {
            name: name
          }
        })

        response.institutions ||= []

        #response.pagination_data
        response.institutions
      end

      def institution(token, institution_guid)
        response = query({
          api: :data,
          endpoint: "/institutions/#{institution_guid}.json",
          token: token,
          method: :GET
        })

        response.institution
      end

      #this gets a CSV file (cachable listing of all - 10's of thousands)
      def institutions(token)
        response = query({
          api: :data,
          endpoint: "/institutions.json",
          token: token,
          method: :GET,
          skip_parse: true,
        })

        response
      end

      def institution_credentials(token, institution_guid)
        response = query({
          api: :data,
          endpoint: "/institutions/#{institution_guid}/credentials.json",
          token: token,
          method: :GET
        })

        response.credentials
      end

    end
  end
end
