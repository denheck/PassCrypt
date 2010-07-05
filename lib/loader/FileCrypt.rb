class FileCrypt

	def self.encryptFile(key, fileContent)
		sha1 = Digest::SHA1.new
		key = sha1.update(key).to_s
		
		fish = Crypt::Blowfish.new(key)
		r = StringIO.new(fileContent)
		File.open(PASS_FILE, 'w+') do |f|
			while l = r.read(8) do
				while l.size < 8 do l += "\0" end
				f.print fish.encrypt_block(l)
			end
		end
	end

	def self.decryptFile(key)
		sha1 = Digest::SHA1.new
		key = sha1.update(key).to_s
		
		fish = Crypt::Blowfish.new(key)
		r = StringIO.new
		File.open(PASS_FILE, 'r') do |f|
			while l = f.read(8) do
				r << fish.decrypt_block(l)
			end
		end
		r.string
	end

end
