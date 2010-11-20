class TextMessagesController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy]
  
  def sms
    doublePound = /##/
    singlePound = /#/
    
    @tn = params['From']
    @message = params['Body']
    
    #geographic information
    @city = params['FromCity']
    @state = params['FromState']

    parsedMessage = @message.split("#")
    
    patientName = parsedMessage[0] # first parameter is patient name
    
    patient = Patient.find_by_name(patientName)
    
    ailments = 
    
    if @message =~ doublePound # doctor requesting patient info
      if patient != nil && patient.ailment_messages != nil
        @response = "#{patientName}#"
        patient.ailment_messages.each do |ailment|
          @response += "#{ailment.message}; "
        end
      else
        @response = "#{patientName} has no records"
      end
    elsif @message =~ singlePound # doctor storing patient info
      
      unless patient
        patient = Patient.create(:name => patientName)
        patient.save
      end
      
      record = AilmentMessage.create(:message => parsedMessage[1], :location => "#{@city}, #{@state}", :patient => patient)
      record.save
      
      @response = "#{patientName}'s info has been stored."
    end
    

    
    
    
    
    respond_to do |format|
      format.xml
    end
  end
  
  def help
    
    
  end
end
