# frozen_string_literal: true

module Proscenium::Stage
  class ScenesController < ApplicationController
    def index
      render Views::Scenes::Index.new
    end

    def framed
      render Views::Scenes::Framed.new(params[:path])
    end

    def unframed
      render Views::Scenes::Unframed.new(params[:path])
    end
  end
end
