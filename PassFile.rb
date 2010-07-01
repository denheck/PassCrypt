require 'FileLoader'

class PassFile

	attr_accessor :passwords

	def initialize(fileName)
		@fileName = fileName.to_s
		@encryptedFileName = "crypt_#{fileName}"
		@passwords = FileLoader.loadFile(fileName)
	end
	
	def saveFile
		self._encryptFile
	end
	
	private
	
	def _encryptFile
		begin
			blowfish = Crypt::Blowfish.new(key)
			blowfish.encrypt_file(@fileName, @encryptedFileName)
		rescue Exception => e
			puts "Encryption failed. ERROR: #{e}"
		end
	end
			
end