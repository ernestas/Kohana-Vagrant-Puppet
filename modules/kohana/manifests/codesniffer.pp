class kohana::codesniffer {
	package { 'PHP_CodeSniffer-1.2.2':
		ensure   => 'installed',
		provider => 'pear',
		require  => Package['php-pear'],
	}

	package { 'PHP_CodeSniffer_Standards_Kohana':
		ensure   => 'installed',
		provider => 'pear',
		source   => 'pear.kohanaframework.org/PHP_CodeSniffer_Standards_Kohana',
		require  => Package['PHP_CodeSniffer-1.2.2'],
	}
}
