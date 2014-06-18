module Moneydesktop
  module Account

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    def accounts(token)
      response = query({
        api: :data,
        endpoint: '/accounts',
        method: :GET,
        token: token,
        params: {
        }
      })

      response.accounts
    end

    def account(token, account_guid)
      response = query({
        api: :data,
        endpoint: "/accounts/#{account_guid}",
        method: :GET,
        token: token,
        params: {
        }
      })

      response.account
    end

    def update_account(token, account_guid, name)
      response = query({
        api: :data,
        endpoint: "/accounts/#{account_guid}",
        token: token,
        method: :PUT,
        params: {
          name: "#{name}"
        }
      })

      response.institution
    end

    def transactions(token, account_guid)
      response = query({
        api: :data,
        endpoint: "/accounts/#{account_guid}/transactions",
        token: token,
        method: :GET,
        params: {
          #from_date:
          #to_date:
          #page:
          #record_per_page:
        }
      })

      #response.pagination_data
      response.transactions
    end

    def update_category(token, transaction_guid, category_guid, name)
      response = query({
        api: :data,
        endpoint: "/transactions/#{transaction_guid}",
        token: token,
        method: :PUT,
        params: {
          user_description: "#{name}",
          category_guid: "#{category_guid}"
        }
      })
    end

    end
  end
end