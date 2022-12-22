# frozen_string_literal: true

require 'proscenium/stage/version'
require 'proscenium/stage/engine'

module Proscenium
  module Stage
    extend ActiveSupport::Autoload

    autoload :Preview

    class << self
      def config
        @config ||= Railtie.config.proscenium_stage
      end
    end

    module Views; end
    module Components; end

    module_function

    def components
      components = []

      Dir["#{Rails.root.join('app', 'components')}/**/preview.rb"].each do |file|
        component = Rails.autoloaders.main.load_file(file)
        path = component.name.underscore

        component.public_instance_methods(false).each { |meth| components << "#{path}/#{meth}" }
      end

      components
    end
  end
end
