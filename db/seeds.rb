
def create_related_chapter(element)
  number = element.attribute('ch').value.to_i
  title = element.css('h4')[0].text
  Chapter.create!( number: number, title: title, finished: true )
end

def create_page(params)
end

def initialize_elements(url)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  @elements = html_doc.search('.chapters')
  return "initialize : done"
end

puts "Get all DBM chapters"
puts "25 septembre"

dbm_url = "http://www.dragonball-multiverse.com/fr/chapters.html"

initialize_elements(dbm_url)

Chapter.destroy_all
DbmPage.destroy_all

@elements.each { |e| create_related_chapter(e) unless e.attribute('ch').nil? }


chapter_63 = Chapter.where(number: 63).first
chapter_63.update!(
  img_url: "http://www.dragonball-multiverse.com/fr/pages/final/1434.jpg"
)

# HACK : img urls
chapter_64 = Chapter.where(number: 64).first

chapter_64.update!(
  finished: false,
  img_url: "http://www.dragonball-multiverse.com/fr/pages/final/1459.jpg",
)

# HACK : 2 pages
page_1437 = DbmPage.create!(
  number: 1437,
  url: "http://www.dragonball-multiverse.com/fr/page-1437.html",
  chapter: chapter_63
)

page_1482 = DbmPage.create!(
  number: 1482,
  url: "http://www.dragonball-multiverse.com/fr/page-1482.html",
  chapter: chapter_64
)

puts "#{Chapter.count} chapitre créés"
puts "#{DbmPage.count} pages créées"
