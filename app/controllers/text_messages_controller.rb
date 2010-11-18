class TextMessagesController < ApplicationController
  def sms
    @message = params['Body']
    
    respond_to do |format|
      format.xml
    end
  end
end
