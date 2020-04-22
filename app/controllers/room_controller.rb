require_relative '../models/room'

class RoomController < ApplicationController
	def create
		room_category_id = params[:room_category_id]
		name = params[:name]
		dim = params[:dim]
		desc = params[:desc]
		cap = params[:cap]
		image = params[:image]

		data = { room_category_id: room_category_id, name: name, dim: dim, desc: desc, cap: cap, image: image }

		room = Room.create(data)
		if room
			result = { :success => true, data: room }
		else
			result = { :success => false }
		end

		render json: result
	end

	def update
		id = params[:id]
		room_category_id = params[:room_category_id]
		name = params[:name]
		dim = params[:dim]
		desc = params[:desc]
		cap = params[:cap]
		image = params[:image]

		data = { room_category_id: room_category_id, name: name, dim: dim, desc: desc, cap: cap }

		room = Room.find(id)
		if room
			if image
				data[:image] = image
			end

			room.update(data)
			result = { :success => true, data: room }
		else
			result = { :success => false }
		end

		render json: result
	end

	def delete
		id = params[:id]
		
		room = Room.find(id)
		if room
			room.delete()
			result = { :success => true }
		else
			result = { :success => false }
		end

		render json: result
	end

	def one
		id = params[:id]

		room = Room.find(id)
		if room
			result = { :success => true, :data => room }
		else
			result = { :success => false }
		end
	
		render json: result
	end

	def many
		rooms = Room.all()
		result = { :success => true, :data => rooms }
		render json: result
	end
end
