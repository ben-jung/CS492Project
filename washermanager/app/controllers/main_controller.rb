require 'rake'

class MainController < ApplicationController
  def index
  end

  def get_all
    render json: WashingMachine.all
  end

  def get_data
    
    result = {:result=>true}
    begin
      id = params["id"]
      w = WashingMachine.find(id)
      if(w)
        if(params["state"] == "idle" && w.state == "run")
          %x[rake push:noties[#{id}]]
        end


        w.state = params["state"]
        w.save!
      end
    rescue => e
      result[:result] = false
      result[:msg]=e.message
      render json: result
      return
    end
    render json: result
    return
  end

  def recommend
    result = {:result=>true}
    mac = params[:mac_address]
    floor = MacFloor.where(:mac_address => mac)[0].floor rescue -1
    if floor == -1
      result[:result]=false
      render json: result
    end

    availables = WashingMachine.all
    wm = availables.sort{|x,y| (x.floor - floor).abs <=> (y.floor - floor).abs}
    result[:washingmachine] = wm 
    render json: wm
  end

  def tracking
    result = {:result=>true}
    machine_id = params[:machine_id]
    apns = params[:token]
    state = params[:state]
    begin
      if(state == "on")
        Tracking.create(:machine_id=>machine_id,:APNS_token => apns)
      else
        wm=Tracking.where(:machine_id=>machine_id,:APNS_token => apns)[0]
        if not wm.nil?
          wm.destroy!
        end
      end
    rescue => e
      result[:result] = false
      result[:msg]=e.message
    end
    render json: result
    return
  end

  def set_token
    result = {:result=>true}
    begin
    tk = params["token"]
    token  = Token.where(:value => tk)
    if token.empty? 
      Token.create(:value => tk)
    end
    rescue => e
      result[:result] = false
      result[:msg]=e.message
    end
    render json: result
    return
  end

  def make_mac_floor 
    MacFloor.create(:mac_address => params[:mac_address], :floor => params[:floor])
    render json: {}
  end
end
