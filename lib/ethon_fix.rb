require 'typhoeus'

module Ethon
  module Easy
    module Options
      def unrestricted_auth=(value)
        Curl.set_option(:unrestricted_auth, value_for(value, :bool), handle)
      end
    end
  end
end
