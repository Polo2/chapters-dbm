require "open-uri"
require "yaml"

namespace :chapters do
  desc 'A description for the task'
  task update: :environment do


    def initialize_elements(url)
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('.chfanfic').remove
      @elements = html_doc.search('.chapters')
      return "initialize : done"
    end

    # Scrap elements on DBM webpage

    dbm_url_chapters = "http://www.dragonball-multiverse.com/fr/chapters.html"
    initialize_elements(dbm_url_chapters)
    element = @elements.last

    chap_number = element.attribute('ch').value.to_i
    chap_title = element.css('h4')[0].text
    page_number = element.css('a').last.text.to_i
    cover_img_url = "http://www.dragonball-multiverse.com/fr/pages/final/#{page_number}.jpg"


    # creation under condition
    if page_number > DbmPage.last_page.number
      case chap_number
      when Chapter.last_chapter.number
        DbmPage.create!(
          number: page_number,
          url:  "http://www.dragonball-multiverse.com/fr/page-#{page_number}.html",
          chapter: Chapter.last_chapter,
        )
        puts "page #{page_number} créée"
      when  Chapter.last_chapter.number + 1
        Chapter.last_chapter.update!(
          finished: true
        )
        new_chapter = Chapter.create!(
          number: chap_number,
          title: chap_title,
          finished: false,
          img_url: cover_img_url,
        )
        DbmPage.create!(
          number: page_number,
          url:  "http://www.dragonball-multiverse.com/fr/page-#{page_number}.html",
          chapter: new_chapter,
        )
        puts "page #{page_number} créée"
        puts "chapitre #{chap_number} créé"
      else
        puts "Aïe : saut de chapitre !!!"
      end
    else
      puts "no new page"
    end
  end
end
