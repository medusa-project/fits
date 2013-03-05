# Fits

Get FITS in its original form or translated to PREMIS from Tom Habing's 
web service.

## Installation

Add this line to your application's Gemfile:

    gem 'fits'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fits

 Usage

Initialize via:

    Fits::Service.instance.configure(config_hash)
	
config_hash currently only expects the (string) key 'service_url', which
should point to the base url for the service.

Then three methods are exposed on Fits::Service.instance:

get_fits_for(url, user, password)
get_premis_for(url, user, password)
get_premis_with_local_id_for(url, local_id, user, password)

url is the url of the stream for which we want to generate fits.
local_id is a local identifier that we wish to embed into the PREMIS.

In each case the user and password are optional - if provided they will be
passed through when the service requests url.

If the request succeeds then the methods return the xml from the web service.
If it fails then the methods raise a Fits::ServiceError with the response
(from Typhoeus) as an instance variable.



