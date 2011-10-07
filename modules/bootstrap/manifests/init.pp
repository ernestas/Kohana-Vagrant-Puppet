class bootstrap {
	group { puppet:
		ensure => present,
	}

	exec { "sed -i 's|#|//|' /etc/php5/cli/conf.d/mcrypt.ini":
		require => Package['php'],
	}
}
