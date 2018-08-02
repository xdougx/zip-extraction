require 'zip'

class Extractor
  def self.extract path, dest_file
    Zip::File.open(path) do |zip_file|
      # Handle entries one by one
      path = File.expand_path("tmp/zip_#{Time.now.strftime("%Y%m%d%H%M%S")}")
      Dir.mkdir(path) unless File.exists?(path)

      zip_file.each do |entry|
        next if entry.name.match /MACOSX/ 

        puts "Extracting #{entry.name}"
        if entry.name_is_directory?
          Dir.mkdir("#{path}/#{entry.name}")
        else
          File.open("#{path}/#{entry.name}", 'w') {|f| f.write(entry.get_input_stream.read) }
        end
      end
    end
    puts "done"
  end
end
