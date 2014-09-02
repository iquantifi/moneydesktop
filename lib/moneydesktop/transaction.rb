module Moneydesktop
  module Transaction

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def transactions(token, page = 1, records_per_page = 100)
        response = query({
          api: :data,
          endpoint: "/transactions.json?page=#{page}&records_per_page=#{records_per_page}",
          token: token,
          method: :GET
        })

        response
      end

      def transaction(token, transaction_guid)
        response = query({
          api: :data,
          endpoint: "/transaction/#{transaction_guid}.json",
          token: token,
          method: :GET
        })

        response.transaction
      end

      def update_transaction(token, transaction_guid, category_guid, name)
        response = query({
          api: :data,
          endpoint: "/transactions/#{transaction_guid}.json",
          token: token,
          method: :PUT,
          data: {
            user_description: name,
            category_guid: category_guid
          }
        })

        response.transaction
      end

      def categorize_transactions(token, transactions)
        response = query({
          api: :data,
          endpoint: "/transactions/categorize_and_describe.json",
          token: token,
          method: :POST,
          data: transactions
        })

        response
      end

    end
  end
end
