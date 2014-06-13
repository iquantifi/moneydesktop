require 'moneydesktop/account'
require 'moneydesktop/institution'
require 'moneydesktop/job'
require 'moneydesktop/member'
require 'moneydesktop/user'
require "moneydesktop/version"


module Moneydesktop
  include Moneydesktop::Account
  include Moneydesktop::Institution
  include Moneydesktop::Job
  include Moneydesktop::Member
  include Moneydesktop::User

  #self.base_url = 'https://int-sso.moneydesktop.com/:client_id'


  def self.config(&block)
    if self.api_key.nil?
      yield(self)
    else
      logger.warn "Moneydesktop already configured" if defined? logger
    end
  end

  mattr_accessor :api_key, :username, :password, :base_url

  class << self

    protected

    def query args
      method   = args[:method].to_s.downcase
      response = HTTParty.send method, self.base_url+args[:endpoint], query: args[:params], headers: {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      data     = response.parsed_response

      if response.success?
        if [ TrueClass, FalseClass, Fixnum ].include?(data.class)
          data
        else
          convert_to_mash(data)
        end
      else
        #need error handling
        logger.error "Error calling Moneydesktop API: #{args}" if defined? logger
        nil
      end
    end

    private

    def convert_to_mash data
      if data.is_a? Hash
        Hashie::Mash.new(data)
      elsif data.is_a? Array
        data.map { |d| Hashie::Mash.new(d) }
      end
    end

  end
end
