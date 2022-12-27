# frozen_string_literal: true

module Proscenium::Stage::Views
  class Scenes::Framed < Application
    def initialize(scene_path) # rubocop:disable Lint/MissingSuper
      @scene_path = scene_path
    end

    def template
      super do
        render Proscenium::Stage::Components::Header.new(@scene_path)
        iframe src: _scene_path(@scene_path), width: '100%', height: '100%'
      end
    end
  end
end
