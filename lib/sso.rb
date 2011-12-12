module Ql

  class Sso < Sinatra::Base

    use Rack::Session::Cookie
    use OmniAuth::Builder do
      provider :identity, on_failed_registration: lambda { |env|
        identity = env['omniauth.identity']
        [
          200,
          {"Content-Type" => 'application/json'},
          [{:errors => identity.errors}.to_json]
        ]
      }
    end

    before do
      p params
      content_type :json
    end

    get '/' do
      { :application_name => 'SSO' }.to_json
    end

    post '/auth/:provider/callback' do
      auth = request.env["omniauth.auth"]
      user = User.from_omniauth(auth)
      session[:user_id] = user.id

      {:user => {:name => user.name}}.to_json
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
