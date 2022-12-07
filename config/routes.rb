# frozen_string_literal: true

Proscenium::Stage::Engine.routes.draw do
  # Framed components
  get '/components/*component' => 'components#show_framed', as: :component

  # Unframed components
  get '/_components/*component' => 'components#show_unframed', as: :_component

  root 'components#index'
end
