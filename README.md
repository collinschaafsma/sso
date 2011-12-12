# SSO
Experimental sinatra app for Single Sign On.  Authentication will be
implemented by omniauth strategies.  SSO will not provide a view layer,
you'll be responsible for that.  SSO is simply an API. This is a WIP.

## Deploying to Heroku
You'll need to add some variables to your heroku config to enable the
app to connect to your mongodb instance.  See `config/mongoid.yml` for
required variables.  You can add them like so.
`heroku config:add KEY=value`

## Booting the app in irb
`bundle exec irb -r ./config/boot.rb`

## Running specs
`bundle exec rake spec`
