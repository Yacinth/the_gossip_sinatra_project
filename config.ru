require 'bundler'
Bundler.require

#prendre en compte tous les fichiers dans le dossier lib
$:.unshift File.expand_path("./../lib", __FILE__)

require 'controller'
run ApplicationController

