class AdminController < ApplicationController
  def index
    @queuedpersons = Queuedperson.all
  end

  def destroy
    # render plain: params.inspect
    Queuedperson.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def sendtext
    # render plain: params.inspect
    @person = Queuedperson.find(params[:id])
    twilio_sid = ENV['TWILIO_SID']

    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    @twillo_clinet = Twilio::REST::Client.new twilio_sid, twilio_token

    @twillo_clinet.account.sms.messages.create(
        from: "+1#{twilio_phone_number}",
        to: @person.phonenumber,
        body: "Please come to the CRU15 Help Desk at your earlyest convence"
    )
    redirect_to :action => 'index'
  end
end
