set :stage, :staging
server 'tourime.rotato.com', user: 'deployer', roles: %w{app web db}
