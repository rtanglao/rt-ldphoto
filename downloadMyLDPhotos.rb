#!/usr/bin/env ruby
require 'rubygems'
require 'capybara/poltergeist'
require 'pp'

# Configure Poltergeist to not blow up on websites with js errors aka every website with js
# See more options at https://github.com/teampoltergeist/poltergeist#customization
#Capybara.register_driver :poltergeist do |app|
#  Capybara::Poltergeist::Driver.new(app, js_errors: false)
#end
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app, timeout: 180, port: 8910, host: "127.0.0.1",
    #debug: true,
    js_errors: false,
    phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any']
                        #, '--load-images=no']
    #, phantomjs_options: ['--load-images=no]
                                   )
end
# Configure Capybara to use Poltergeist as the driver
Capybara.default_driver = :poltergeist
#page.driver.options[:phantomjs] = Phantomjs.path # MAGIC
browser = Capybara.current_session
url = "https://photolab.londondrugs.com/prints?coll=mVnr3ZX2GN3v1K46YLzyJxjo"
browser.visit url
# browser.save_and_open_page
browser.all('img').each do |i|  
  pp i[:src]
end
