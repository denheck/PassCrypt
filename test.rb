#!/usr/bin/ruby

require 'lib/bootstrap.rb'

#passFile = PassFile.new(PASS_FILE, "A key up to 56 bytes long")

key = "asdfasdfas"
fileContent = "test :\n username : testuser\n password : testpassword"

#FileCrypt::encryptFile(key, fileContent)
p FileCrypt::decryptFile(key)


