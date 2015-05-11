class InputControllerController < ApplicationController
  def create
    @person = Queuedperson.new(queuedperson_params)
    @person.save
  end

  def show
    @person = Queuedperson.new
  end

  def queuedperson_params
    params.require(:queuedperson).permit(:firstname, :lastname, :phonenumber)
  end
end
