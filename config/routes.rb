Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :categories, only: [:index, :show]
    end
  end

  get '*path', to: 'home#index', constraints: ->(request) do
    request.format.html? && !request.xhr?
  end
end
