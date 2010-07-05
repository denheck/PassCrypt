# Used to process password file contents. (class methods only)
# File extension determines how it will get loaded

class FileLoader

	def self.loadFile(fileName, fileContents)
   	begin
      	fileType = fileName.split('.').last

         if fileType == 'yaml'
         	return self.loadYaml(fileContents)
         else
         	raise Exception.new("Unknown file type")
         end

      rescue Exception => e
      	puts "Could not load file. ERROR: #{e}"
      end
	end

	# TODO make sure this will work with file contents as well
   def self.loadYaml(fileContents)
      begin
      	fileHash = YAML::load(fileContents)
         return Passwords.new(fileHash)
      rescue => e
      	puts "Yaml file failed to load. ERROR: #{e}"
   	end
   end

	#TODO add JSON support
	def self.loadJson
	end

	#TODO add XML support
	def self.loadXml
	end

end

