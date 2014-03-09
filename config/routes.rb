RailsApiDoc::Engine.routes.draw do
  resources :parameters


	root to: "apis#index"
  resources :apis
  get 'generate_doc' => 'apis#generate_doc', :as => :generate_doc

end
