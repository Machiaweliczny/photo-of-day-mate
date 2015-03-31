require 'mechanize'
mechanize = Mechanize.new
page = mechanize.get('http://photography.nationalgeographic.com/photography/photo-of-the-day/')
img_url = page.at(".primary_photo").search("img").first.attributes.first.last.value
File.delete("dayphoto.jpg") if File.exist?("dayphoto.jpg")
mechanize.get(img_url).save_as "dayphoto.jpg"
