#!/usr/bin/ruby
require 'lib/BootStrap'

# Synopsis:
#
# Used to access password library upon request
# 
#
# Usage: passlib [OPTIONS] ... NAME
#
#  -h, --help:
#	show help
#
#	--get-password name, -p name
#	get password
#
#	--get-username name, -u name
#	get username
#
#	NAME: name of service or system requiring a password

options = {}

def getPassword(name, key)
	passFile = PassFile.new(PASS_FILE, key)
	passFile.passwords.getPass(name)
end

def getUser(name, key)
	passFile = PassFile.new(PASS_FILE, key)
	passFile.passwords.getUser(name)
end

#TODO define changePassword
def changePassword(name, pass)
	
end

#TODO add and define addPassword and addUser

OptionParser.new do |opts|
   # called with the -h or --help option
	opts.banner = "Usage: passlib [OPTIONS] ... NAME"

	opts.on("-p", "--get-password", "Retrieve password"){|p| options[:password] = p }
	opts.on("-u", "--get-user", "Retrieve username"){|u| options[:user] = u }
	opts.on("-c", "--change-password", "Change a password in the library"){|c| options[:changePass] = c }

end.parse!

options.each do |o|
	if o[0]		
		puts "Please enter your password: " 
		key = STDIN.gets.chomp
	end
	case o[0]
		when :password 
			getPassword(ARGV[0], key)
		when :user 
			getUser(ARGV[0], key)
		when :changePass
			changePassword(ARGV[0], key)
	end
end
