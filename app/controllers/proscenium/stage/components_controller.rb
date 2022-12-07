# frozen_string_literal: true

module Proscenium::Stage
  class ComponentsController < ApplicationController
    def index
      render Views::Components::Index.new
    end

    def show_framed
      render Views::Components::ShowFramed.new(params[:component])
    end

    def show_unframed
      render Views::Components::ShowUnframed.new(params[:component])
    end
  end
end
