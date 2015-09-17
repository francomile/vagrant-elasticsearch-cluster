
class{ 'java':
  distribution => 'jre',
}

class { 'elasticsearch':
  package_url => 'https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.deb',
  config => { 'cluster.name' => 'es-cluster-talkdesk',
    'network' => {
        'host' => '0.0.0.0',
    }
  }
}

elasticsearch::instance { 'es-02':
  config => { 'node.name' => 'node2' }
}

elasticsearch::plugin{'mobz/elasticsearch-head':
  module_dir => 'head',
  instances => [ 'es-02' ],
}
