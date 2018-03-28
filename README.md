# README


This project keeps track of jobs applicants applied for and also allows companies which jobs applicants had applied for.

* Although earlier versions might work, this project was build using Ruby version 2.5.0, Rails version 5.1.5 and Sinatra

* GEM Dependencies consists of the following:
 #### Production:
   * sinatra-activerecord
   * sqlite3
   * rack
   * require_all
   * bcrypt
   * rack-flash3

 #### Development:
   * pry
   * shotgun
   * thin

  **__For an exhausted list please review the Gemfile file located at the root of the project__**

* Installation:
  Installation is very straightforward.
    - clone the project ```git clone [path]```
    - change directory into the project's directory ``` cd [path] ```
    - run bundler ```bundle install```
    - run shotgun ```shotgun```
    - visit your local host at port 2929 in your browser of choice [http://127.0.0.1:9393/](http://127.0.0.1:9393/)
    * This project uses bootstrap for responsive design on mobile devices

* Database creation
  - Although this project uses sqlite3 it is database agnostic and most database of choice can be changed under the the config's folder ```environment.rb``` file .


* license
  - This Project is cover under the MIT license Agreement.
