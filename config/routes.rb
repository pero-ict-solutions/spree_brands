Spree::Core::Engine.routes.draw do

  resources :brands

  namespace :admin do
    resources :brands
  end

end
