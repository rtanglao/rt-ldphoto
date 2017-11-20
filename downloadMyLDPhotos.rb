#!/usr/bin/env ruby
require 'rubygems'
require 'capybara/poltergeist'

require 'phantomjs'
require 'capybara/dsl'
include Capybara::DSL

# Configure Poltergeist to not blow up on websites with js errors aka every website with js
# See more options at https://github.com/teampoltergeist/poltergeist#customization
#Capybara.register_driver :poltergeist do |app|
#  Capybara::Poltergeist::Driver.new(app, js_errors: false)
#end
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app, timeout: 180, port: 8910, host: "127.0.0.1",
    debug: true,
    phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any', '--load-images=no']
    #, phantomjs_options: ['--load-images=no]
                                   )
end
# Configure Capybara to use Poltergeist as the driver
Capybara.default_driver = :poltergeist
page.driver.options[:phantomjs] = Phantomjs.path # MAGIC

