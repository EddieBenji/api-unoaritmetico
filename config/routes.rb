Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'uno_aritmetico/import_games'
    end
  end

end
