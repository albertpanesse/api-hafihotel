class AddRoomCategoryRefToRooms < ActiveRecord::Migration[6.0]
  def change
  	add_reference :rooms, :room_category, foreign_key: true
  end
end
