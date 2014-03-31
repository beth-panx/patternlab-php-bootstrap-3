# Dependencies

* [The latest VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant >= 1.5](http://www.vagrantup.com/downloads.html)
* Python >= 2.7

## How to install the project on your dev machine

    $ cd tools
    $ virtualenv env
    $ source env/bin/activate
    $ pip install -r requirements.txt
    $ fab deploy

You should be able to view the built patternlab by opening your browser at the
following address: [http://10.0.0.18:8080](http://10.0.0.18:8080)