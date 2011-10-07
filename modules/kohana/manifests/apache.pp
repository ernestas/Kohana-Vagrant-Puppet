class kohana::apache {
	exec { "sudo sed -i -e 's/AllowOverride None/AllowOverride All/' -e 's|var/www/html|vagrant/public|' /etc/apache2/sites-available/default":
		require => File['/etc/apache2/sites-available/default'],
		notify  => Exec['apache-graceful'];
	}
}
