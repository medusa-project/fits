require 'singleton'
require 'typhoeus'
require 'uri'
require 'fits/service_error'

module Fits

  class Service < Object
    include Singleton

    attr_accessor :service_url, :configured

    def initialize(args = {})
      self.configured = false
    end

    def configure(config_hash)
      self.service_url = config_hash['service_url']
      self.configured = true
    end

    def get_fits_for(url, user = nil, password = nil)
      make_request('/getfits', {:url => url}, user, password)
    end

    def get_premis_for(url, user = nil, password = nil)
      make_request('/getpremis', {:url => url}, user, password)
    end

    def get_premis_with_local_id_for(url, local_id, user = nil, password = nil)
      make_request("/getpremis/#{local_id}", {:url => url}, user, password)
    end

    protected

    def make_request(path, request_params, user = nil, password = nil)
      raise RuntimeError, "Fits::Service not configured. Please call Fits::Service.instance.configure(config_hash)." unless self.configured
      uri = URI.parse(self.service_url)
      uri.path = uri.path + path
      request_opts = {:httpauth => :basic, :ssl_verifyhost => 0, :params => request_params, :follow_location => 1}
      request_opts.merge!(:userpwd => "#{user}:#{password}") if user and password
      response = Typhoeus::Request.get(uri.to_s, request_opts)
      if response.code != 200
        raise ServiceError.new(response), response.inspect
      else
        return response.body
      end
    end

  end
end
