Rails.application.routes.draw do
  get '/', to: 'games#home', as: 'home'
  get '/score', to: 'games#score', as: 'score'
end
