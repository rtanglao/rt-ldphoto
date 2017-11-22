# rt-ldphoto
london drugs photolab fun :-)
## 21November2017 - working version with watir

* on 22november, add url as a command line parameter!
```sh
./click-sidebar-ldphotos.rb
```



## 19November2017 a script to download photos
* 1\. see what we got :-)
```ruby
require 'mechanize'
require 'pp'
mechanize = Mechanize.new
photos_page = mechanize.get 'https://photolab.londondrugs.com/prints?coll=mVnr3ZX2GN3v1K46YLzyJxjo'
pp photos_page
```
