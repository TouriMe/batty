# TouriMe
--- something facy text

## HOW TO SETUP
### INSTALL RUBY
1. Open your terminal and 
  ```
    $ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    $ \curl -sSL https://get.rvm.io | bash -s stable
  ```
2. Install Ruby version "2.0.0"
  ``` 
  $ rvm install 2.0.0
  ```

### SOURCE CODE
1. git clone git@github.com:tourime/batty.git
2. install 'postgresql' in your local machine ( if you are on mac, you can use postgres app )
3. create a database called cam_dev
4. copy the `.env.sample` to `.env`, update the credentials accordingly
5. bundle install
6. do migration
  ```
  $ rake db:migrate
  ```
7. Run the server
  ```
  $ rails s
  ```

