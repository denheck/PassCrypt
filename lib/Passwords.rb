class Passwords

	def initialize(passHash)
		self.set(passHash)
	end
	
	def add(key, val)
		self.set(Hash[key, val])
	end
	
	def set(passHash)
		begin
			passHash.each do |key, val|
				# if key is string remove spaces and periods and set as instance variable #	
				if key != nil || val != nil
					key = (key.class == String) ? key.gsub(/(\.| )/,'') : key
					instance_variable_set("@#{key}", val)
				end
			end
		rescue Exception => e
			puts "File not found, PassFile instance variables not set. ERROR: #{e}"
		end
	end 
	
	def getPass(key)
		begin
			hash = instance_variable_get("@#{key}")
			puts "Your #{key} password is: \"#{hash['password']}\""
		rescue Exception => e
			puts "Could not get password. ERROR: #{e}"
		end
	end

	def getUser(key)
		begin
			hash = instance_variable_get("@#{key}")
			puts "Your #{key} username is: \"#{hash['username']}\""
		rescue Exception => e
			puts "Could not get username. ERROR: #{e}"
		end
	end	

end
