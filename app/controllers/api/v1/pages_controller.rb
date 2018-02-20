class Api::V1::PagesController < Api::V1::ApiController
  def store_content
    store_content = Page.parse_content_and_save(params['url'])

    render json: {
      page: {
        url: store_content.url,
        content: store_content.content
      }
    }
  end

  def index
    render json: Page.all
  end
end
