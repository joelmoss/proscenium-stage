# frozen_string_literal: true

class Proscenium::Stage::Preview
  class Component < Proscenium::Phlex::ReactComponent
    def initialize(...)
      loc = caller_locations(2, 1)[0]
      @preview_name = loc.label

      # Reassign the component path, as we must use the path of the calling preview component.
      self.class.path = loc.path

      super(...)
    end

    def virtual_path
      new_path = path.to_s.delete_prefix(Rails.root.to_s)
      new_path.sub(/preview\.rb$/, @preview_name)
    end
  end
end
