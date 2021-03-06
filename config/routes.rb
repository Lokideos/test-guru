# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
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

      resources :badge_acquisitions, only: %i[index destroy]
    end
  end

  get '/:lang' => 'tests#index'
  root to: 'tests#index'
end
# rubocop:enable Metrics/BlockLength
