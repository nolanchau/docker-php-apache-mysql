# PHP-Apache-Mysql Development Environment

### A.Start your development environment with

* Open up terminal (or cmd if you're using Window as OS)
* Change directory to this directory/folder
* Run:

        docker-compose up -d

* Wait till the process is done then you're good now


### B.Extra Configuration

* There are two files: ***conf.ini*** and ***default.conf*** for configuring the php.ini and apace server relatively.

* In case, you want to add more php's extensions, feel free to install those using the **install-php-extension** script which is documented in the ***Dockerfile***.