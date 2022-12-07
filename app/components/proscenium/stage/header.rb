# frozen_string_literal: true

module Proscenium::Stage::Components
  class Header < Proscenium::Phlex
    include Proscenium::Phlex::ResolveCssModules
    include Proscenium::Stage::Engine.routes.url_helpers

    def initialize(component_path = nil) # rubocop:disable Lint/MissingSuper
      @component_path = component_path
    end

    def template
      header do
        div class: '@logo' do
          a(href: root_path) { Proscenium::Stage.config.title }
        end

        div(class: '@select') do
          if @component_path
            a(href: _component_path(@component_path), target: '_blank') do
              'Open in new tab'
            end
          end

          unsafe_raw helpers.select_tag 'components', options_for_component_select,
                                        prompt: 'Select component...',
                                        id: 'componentSelect'
        end
      end
    end

    private

    def options_for_component_select
      helpers.options_for_select [
        %w[Modal modal],
        %w[Sheet sheet]
      ], @component_path
    end
  end
end
