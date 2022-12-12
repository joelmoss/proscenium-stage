# frozen_string_literal: true

module Proscenium::Stage::Views
  class Components::ShowFramed < Application
    def initialize(component_path) # rubocop:disable Lint/MissingSuper
      @component_path = component_path
    end

    def template
      super do
        render Proscenium::Stage::Components::Header.new(@component_path)
        iframe src: proscenium_stage._component_path(@component_path), width: '100%', height: '100%'
      end
    end
  end
end
