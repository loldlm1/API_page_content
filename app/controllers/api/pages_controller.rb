module Api
  class PagesController < ApplicationController
    def content
      content = { a: 1, b: 2 }

      respond_to do |format|
        format.json do
          render json: content
        end
      end
    end

    def urls

    end
  end
end