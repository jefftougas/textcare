require 'spec_helper'

describe TextMessagesController do
  render_views
  
  describe "GET 'sms'" do
    it "should be successful" do
      get 'sms'
      response.should be_success
    end
  end
end
