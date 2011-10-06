Exec { path => "/usr/bin:/usr/sbin:/bin", }

include bootstrap

include apache
include php
include php::extensions::mysql
include php::extensions::mcrypt
include php::extensions::curl
include mysql::server

include kohana
