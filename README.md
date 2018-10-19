# rt-ldphoto
london drugs photolab fun :-)

## 19October2018 setup geckodriver
```bash
cd /Users/rtanglao/Dropbox/Photos/3RD_SUNDAY/21OCTOBER2018
export PATH=/Users/rtanglao/Dropbox/GIT/rt-ldphoto:$PATH
/Users/rtanglao/Dropbox/GIT/rt-ldphoto/click-sidebar-ldphotos.rb https://photolab.londondrugs.com/prints?coll=Z23yvwjDp6RDOLDbpOo1LM4B 21october2018-3rdsunday
```
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
