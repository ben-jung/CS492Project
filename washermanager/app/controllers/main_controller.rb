class MainController < ApplicationController
  def index
  end

  def get_all
    render json: WashingMachine.all
  end

  def get_data
    
    result = {:result=>true}
    begin
    w = WashingMachine.find{id ==  params[:id]}
    if(w)
      case (w.state)
      when "idle"
      when "run"
      when "dry"
      end
    end
    rescue => e
      result[:result] = false
      result[:msg]=e.message
      render json: result
    end
  end
end
