# frozen_string_literal: true

require 'proscenium/stage/version'
require 'proscenium/stage/engine'

module Proscenium
  module Stage
    class << self
      def config
        @config ||= Railtie.config.proscenium_stage
      end
    end

    module Views; end
    module Components; end

    module_function

    def components
      component_stage_path = Rails.root.join('app', 'components')

      Dir["#{component_stage_path}/**/*_preview.rb"].sort.each do |file|
        require_dependency file
      end
    end
  end
end
