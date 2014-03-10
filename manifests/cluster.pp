# /etc/puppet/modules/zookeeper/manifests/master.pp

class zookeeper::cluster ($server_id) {

    class {'zookeeper':
        server_id => $server_id,
    }

    exec { "Launch zookeeper":
        command => "./zkServer.sh start",
	logoutput => "true",
        user => "zookeeper",
	group => "zookeeper",
        cwd => "/usr/share/zookeeper/bin",
	path    => ["/bin", "/usr/bin", "/usr/share/zookeeper/bin", "/usr/share/java", "/usr/bin/java"],
    }

		
 
}

