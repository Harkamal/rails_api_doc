RailsApiDoc::Engine.routes.draw do
  
  resources :projects do 
  	resources :apis
  	get 'generate_doc' => 'apis#generate_doc', :as => :generate_doc
  end


  resources :parameters


	root to: "projects#index"

end
