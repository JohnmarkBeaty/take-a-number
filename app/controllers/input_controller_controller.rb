class InputControllerController < ApplicationController
  def create
    # render plain: params.inspect
    @person = Queuedperson.new(queuedperson_params)
    @person.save
    twilio_sid = ENV['twilio_sid']
    twilio_token = ENV['twilio_token']
    twilio_phone_number = ENV['twilio_phone_number']

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
