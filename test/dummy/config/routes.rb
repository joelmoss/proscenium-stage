# frozen_string_literal: true

Rails.application.routes.draw do
  mount Proscenium::Stage::Engine => '/proscenium-stage'
end
