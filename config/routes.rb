Rails.application.routes.draw do
  get 'api/dash/statuses', to: 'dash#statuses'
  get 'api/dash/detail:id', to: 'dash#detail'
  post 'api/dash/checkin', to: 'dash#checkin'
  post 'api/dash/checkout', to: 'dash#checkout'

  post 'api/room-category/create', to: 'room_category#create'
  put 'api/room-category/update', to: 'room_category#update'
  delete 'api/room-category/delete', to: 'room_category#delete'
  get 'api/room-category/one/:id', to: 'room_category#one'
  get 'api/room-category/many', to: 'room_category#many'

  post 'api/room/create', to: 'room#create'
  put 'api/room/update', to: 'room#update'
  delete 'api/room/delete', to: 'room#delete'
  get 'api/room/one/:id', to: 'room#one'
  get 'api/room/many', to: 'room#many'

  post 'api/file/upload', to: 'file#upload'
end
