#!/usr/bin/env ruby
require 'rubygems'
require 'watir'
require 'pp'


url = "https://photolab.londondrugs.com/prints?coll=mVnr3ZX2GN3v1K46YLzyJxjo"
#url = "https://photolab.londondrugs.com/prints/pf/mVnr3ZX2GN3v1K46YLzyJxjo"
b = Watir::Browser.start url,  :firefox #, headless: true
#pp b.images

Watir::Wait.until(timeout: 60) {pp b.images.length ; b.images.length > 22 }
b.images.each do |i|
  src = i.src
  if src.include?("storage.photofinale")
    pp src
  end
end

