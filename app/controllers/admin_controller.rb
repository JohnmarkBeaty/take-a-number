class AdminController < ApplicationController
  def index
    @queuedpersons = Queuedperson.all
  end
end
