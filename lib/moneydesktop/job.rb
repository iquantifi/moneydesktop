module Moneydesktop
  module Job

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    def job(token, job_guid)
      response = query({
        api: :data,
        endpoint: "/jobs/#{job_guid}",
        token: token,
        method: :GET,
        params: {

        }
      })


      #status_name
      #updated_at
      #status
      #error_message
      #error_message_code
      response.job
    end

    def resume(token, job_guid)
      response = query({
        api: :data,
        endpoint: "/jobs/#{job_guid}/resume",
        token: token,
        method: :PUT,
        params: {
        }
      })

      response.job
    end

    def job_credentials(token, job_guid)
      response = query({
        api: :data,
        endpoint: "/jobs/#{job_guid}/mfa_credentials",
        token: token,
        method: :GET,
        params: {
        }
      })

      response.credentials
    end

    end
  end
end