require "open-uri"
require "yaml"


namespace :get_chapter do
  desc 'A description for the task'
  task number: :environment do

    url = "http://www.dragonball-multiverse.com/fr/chapters.html"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    elements = html_doc.search('.chapters')

    last_chapter_number = elements.last.attribute('ch').value.to_i
    if last_chapter_number != Chapter.last.number
      Chapter.last.finished = true
      Chapter.create!(
        number: last_chapter_number,
        title: "title to parse",
        img_url: "url",
        )
    end
  end
end
