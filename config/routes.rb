# frozen_string_literal: true

Proscenium::Stage::Engine.routes.draw do
  get '/_/*path' => 'scenes#unframed', as: :_scene
  get '/*path' => 'scenes#framed', as: :scene

  root 'scenes#index'
end
