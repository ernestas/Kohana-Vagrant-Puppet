#Kohana-Vagrant-Puppet

Sets up a distributable Vagrant box for Kohana. Uses Puppet provisioning.

## Server configuration

* ubuntu-10.04.3-server-i386
* apache 2.2.x
* mysql 5.1.x
* php 5.3.x
	* php5-cli
	* php5-mysql
	* php5-mcrypt
	* php5-suhosin
	* php5-tidy
	* php5-curl
	* php5-gd
	* php-apc
	* php-pear
		* phpunit
		* PHP\_CodeSniffer-1.2.2
		* PHP\_CodeSniffer\_Standards\_Kohana

## Tutorial

### 1. Add Ubuntu base box to Vagrant

Here you have 3 options:

* Build one yourself with [veewee](https://github.com/jedi4ever/veewee) using [Kohana-Veewee-Template](http://github.com/ernestas/Kohana-Veewee-Template)
* Or use my prebuild box (do it at your own risk):
    * `vagrant box add vagrant-ubuntu-10.04.3-server-i386 http://dl.dropbox.com/u/8700442/vagrant-ubuntu-10.04.3-server-i386.box`
* Or install `libaugeas-ruby` to your base box. Puppet manifests use it.

### 2. Build Kohana box

````` bash
git clone https://github.com/ernestas/Kohana-Vagrant-Puppet.git && cd Kohana-Vagrant-Puppet
git submodule update --init
vagrant up && vagrant provision
vagrant package --vagrantfile Vagrantfile.pkg --output vagrant-ubuntu-10.04.3-server-i386-kohana.box
`````

### 3. Use/distribute the built box

Add the built box:

````` bash
vagrant box add vagrant-ubuntu-10.04.3-server-i386-kohana vagrant-ubuntu-10.04.3-server-i386-kohana.box
`````

In your Kohana project's directory initialize vagrant:

````` bash
vagrant init vagrant-ubuntu-10.04.3-server-i386-kohana
vagrant up
`````

### 4. Test

It assumes that `index.php` is in `public` directory. To test the box you can:

````` bash
git clone https://github.com/kohana/kohana.git public && cd public && git submodule update --init
`````

and see localhost:8080

## Database config

````` php
<?php defined('SYSPATH') or die('No direct access allowed.');

return array
(
	'default' => array
	(
		'type'       => 'mysql',
		'connection' => array(
			'hostname'   => 'localhost',
			'database'   => 'kohana',
			'username'   => 'kohana',
			'password'   => 'kohana',
			'persistent' => FALSE,
		),
		'table_prefix' => '',
		'charset'      => 'utf8',
		'caching'      => FALSE,
		'profiling'    => TRUE,
	),
);
`````


## CLI commands

To easily run CLI commands in the vagrant box from your Kohana project's directory:

````` bash
vagrant ssh_config > ~/.ssh/config
`````

In your `~/.ssh/config` if Vagrant added `Host default` rename it to `Host vagrant`.

Example of bash script that you can add to your project:

````` bash
#!/bin/bash
ssh vagrant "phpcs --standard=Kohana /vagrant/$@"
`````

Run it with:

````` bash
./phpcs application/
`````
