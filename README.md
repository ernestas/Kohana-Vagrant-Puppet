#Kohana-Vagrant-Puppet

Sets up a distributable Vagrant box for Kohana. Uses Puppet provisioning.

## Tutorial

### 1. Add Ubuntu base box to Vagrant

Here you have 3 options:

* Build one yourself with [veewee](https://github.com/jedi4ever/veewee) using [Kohana-Veewee-Template](http://github.com/ernestas/Kohana-Veewee-Template)
* Or use my prebuild box (do it at your own risk):
    * `vagrant box add vagrant-ubuntu-10.04.3-server-i386 http://dl.dropbox.com/u/8700442/vagrant-ubuntu-10.04.3-server-i386.box`
* Or install `libaugeas-ruby` to your base box. Puppet manifests use it.

### 2. Build Kohana box

    git clone https://github.com/ernestas/Kohana-Vagrant-Puppet.git && cd Kohana-Vagrant-Puppet
    git submodule update --init
    vagrant up && vagrant provision
    vagrant package --vagrantfile Vagrantfile.pkg --output vagrant-ubuntu-10.04.3-server-i386-kohana.box
    vagrant box add vagrant-ubuntu-10.04.3-server-i386-kohana vagrant-ubuntu-10.04.3-server-i386-kohana.box


### 3. Use/distribute the built box

In your Kohana project's directory initialize vagrant:

    vagrant init vagrant-ubuntu-10.04.3-server-i386-kohana
    vagrant up

It assumes that `index.php` is in `public` directory. To test the box you can:

	git clone https://github.com/kohana/kohana.git public && cd public && git submodule update --init

and see localhost:8080

## Database config

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
