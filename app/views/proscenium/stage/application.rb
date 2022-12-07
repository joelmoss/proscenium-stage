# frozen_string_literal: true

module Proscenium::Stage::Views
  class Application < Proscenium::Phlex
    include Rails.application.routes.url_helpers
    include Proscenium::Phlex::Page
    include Proscenium::Phlex::ResolveCssModules

    def page_title
      Proscenium::Stage.config.title
    end
  end
end
