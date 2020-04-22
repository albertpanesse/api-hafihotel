require_relative '../models/menu'

class MenuController < ApplicationController
	def create
		name = params[:name]
		image = params[:image]
		tags = params[:tags]

		data = { name: name, image: image, tags: tags }

		menu = Menu.create(data)
		if menu
			result = { :success => true, data: menu }
		else
			result = { :success => false }
		end

		render json: result
	end

	def update
		id = params[:id]
		name = params[:name]
		image = params[:image]
		tags = params[:tags]

		data = { name: name, image: image, tags: tags }

		menu = Menu.find(id)
		if menu
			menu.update(data)
			result = { :success => true, data: menu }
		else
			result = { :success => false }
		end

		render json: result
	end

	def delete
		id = params[:id]
		
		menu = Menu.find(id)
		if menu
			menu.delete()
			result = { :success => true }
		else
			result = { :success => false }
		end

		render json: result
	end

	def one
		id = params[:id]

		menu = Menu.find(id)
		if menu
			result = { :success => true, :data => menu }
		else
			result = { :success => false }
		end
	
		render json: result
	end

	def many
		menus = Menu.all()
		result = { :success => true, :data => menus }
		render json: result
	end
end
