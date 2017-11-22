#!/usr/bin/env ruby
require 'rubygems'
require 'watir'
require 'watir-scroll'
require 'pp'

url = "https://photolab.londondrugs.com/prints?coll=mVnr3ZX2GN3v1K46YLzyJxjo"
$b = Watir::Browser.start url ,  :firefox #, headless: true
num_path = "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[1]/collections-view/div/div[1]/div[1]/div[3]/ul/li[2]/div/div[2]/div[1]" 
num = $b.element(xpath: num_path).wait_until_present
num_photos =  num.text.to_i
$download_button = "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[2]/div/div/a"
$stderr.printf("num_photos:%d\n", num_photos)
$urls = []
$url_count = 0
photo1 = "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[2]/div/ul/li[2]/ul/li[1]/div/div[1]/div[1]/div/img"
$b.element(xpath: photo1).wait_until_present.click

expand_photo1 = "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[2]/div/ul/li[2]/ul/li[1]/div/div[1]/div[1]/div/preview-glyph/div/div/span/i[2]"

$b.element(xpath: expand_photo1).wait_until_present.click
download_path = "div.commandbar-panel:nth-child(2) > photos-toolbar:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)"
next_photo = "/html/body/div[2]/div[2]/div/prints-photo/div/div/div[1]/div[2]/photo-view/div/div[1]/div[5]"

loop do
  download_link = $b.link(css: download_path )
  link =  download_link.href
  if !$urls.include?(link)
    $urls.push(link)
    $stderr.printf("ADDING:%s count:%d\n", link, $urls.length)
    break if $urls.length == num_photos
  end
  $b.element(xpath: next_photo).wait_until_present.click
end
#$b.images.each do |i|
#  #next if i.autofit_preview.nil?
#  pp i.src
#end



  
