class Page < ApplicationRecord
  def self.parse_content_and_create(url)
    page = Nokogiri::HTML(RestClient.get(url))
    page_parsed = {
      h1: page.css('h1').map(&:text),
      h2: page.css('h2').map(&:text),
      h3: page.css('h3').map(&:text),
      a: page.css('a').map(&:text)
    }

    create(url: url, content: page_parsed)
  end
end
