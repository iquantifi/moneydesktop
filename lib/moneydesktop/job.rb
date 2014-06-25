module Moneydesktop
  module Job

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def job(token, job_guid)
        response = query({
          api: :data,
          endpoint: "/jobs/#{job_guid}.json",
          method: :GET,
          token: token
        })

        response.job
      end

      def resume(token, job_guid)
        response = query({
          api: :data,
          endpoint: "/jobs/#{job_guid}/resume.json",
          token: token,
          method: :PUT
        })

        response.job
      end

      def job_credentials(token, job_guid)
        response = query({
          api: :data,
          endpoint: "/jobs/#{job_guid}/mfa_credentials.json",
          token: token,
          method: :GET
        })

        response.credentials
      end

    end
  end
end
