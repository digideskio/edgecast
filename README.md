## Purge items from your EdgeCast CDN

Ruby wrapper to purge/flush objects from the EdgeCast CDN.

## Usage

* Create a new CDN object with the account number and api key.  
* Call the purge method with the asset patch

Example:

    require 'edgecast'
    cdn = Edgecast::CDN.new("account_number","api_key")
    cdn.purge("http://example.com/assets/some_file.js")

## Testing
    bundle
    rspec spec/edgetcast/cdn_spec.rb
