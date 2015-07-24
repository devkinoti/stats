class Data
	@@filepath = nil

	attr_accessor :date,:time,:air_temp,:barometric_pressure,:dew_point,:relative_humidity,:wind_direction,:wind_gust,:wind_speed

	def initialize(args={})
		@date                = args[:date] || " "
		@time                = args[:time] || " "
		@air_temp            = args[:air_temp] || " "
		@barometric_pressure = args[:barometric_pressure] || " "
		@dew_point           = args[:dew_point] || " "
		@relative_humidity   = args[:relative_humidity] || " "
		@wind_direction      = args[:wind_direction] || " "
		@wind_gust           = args[:wind_gust] || " "
		@wind_speed          = args[:wind_speed] || " "
	end


	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT,'lib', path)
	end

	def self.file_exists?
		if @@filepath && File.exists?(@@filepath)
			return true
		else
			return false
		end

	end

	def self.file_usable?
		return false unless @@filepath
		return false unless File.exists?(@@filepath)
		return false unless File.readable?(@@filepath)
		return true
	end

	def self.saved_data
		#read data
		data = []
		if file_usable?
			file = File.new(@@filepath,'r')
			file.each_line do |line|
				data << Data.new.import_line(line.chomp)
			file.close
		end
	end



	def import_line(line)
		line_array = line.split("\t")

	end
end