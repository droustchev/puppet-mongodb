# == Class: mongodb::params
#
#
class mongodb::params {

	$repo_class = $::osfamily ? {
		redhat => 'mongodb::repos::yum',
		debian => 'mongodb::repos::apt',
	}

	$server_pkg_name = $::osfamily ? {
		debian  => 'mongodb-10gen',
		redhat  => 'mongo-10gen-server',
	}

	$old_server_pkg_name = $::osfamily ? {
		debian  => 'mongodb-stable',
		redhat  => 'mongodb-server',
	}

	$old_servicename = $::osfamily ? {
		debian  => 'mongodb',
		redhat  => 'mongod',
	}

	$run_as_user = $::osfamily ? {
		debian  => 'mongodb',
		redhat  => 'mongod',
	}

	$run_as_group = $::osfamily ? {
		debian  => 'mongodb',
		redhat  => 'mongod',
	}

	# directorypath to store db directory in
	# subdirectories for each mongo instance will be created

	#TODO: fix bug in template using default even if custom dbpath specified
	$dbdir = '/mnt/part3'

	# numbers of files (days) to keep by logrotate

	$logrotatenumber = 7

	# directory for mongo logfiles

	$logdir = $::osfamily ? {
		debian  => '/var/log/mongodb',
		redhat  => '/var/log/mongo',
	}
}
