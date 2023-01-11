# frozen_string_literal: true

module Proscenium
  module Stage
    class Engine < ::Rails::Engine
      isolate_namespace Proscenium::Stage

      config.proscenium.side_load_gems['proscenium-stage'] = {
        root: root,
        package_name: '@proscenium/stage'
      }

      config.proscenium_stage = ActiveSupport::OrderedOptions.new
      config.proscenium_stage.title = 'Proscenium Stage'
      config.proscenium_stage.paths = Set.new

      initializer 'proscenium-stage.autoload' do
        loader = Rails.autoloaders.main
        loader.push_dir(root.join('app', 'views', 'proscenium', 'stage'),
                        namespace: Proscenium::Stage::Views)
        loader.push_dir(root.join('app', 'components', 'proscenium', 'stage'),
                        namespace: Proscenium::Stage::Components)
      end

      config.before_configuration do |app|
        options = app.config.proscenium_stage

        options.title = "#{app.class.name.deconstantize} Stage"
        options.paths << app.root.join('app', 'components')
      end
    end
  end
end
