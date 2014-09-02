module Moneydesktop
  module Account

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def accounts(token)
        response = query({
          api: :data,
          endpoint: '/accounts.json',
          token: token,
          method: :GET
        })

        response.accounts
      end

      def account(token, account_guid)
        response = query({
          api: :data,
          endpoint: "/accounts/#{account_guid}.json",
          token: token,
          method: :GET
        })

        response.account
      end

      def update_account(token, account_guid, name)
        response = query({
          api: :data,
          endpoint: "/accounts/#{account_guid}.json",
          token: token,
          method: :PUT,
          data: {
            name: name
          }
        })

        response.institution
      end

      def account_transactions(token, account_guid, page = 1, records_per_page = 100)
        response = query({
          api: :data,
          endpoint: "/accounts/#{account_guid}/transactions.json?page=#{page}&records_per_page=#{records_per_page}",
          token: token,
          method: :GET
        })

        response
      end

    end
  end
end
