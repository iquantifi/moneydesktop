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

      def transactions(token, account_guid)
        response = query({
          api: :data,
          endpoint: "/accounts/#{account_guid}/transactions.json",
          token: token,
          method: :GET
        })

        #response.pagination_data
        response.transactions
      end

    end
  end
end
