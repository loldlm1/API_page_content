require 'redcarpet'
require 'redcarpet/render_strip'
require 'rouge'
require 'rouge/plugins/redcarpet'

class MarkdownService
  class CustomHtml < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def self.render(text)
    markdown.render(text).html_safe
  end

  def self.render_stripped(text)
    Redcarpet::Markdown.new(Redcarpet::Render::StripDown).render(text)
  end

  def self.markdown
    Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      fenced_code_blocks: true,
      footnotes: true,
      highlight: true,
      no_images: false,
      no_intra_emphasis: true,
      quote: true,
      space_after_headers: false,
      strikethrough: true,
      superscript: true,
      tables: true,
      underline: true
    )
  end

  def self.renderer
    CustomHtml.new(
      filter_html: false,
      hard_wrap: false,
      no_styles: true,
      prettify: true,
      safe_links_only: true,
      with_toc_data: true
    )
  end
end
