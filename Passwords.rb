class Passwords

	def initialize(passHash)
		begin
			self.set(passHash)
		rescue => e
			puts "Could not open file. ERROR: #{e}"
		end
	end
	
	def add(key, val)
		self.set(Hash[key, val])
	end
	
	def set(passHash)
		begin
			passHash.each do |key, val|
				# if key is string remove spaces and periods and set as instance variable #
				# TODO: add recursive instance variable setter when loading from a yaml file
				key = (key.class == String) ? key.gsub(/(\.| )/,'') : key
				instance_variable_set("@#{key}", val)
			end
		rescue => e
			puts "File not found, PassFile instance variables not set. ERROR: #{e}"
		end
	end 
	
	def get(key)
		begin
			instance_variable_get("@#{key}")
		rescue => e
			puts "Could not get password. ERROR: #{e}"
		end
	end
	
end