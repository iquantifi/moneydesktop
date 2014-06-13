module Moneydesktop
  module Member

    def refresh(member_guid)
      response = query({
        endpoint: "/members/#{member_guid}/refresh",
        method: :GET,
        params: {
        }
      })
    end

    def refresh_all
      response = query({
        endpoint: "/members/refresh",
        method: :GET,
        params: {
        }
      })
    end

  end
end