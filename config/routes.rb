require 'resque/server'

Rails.application.routes.draw do
  root 'people#index'

  resources :people

  mount Resque::Server.new, at: "/resque"
end

# == Route Map
#
#      Prefix Verb   URI Pattern                Controller#Action
#        root GET    /                          people#index
#      people GET    /people(.:format)          people#index
#             POST   /people(.:format)          people#create
#  new_person GET    /people/new(.:format)      people#new
# edit_person GET    /people/:id/edit(.:format) people#edit
#      person GET    /people/:id(.:format)      people#show
#             PATCH  /people/:id(.:format)      people#update
#             PUT    /people/:id(.:format)      people#update
#             DELETE /people/:id(.:format)      people#destroy
#                    /resque                    #<Resque::Server app_file="/Users/damiangalindo/.rvm/gems/ruby-2.2.4@people_management/gems/resque-1.26.0/lib/resque/server.rb">
#
