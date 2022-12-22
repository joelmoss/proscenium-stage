# frozen_string_literal: true

module Proscenium::Stage::Views
  class Application < Proscenium::Phlex
    include Proscenium::Stage::Engine.routes.url_helpers
    include Proscenium::Phlex::Page
    include Proscenium::Phlex::ResolveCssModules

    def head
      super do
        meta name: 'viewport', content: 'width=device-width,initial-scale=1'
        meta name: 'root-path', content: root_path
      end
    end

    def page_title
      Proscenium::Stage.config.title
    end
  end
end
