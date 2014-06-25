module Moneydesktop
  module Category

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def categories(token)
        response = query({
          api: :data,
          endpoint: "/categories.json",
          token: token,
          method: :GET
        })

        response.categories
      end

    end
  end
end
