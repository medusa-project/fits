module Fits
  class ServiceError < RuntimeError
    attr_accessor :response

    def initialize(response)
      self.response = response
    end
  end
end
