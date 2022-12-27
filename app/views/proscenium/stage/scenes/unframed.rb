# frozen_string_literal: true

module Proscenium::Stage::Views
  class Scenes::Unframed < Application
    def initialize(scene_path) # rubocop:disable Lint/MissingSuper
      path = scene_path.split('/')

      @scene = path.pop.to_sym
      @scene_path = path.join('/')
      @scene_class = @scene_path.classify.constantize
    end

    def template
      super do
        main do
          render @scene_class.new.send(@scene)
        end
      end
    end
  end
end
