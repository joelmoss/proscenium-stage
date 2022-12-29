class Proscenium::Stage::Base
  class Component
    def self.new(...)
      loc = caller_locations(1, 1)[0]
      @actor = Rails.autoloaders.main.load_file(loc.path).module_parents.first
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
      path.to_s.delete_prefix(Rails.root.to_s).sub(/stage\.rb$/, "stage/#{@scene}/scene.jsx")
    end
  end
end
