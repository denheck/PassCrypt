require 'lib/loader/FileLoader'
require 'lib/loader/FileCrypt'
require 'lib/PassFile'
require 'lib/Passwords'
require 'rubygems'
require 'yaml'
require 'zip/zip'
require 'logger'
require 'crypt/blowfish'
require 'optparse'
require 'digest/sha1'

PASS_FILE = 'testPass.yaml' 