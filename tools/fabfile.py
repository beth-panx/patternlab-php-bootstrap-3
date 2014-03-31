# coding: utf-8
from __future__ import unicode_literals

import os.path as op
from fabric.api import env, local, task, cd, run

env.use_ssh_config = True
env.roledefs['vagrant'] = ["vagrant@10.0.0.18"]

if not env.roles:
    print "Pas de rôle spécifié, vagrant par defaut"
    env.roles = ['vagrant']

role = env.roles[0]


def add_ssh_key():
    """
    Le user "vagrant" d'une machine vagrant utilise une clé privée bidon qu'il
    faut ajouter à SSH
    """
    if role == 'vagrant':
        if not op.exists(op.expanduser('~/.ssh/config')):
            print(
                " ".join([
                    "Votre fichier ~/.ssh/config n'existe pas et doit exister",
                    "pourque la prochaine commande fonctionne.",
                    "Creation d'une config lambda."
                ])
            )
            with open(op.expanduser('~/.ssh/config'), 'wt') as fp:
                fp.write("IdentityFile ~/.ssh/id_rsa")
        local(
            'ssh-add %s' % op.expanduser('~/.vagrant.d/insecure_private_key')
        )


@task
def build():
    """
    Creates the viewable website
    """
    with cd("/project_share/src/"):
        run("php core/builder.php -g")


@task
def watch():
    """
    watches for changes in the source code
    """
    with cd("/project_share/src/"):
        run("php core/builder.php -w")
        # TODO: add grunt watch


@task
def deploy():
    """
    Build the whole work environment
    """
    add_ssh_key()
    local("vagrant up")
    build()
