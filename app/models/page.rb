class Page < ApplicationRecord
  validates :url, format: {
    with: /\A(((http|https):\/\/|)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?)\z/,
    message: 'Invalid URL'
  }
  before_save :parse_content, if: :content_empty?

  def parse_content
    page = Nokogiri::HTML(RestClient.get(url))
    self.content = {
      h1: page.css('h1').map(&:text),
      h2: page.css('h2').map(&:text),
      h3: page.css('h3').map(&:text),
      a: page.css('a').map(&:text)
    }
  end

  private

  def content_empty?
    content == '{}'
  end
end
