class InputControllerController < ApplicationController
  def create
  end

  def show
    @person = Queuedperson.new

  end
end
