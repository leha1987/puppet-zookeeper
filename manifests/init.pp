# /etc/puppet/modules/zookeeper/manafests/init.pp

class zookeeper ($server_id) {

	package { 'zookeeper':
                ensure => "installed",
        }	
	

	user { "zookeeper":
                ensure => "present",
                shell => "/bin/bash",
                uid => 123123,
        }    	

	
	file { "/etc/zookeeper/conf/environment":
                ensure => present,
                owner => "zookeeper",
                group => "zookeeper",
                mode => "644",
        }

	
	file { "/etc/zookeeper/conf/zoo.cfg":
		owner => "zookeeper",
		group => "zookeeper",
		mode => "644",
		ensure => present,
		content => template("zookeeper/conf/zoo.cfg"),
  	}

   	
   	file { "/etc/zookeeper/conf/myid":
		ensure => present,
		owner => "zookeeper",
		group => "zookeeper",
		mode => "644",
		content => "$server_id",
	}

	file { "/var/log/zookeeper":
                ensure => present,
                recurse => true,
		owner => "zookeeper",
                group => "zookeeper",
                mode => "644",
        }

}
