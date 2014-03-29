#
# Cookbook Name:: couchpotato
# Attributes:: default
#

default["couchpotato"]["user"] = 'couchpotato'
default["couchpotato"]["group"] = 'couchpotato'

default["couchpotato"]["directories"]["install"] = '/opt/couchpotato'
default["couchpotato"]["directories"]["logs"] = '/var/log/couchpotato'
default["couchpotato"]["directories"]["config"] = '/etc/couchpotato'
default["couchpotato"]["directories"]["data"] = '/etc/couchpotato/data'

default["couchpotato"]["git"]["url"] = "https://github.com/RuudBurger/CouchPotatoServer.git"
default["couchpotato"]["git"]["tag"] = "master"
