class Api::V1::PagesController < Api::V1::ApiController
  def create
    page = Page.new(page_params)

    if page.save
      render json: hash_for([page])
    else
      render json: page.errors.messages
    end
  end

  def index
    render json: hash_for(Page.all)
  end

  private

  def page_params
    params.require(:page).permit(:url)
  end

  def hash_for(pages)
    pages.map do |p|
      { url: p.url, content: p.content }
    end
  end
end
