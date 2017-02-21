set :stage, :staging
server '52.221.23.40', user: 'deployer', roles: %w{app web db}
