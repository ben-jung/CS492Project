class MainController < ApplicationController
  def index
  end

  def get_all
    render json: WashingMachine.all
  end
end
