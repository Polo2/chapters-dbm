
def create_related_chapter(element)
  number = element.attribute('ch').value.to_i
  title = element.css('h4')[0].text
  Chapter.create!( number: number, title: title, finished: true )
end

def create_related_page(params)
end


def dbm_page_url(number)
  "http://www.dragonball-multiverse.com/fr/page-#{number}.html"
end

def initialize_elements(url)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.chfanfic').remove
  @elements = html_doc.search('.chapters')
  return "initialize : done"
end

puts "Get all DBM chapters"
puts "25 septembre"

dbm_url_chapters = "http://www.dragonball-multiverse.com/fr/chapters.html"

initialize_elements(dbm_url_chapters)

Chapter.destroy_all
DbmPage.destroy_all

@elements.each do |e|
  chapter = create_related_chapter(e) unless e.attribute('ch').nil?
  e.css('a').each do |item|
    DbmPage.create!(
      number: item.text.to_i,
      url: dbm_page_url(item.text.to_i),
      chapter: chapter,
    ) unless item.text.empty?
  end unless chapter.nil?

end

# # HACK : img urls
chapter_64 = Chapter.where(number: 64).first
chapter_64.update!(
  img_url: "http://www.dragonball-multiverse.com/fr/pages/final/1459.jpg"
)
chapter_65 = Chapter.where(number: 65).first
chapter_65.update!(
  finished: false,
  img_url: "http://www.dragonball-multiverse.com/fr/pages/final/1488.jpg",
)

puts "#{Chapter.count} chapitre créés"
puts "#{DbmPage.count} pages créées"
