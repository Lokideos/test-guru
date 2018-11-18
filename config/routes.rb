# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  get '/:lang' => 'tests#index'
  get '/:lang' => 'badges#index'
  root to: 'tests#index'

  scope '(:lang)', lang: /en|ru/ do
    devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                       controllers: { sessions: 'users/sessions' }

    resources :badges, only: :index

    resources :tests, only: :index do
      member do
        post :start
      end
    end

    resources :test_passages, only: %i[show update] do
      member do
        get :result
        post :gist
      end
    end

    resources :feedbacks, only: %i[new create]

    namespace :admin do
      resources :tests do
        patch :update_inline, on: :member

        resources :questions, shallow: true, except: [:index] do
          resources :answers, shallow: true, except: [:index]
        end
      end

      resources :gists, only: :index
      resources :badges
    end
  end
end
# rubocop:enable Metrics/BlockLength
