# frozen_string_literal: true

module Proscenium
  module Stage
    class Engine < ::Rails::Engine
      isolate_namespace Proscenium::Stage

      config.proscenium.include_ruby_gems['proscenium-stage'] = root

      # Rails.autoloaders.main.collapse "#{__dir__}/app/views"
      # config.autoload_paths << root.join('app', 'views')
      # config.proscenium.include_paths += ['app/components']

      config.proscenium_stage = ActiveSupport::OrderedOptions.new
      config.proscenium_stage.title = 'Proscenium Stage'

      initializer 'proscenium-stage.autoload' do
        Rails.autoloaders.main.push_dir(root.join('app', 'views', 'proscenium', 'stage'),
                                        namespace: Proscenium::Stage::Views)
        Rails.autoloaders.main.push_dir(root.join('app', 'components', 'proscenium', 'stage'),
                                        namespace: Proscenium::Stage::Components)
      end

      initializer 'proscenium-stage.configuration' do |app|
        options = app.config.proscenium_stage

        options.title = "#{app.class.name.deconstantize} Stage"
      end
    end
  end
end
