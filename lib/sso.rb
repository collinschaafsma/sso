module Ql
  class Sso < Sinatra::Base

    before do
      content_type :json
    end

    get '/' do
      { :application_name => 'SSO' }.to_json
    end

    #configure do
      # set app specific settings
      # for example different view folders
    #end

    # I did this to be able to wrap my app in Rack::Auth::Digest for example
    ## Example:
    ## def self.new(*)
    ##  app = Rack::Auth::Digest::MD5.new(super) do |username|
    ##    {'foo' => 'bar'}[username]
    ##  end
    ##  app.realm = 'Foobar::Foo'
    ##  app.opaque = 'secretstuff'
    ##  app
    ## end

    def self.new(*)
      super
    end

  end
end
