Rails.application.routes.draw do
  namespace :admin do
    root "user#home"
  end
end
