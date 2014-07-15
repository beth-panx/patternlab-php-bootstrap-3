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

## Use

Deploy change of .mustache files
    $ fab watch

For sass files, use a compass watch or whatever you want on the source folder.

### Hints if you have trouble with the install

* If you get an error mentionning VT-x, it’s because you need to activate virtualization on your computer through your BIOS.

### If the builder don't work (after a fab deploy)

* Go on the virtual machine with *vagrant ssh*:
* *vagrant@precise64:/project_share/src$* php core/builder.php -g

