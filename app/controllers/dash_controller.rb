require_relative '../models/room'

class DashController < ApplicationController
  def statuses
    rooms = Room.all()
    if rooms
      result = { :success => true, :rooms => rooms }
    else
      result = { :success => false }
    end

    render json: result
  end

  def detail
    room = Room.find(params[:id])
    if room
      result = { :success => true, room: room }
    else
      result = { :success => false }
    end

    render json: result
  end

  def checkin
    id = params[:id]

    data = { status: 'O' }

    room = Room.find(id)
    if room
      room.update(data)
      result = { :success => true, room: room }
    else
      result = { :success => false }
    end

    render json: result
  end

  def checkout
    id = params[:id]

    data = { customername: '', status: 'F' }

    room = Room.find(id)
    if room
      room.update(data)
      result = { :success => true, room: room }
    else
      result = { :success => false }
    end

    render json: result
  end
end
