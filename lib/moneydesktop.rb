require 'httparty'
require 'hashie'

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


  #1 session token
  #2 search institution
  #3 request institution creds
  #4 create member with creds
  #5 refresh member
  #6 check job status
  #7 challenge: request mfa creds
  #8 challenge: create member creds
  #9 repeat #5
  #10 success: request accounts, transactions, categories


  def self.config(&block)
    if self.api_key.nil?
      yield(self)
    else
      logger.warn "Moneydesktop already configured" if defined? logger
    end
  end

  mattr_accessor :api_key, :sso_base_url, :mdx_base_url, :data_base_url, :client_id

  class << self

    protected

    def url(api)
      @@apis ||= {
        sso:  self.sso_base_url,
        mdx:  self.mdx_base_url,
        data: self.data_base_url
      }
      @@apis[api]
    end

    def query args
      method   = args[:method].to_s.downcase
      base_url = url args[:api]
      headers  = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      headers['MD-API-KEY'] = self.api_key if args[:api] != :data
      headers['MD-API-TOKEN'] = args[:api_token] if args[:api_token]
      headers['MD-SESSION-TOKEN'] = args[:token] if args[:token]
      headers['Accept'] = 'application/vnd.moneydesktop.sso.v3' if args[:api] == :sso
      headers['Accept'] = 'application/vnd.moneydesktop.mdx.v5+json' if args[:api] == :mdx
      headers['Accept'] = 'application/vnd.moneydesktop.v1+json' if args[:api] == :data

      p headers

      response = HTTParty.send method, base_url+args[:endpoint], body: args[:params], headers: headers
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
