class PassFile

	attr_reader :passwords

	def initialize(fileName, key)
		if File.exists?(fileName.to_s)			
			@path = _setPath(fileName)
			@fileName = _setName(fileName) 
		else
			puts "File does not exist. Please enter the full path of the encrypted file: "
			file = STDIN.gets.chomp			

			@path = _setPath(file)
			@fileName = _setName(file)
		end
		
		@fileContent = nil
		_setFileContent(key)

		# create instance of Passwords with file contents
		@passwords = FileLoader.loadFile(@path + @fileName, @fileContent)
	end

	private

	def _setFileContent(key)
		begin
			@fileContent = FileCrypt::decryptFile(key)
		rescue Exception => e
			puts "Reading file contents failed, ERROR: #{e}"
		end
	end
	
	def _setPath(name)
		"#{name.split('/')[0..-2].join('/')}/"
	end

	def _setName(name)
		name.split('/').last.to_s
	end
end
