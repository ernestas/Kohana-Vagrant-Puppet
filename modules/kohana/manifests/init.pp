class kohana {
	exec { "sudo sed -i -e 's/AllowOverride None/AllowOverride All/' -e 's|var/www/html|vagrant/public|' /etc/apache2/sites-available/default":
		require => File['/etc/apache2/sites-available/default'],
		notify  => Exec['apache-graceful'];
	}

	mysql::database { 'kohana':
		ensure => present,
	}

	mysql::user { 'kohana':
		user     => 'kohana',
		password => 'kohana',
	}

	mysql::rights { 'Set rights for kohana database':
		user     => 'kohana',
		database => 'kohana',
		privs    => 'all',
	}
}
