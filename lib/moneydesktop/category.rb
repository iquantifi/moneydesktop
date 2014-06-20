module Moneydesktop
  module Category

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    def categories(token)
      response = query({
        api: :data,
        endpoint: "/categories",
        method: :GET,
        token: token,
        params: {
        }
      })

      response.categories
    end

    end
  end
end