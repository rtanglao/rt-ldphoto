#!/usr/bin/env ruby
require 'rubygems'
require 'watir'
require 'watir-scroll'
require 'pp'


url = "https://photolab.londondrugs.com/prints?coll=mVnr3ZX2GN3v1K46YLzyJxjo"
#url = "https://photolab.londondrugs.com/prints/pf/mVnr3ZX2GN3v1K46YLzyJxjo"
b = Watir::Browser.start url ,  :firefox #, headless: true
#pp b.images
#b.scroll.to :bottom
#b.execute_script("window.scrollBy(0,200)")
b.element(:xpath => '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/button').wait_until_present.click
b.element(:xpath, "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/ul/li[2]/div[2]/span").wait_until_present.click
b.element(:xpath => '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/button').wait_until_present.click
b.element(:xpath, "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/ul/li[1]/div[2]/span").wait_until_present.click
# b.element(class: 'sort-by-date').wait_until_present.click
button = b.button(class: 'btn-select-all')
#buttonrefresh = b.button(class: 'btn-refresh')
#loop do
#  link_number = b.links.size
#   b.scroll.to :bottom
#   break if b.links.size == link_number
# end
# Watir::Wait.until(timeout: 60) {pp b.images.length ;
#   loop do
#   link_number = b.links.size
#   b.scroll.to :bottom
#   break if b.links.size == link_number
# end;
#   ; b.images.length > 22 }
Watir::Wait.until(timeout: 180) {pp b.images.length  ;
  b.scroll.to :top
  b.scroll.to :bottom
  last_photo = nil;
  e = b.images.each do |i|
    src = i.src
    pp src
    if src.include?("storage.photofinale")
      last_photo = i
      i.wait_until_present.click
      b.scroll.to :center
    end
  end;
  printf("last photo:%s\n", last_photo.src)
  #last_photo.wait_until_present.click;
  pp last_photo.src;
  last_photo.scroll.to :top ;
  # #b.element(xpath: '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[2]/div/ul/li[2]/ul/li[1]/div/div[1]/div[1]/div/img').wait_until_present.click;
#   #b.element(xpath: '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[2]/div/ul/li[2]/ul/li[1]/div/div[1]/div[1]/div/img').scroll.to :bottom
# b.element(:xpath => '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/button').wait_until_present.click
# b.element(:xpath, "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/ul/li[2]/div[2]/span").wait_until_present.click
# b.element(:xpath => '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/button').wait_until_present.click
# b.element(:xpath, "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/ul/li[1]/div[2]/span").wait_until_present.click
  b.images.length > 22 }
#Watir::Wait.until(timeout: 180) {pp b.images.length ; button.scroll.to ;  button.scroll.to :center ;
#button.scroll.to :bottom   ; buttonrefresh = b.button(class: 'btn-refresh').click ; b.images.length > 22 }
b.images.each do |i|
  src = i.src
  if src.include?("storage.photofinale")
    pp src
    original_url = src.gsub("&size=240", "&size=0")
    pp original_url
  end
end

