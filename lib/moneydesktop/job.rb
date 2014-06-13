module Moneydesktop
  module Member

    def job(job_guid)
      response = query({
        endpoint: "/jobs/#{job_guid}",
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

    def resume(job_guid)
      response = query({
        endpoint: "/jobs/#{job_guid}/resume",
        method: :PUT,
        params: {
        }
      })

      response.job
    end

    def job_credentials(job_guid)
      response = query({
        endpoint: "/jobs/#{job_guid}/mfa_credentials",
        method: :GET,
        params: {
        }
      })

      response.credentials
    end

  end
end