set :stage, :staging
server '54.169.18.241', user: 'deployer', roles: %w{app web db}
