# frozen_string_literal: true

require 'proscenium/stage/version'
require 'proscenium/stage/engine'

module Proscenium
  module Stage
    extend ActiveSupport::Autoload

    autoload :Base

    class << self
      def config
        @config ||= Railtie.config.proscenium_stage
      end

      def scenes
        methods = []

        config.paths.each do |path|
          Dir["#{path}/**/*/component_stage.rb"].each do |file|
            stage = Rails.autoloaders.main.load_file(file)
            stage_path = stage.name.underscore

            stage.public_instance_methods(false).each do |meth|
              methods << ["#{stage.name.delete_suffix('::ComponentStage')}##{meth}",
                          "#{stage_path}/#{meth}"]
            end
          end
        end

        methods
      end
    end

    module Views; end
    module Components; end
  end
end
