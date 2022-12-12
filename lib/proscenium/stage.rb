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
      components_path = "#{Rails.root.join('app', 'components')}/"
      components = []

      Dir["#{components_path}**/preview.rb"].each do |file|
        path = file.delete_prefix(components_path).delete_suffix('/preview.rb')

        methods = "components/#{path}/preview".classify.constantize.public_instance_methods(false)
        methods.each { |meth| components << "#{path}/#{meth}" }
      end

      components
    end
  end
end
