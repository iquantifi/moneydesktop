module Moneydesktop
  module Budget

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def budgets(token)
        response = query({
          api: :data,
          endpoint: "/budgets.json",
          token: token,
          method: :GET
        })

        response.budgets
      end

      def budget(token, budget_guid)
        response = query({
          api: :data,
          endpoint: "/budget/#{budget_guid}.json",
          token: token,
          method: :GET
        })

        response.budget
      end

      def update_budget(token, budget_guid)
        response = query({
          api: :data,
          endpoint: "/budget/#{budget_guid}.json",
          token: token,
          method: :PUT
        })

        response.budget
      end

    end
  end
end
