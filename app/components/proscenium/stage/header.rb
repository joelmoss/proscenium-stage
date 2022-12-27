# frozen_string_literal: true

module Proscenium::Stage::Components
  class Header < Proscenium::Phlex
    include Proscenium::Phlex::ResolveCssModules
    include Proscenium::Stage::Engine.routes.url_helpers

    def initialize(scene_path = nil) # rubocop:disable Lint/MissingSuper
      @scene_path = scene_path
    end

    def template
      header do
        div class: '@logo' do
          a(href: root_path) { Proscenium::Stage.config.title }
        end

        div(class: '@select') do
          if @scene_path
            a(href: _scene_path(@scene_path), target: '_blank') do
              'Open in new tab'
            end
          end

          unsafe_raw helpers.select_tag 'scenes', options_for_scene_select,
                                        prompt: 'Select scene...',
                                        id: 'sceneSelect'
        end
      end
    end

    private

    def options_for_scene_select
      helpers.options_for_select Proscenium::Stage.scenes, @scene_path
    end
  end
end
