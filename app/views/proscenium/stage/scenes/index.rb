# frozen_string_literal: true

module Proscenium::Stage::Views
  class Scenes::Index < Application
    def template
      super do
        render Proscenium::Stage::Components::Header.new
        main do
          div(class: '@unselected') { 'No scene currently selected 👀' }
        end
      end
    end
  end
end
