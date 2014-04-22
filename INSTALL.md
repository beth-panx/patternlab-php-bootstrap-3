# PatternLab + bootstrap 3

## Dependencies for your dev machine

* [The latest VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant >= 1.5](http://www.vagrantup.com/downloads.html)
* Python 2.7

## How to install the project on your dev machine

    $ cd tools
    $ virtualenv venv
    $ source venv/bin/activate
    $ pip install -r requirements.txt
    $ fab deploy

You should be able to view our intranet by opening your browser at the
following address: [http://10.0.0.18](http://10.0.0.18)