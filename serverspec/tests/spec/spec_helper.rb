require 'serverspec'

require 'type/timezone'

set :backend, :exec
set :path, '/usr/sbin:$PATH'
