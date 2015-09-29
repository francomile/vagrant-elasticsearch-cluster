
class{ 'java':
  distribution => 'jre',
}

class { 'elasticsearch':
  package_url => 'https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.deb',
  config => { 'cluster.name' => 'es-cluster',
    'network' => {
        'host' => '0.0.0.0',
    }
  }
}

elasticsearch::instance { 'es-01':
  config => { 'node.name' => 'node1' }
}

elasticsearch::plugin{'mobz/elasticsearch-head':
  module_dir => 'head',
  instances => [ 'es-01' ],
}
