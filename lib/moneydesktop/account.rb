module Moneydesktop
  module Account


    def accounts
      response = query({
        endpoint: '/accounts',
        method: :GET,
        params: {
        }
      })

      response.accounts
    end

    def account(account_guid)
      response = query({
        endpoint: "/accounts/#{account_guid}",
        method: :GET,
        params: {
        }
      })

      response.account
    end

    def update_account(account_guid, name)
      response = query({
        endpoint: "/accounts/#{account_guid}",
        method: :PUT,
        params: {
          name: "#{name}"
        }
      })

      response.institution
    end

    def transactions(account_guid)
      response = query({
        endpoint: "/accounts/#{account_guid}/transactions",
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

    def update_category(transaction_guid, category_guid, name)
      response = query({
        endpoint: "/transactions/#{transaction_guid}",
        method: :PUT,
        params: {
          user_description: "#{name}",
          category_guid: "#{category_guid}"
        }
      })
    end

  end
end