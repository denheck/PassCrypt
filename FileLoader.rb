require 'yaml'
require 'Passwords'

# Used to process password files. (class methods only)

class FileLoader

        def self.loadFile(fileName)
                begin
                        fileType = fileName.split('.').last

                        if fileType == 'yaml'
                                return self.loadYaml(fileName)
                        else
                                raise Exception.new("Unknown file type")
                        end

                rescue Exception => e
                        puts "Could not load file. ERROR: #{e}"
                end
        end

        def self.loadYaml(fileName)
                begin
                        fileHash = YAML::load(File.open(fileName))
                        return Passwords.new(fileHash)
                rescue => e
                        puts "Yaml file failed to load. ERROR: #{e}"
                end
        end


end

