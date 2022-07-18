Rails.application.routes.draw { resources :plants, only: %i[index show create] }
