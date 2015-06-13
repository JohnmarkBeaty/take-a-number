class InputControllerController < ApplicationController
  def create
    # render plain: params.inspect
    @person = Queuedperson.new(queuedperson_params)
    @person.save
    twilio_sid = ENV['TWILIO_SID']

    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    @twillo_clinet = Twilio::REST::Client.new twilio_sid, twilio_token

    @twillo_clinet.account.sms.messages.create(
    from: "+1#{twilio_phone_number}",
    to: @person.phonenumber,
    body: "Congradulations your amazing!"
    )
  end

  def show
    @person = Queuedperson.new
  end

  def queuedperson_params
    params.require(:person).permit(:firstname, :lastname, :phonenumber)
  end
end
