#!/usr/bin/env ruby
require 'rubygems'
require 'watir'
require 'watir-scroll'
require 'pp'


url = "https://photolab.londondrugs.com/prints?coll=mVnr3ZX2GN3v1K46YLzyJxjo"
b = Watir::Browser.start url ,  :firefox #, headless: true
#pp b.i
b.element(:xpath => '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/button').wait_until_present.click
b.element(:xpath, "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/ul/li[2]/div[2]/span").wait_until_present.click
b.element(:xpath => '/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/button').wait_until_present.click
b.element(:xpath, "/html/body/div[2]/div[2]/div/prints/div/div/div/prints-photos/div/div/div[1]/div[2]/div[2]/photos-view/div/div[1]/photos-toolbar/div/div[1]/div/ul/li[1]/div[2]/span").wait_until_present.click

Watir::Wait.until(timeout: 180) {
  $stderr.printf("LENGTH:%d\n", b.images.length)  ;
  b.scroll.to :top
  b.scroll.to :bottom
  last_photo = nil;
  e = b.images.each do |i|
    src = i.src
    #pp src
    if src.include?("storage.photofinale")
      last_photo = i
      i.wait_until_present.click
      b.scroll.to :center
    end
  end;
  $stderr.printf("last photo:%s\n", last_photo.src);
  last_photo.scroll.to :top ;
  b.images.length > 22 }
b.images.each do |i|
  src = i.src
  if src.include?("storage.photofinale")
    #pp src
    original_url = src.gsub("&size=240", "&size=0")
    pp original_url
  end
end

