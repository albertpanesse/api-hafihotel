require_relative '../models/menu_category'

class MenuCategoryController < ApplicationController
	def create
		name = params[:name]

		data = { name: name }

		menuCategory = MenuCategory.create(data)
		if menuCategory
			result = { :success => true, data: menuCategory }
		else
			result = { :success => false }
		end

		render json: result
	end

	def update
		id = params[:id]
		name = params[:name]

		data = { name: name }

		menuCategory = MenuCategory.find(id)
		if menuCategory
			menuCategory.update(data)
			result = { :success => true, data: menuCategory }
		else
			result = { :success => false }
		end

		render json: result
	end

	def delete
		id = params[:id]
		
		menuCategory = MenuCategory.find(id)
		if menuCategory
			menuCategory.delete()
			result = { :success => true }
		else
			result = { :success => false }
		end

		render json: result
	end

	def one
		id = params[:id]

		menuCategory = MenuCategory.find(id)
		if menuCategory
			result = { :success => true, :data => menuCategory }
		else
			result = { :success => false }
		end
	
		render json: result
	end

	def many
		menuCategories = MenuCategory.all()
		result = { :success => true, :data => menuCategories }
		render json: result
	end
end
