maintainer 'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license 'Apache 2.0'
description 'installs/configures automysqlbackup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name 'automysqlbackup'
version '2.0.1'

%w(debian ubuntu).each do |os|
  supports os
end

%w(mysql).each do |ressource|
  depends ressource
end
