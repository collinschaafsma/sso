require 'spec_helper'

describe Ql::Sso do

  def app
    @app ||= Ql::Sso
  end

  describe "GET '/'" do
    it "should be successful" do
      get '/'
      last_response.should be_ok
    end
  end

end
