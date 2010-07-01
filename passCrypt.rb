#!/usr/bin/ruby
#passCrypt.rb <passFile.yaml> <encryptionKey> <splitSize>

require 'rubygems'
require 'crypt/blowfish'
require 'zip/zip'
require 'logger'

log = Logger.new('passCrypt.log')

if ARGV[0] == nil		
	puts "Please enter the password filename"
	passFile = gets.chomp
else
	passFile = ARGV[0].chomp
end

if ARGV[1] == nil
	puts "Please enter key"
	key = gets.chomp
else
	key = ARGV[1].chomp
end

splitsize = ARGV[2] == nil ? 25500 : ARGV[2].chomp.to_i
cryptFile = "crypt_#{passFile.to_str}"

if (File.exists?(passFile))
	begin
		blowfish = Crypt::Blowfish.new(key)
		blowfish.encrypt_file(passFile.to_str, cryptFile)
		log.info{ "#{passFile.to_str} encryption success." }
	rescue Exception => e
		log.error{ "An error occurred during encryption: #{e}" }
	end
else
	log.fatal { "File #{passFile.to_str} does not exist." }
end

quotient, remainder = File.size(cryptFile).divmod(splitsize)
cFile = File.open(cryptFile, "r")
dirName = "#{cryptFile.split('.')[0]}"

Zip::ZipFile.open(dirName, true) {|zf| 
	quotient.times do |n|
		fileName = "#{cryptFile}.#{n}".to_s
		File.open(fileName, "w"){|f| f.puts cFile.read(splitSize)}
		zf.add fileName, fileName
	end

	if remainder > 0
		fileName = "#{cryptFile}.#{quotient}".to_s
		File.open(fileName, "w"){|r| r.puts cFile.read(remainder)}
		zf.add fileName, fileName
	end
}
