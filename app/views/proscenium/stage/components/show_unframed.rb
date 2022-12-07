# frozen_string_literal: true

module Proscenium::Stage::Views
  class Components::ShowUnframed < Application
    def initialize(component_path) # rubocop:disable Lint/MissingSuper
      path = component_path.split('/')

      @preview_method = path.pop.to_sym
      @component_path = path.join('/')
      @component_class = "Components::#{@component_path.classify}::Preview".constantize
    end

    def template
      super do
        main do
          render @component_class.new.send(@preview_method)
        end
      end
    end
  end
end
