class Proscenium::Stage::Base
  class Component
    def self.new(...)
      loc = caller_locations(1, 1)[0]

      @actor = Rails.autoloaders.main.load_file(loc.path.sub('component_stage', 'component'))
      @scene = loc.label

      before_template
      @actor.new(...)
    end

    def self.before_template; end
  end

  class ReactComponent < Proscenium::Phlex::ReactComponent
    def initialize(...)
      loc = caller_locations(2, 1)[0]
      @scene = loc.label

      # Reassign the component path, as we must use the path of the calling scene component.
      self.class.path = loc.path

      super(...)
    end

    def virtual_path
      scene_path = path.sub(/component_stage\.rb$/, "stage/#{@scene}/scene.jsx")
      "/#{Proscenium::Utils.path_pieces(scene_path).last}"
    end
  end
end
