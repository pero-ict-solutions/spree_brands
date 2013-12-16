Spree::Core::Engine.add_routes do
  resources :brands

  namespace :admin do
    resources :brands
  end

end
