require_relative '../models/room_category'

class RoomCategoryController < ApplicationController
	def create
		name = params[:name]
		desc = params[:desc]

		data = { name: name, desc: desc }

		roomCategory = RoomCategory.create(data)
		if roomCategory
			result = { :success => true, data: roomCategory }
		else
			result = { :success => false }
		end

		render json: result
	end

	def update
		id = params[:id]
		name = params[:name]
		desc = params[:desc]

		data = { name: name, desc: desc }

		roomCategory = RoomCategory.find(id)
		if roomCategory
			roomCategory.update(data)
			result = { :success => true, data: roomCategory }
		else
			result = { :success => false }
		end

		render json: result
	end

	def delete
		id = params[:id]
		
		roomCategory = RoomCategory.find(id)
		if roomCategory
			roomCategory.delete()
			result = { :success => true }
		else
			result = { :success => false }
		end

		render json: result
	end

	def one
		id = params[:id]

		roomCategory = RoomCategory.find(id)
		if roomCategory
			result = { :success => true, :data => roomCategory }
		else
			result = { :success => false }
		end
	
		render json: result
	end

	def many
		roomCategories = RoomCategory.all()
		result = { :success => true, :data => roomCategories }
		render json: result
	end
end
