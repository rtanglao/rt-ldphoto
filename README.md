# rt-ldphoto
london drugs photolab fun :-)
## 19November2017 a script to download photos
* 1\. see what we got :-)
```ruby
require 'mechanize'
require 'pp'
mechanize = Mechanize.new
photos_page = mechannize.get 'https://photolab.londondrugs.com/prints?coll=mVnr3ZX2GN3v1K46YLzyJxjo'
pp photos_page
```
