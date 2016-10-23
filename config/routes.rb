Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index, :new, :edit]
  resources :character_archetypes, only: [:index, :show]

  resources :story_templates, path: "templates" do
    resources :story_chapters, path: "chapters"
  end

  post 'login' => 'login#login'

end
