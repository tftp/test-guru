Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  get 'contacts', to: 'contacts#index'
  post 'send_message', to: 'contacts#send_message'

  resources :tests, only: :index do
    member do
      post  :start
    end
  end


  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
          resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges, shallow: true
  end

  resources :badges, only: :index

end
