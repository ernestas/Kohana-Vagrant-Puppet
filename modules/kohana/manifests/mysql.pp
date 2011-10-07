class kohana::mysql {
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
