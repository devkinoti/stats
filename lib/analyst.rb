require 'data'

class Analyst
	class Config
		@@actions = ['median','mean']

		def self.actions; @@actions; end
	end

	def initialize(path=nil)#could be data from a different lake
		#locate data file for lake pond oreille.txt
		Data.filepath = path

		if Data.file_usable?
			puts "Found Data file"
		else
			puts "Exiting the session"
			exit!
		end
	end

	def launch!
		introduction
		#action loop
		#what do you want to do
		result = nil
		until result == :quit do 
			action = get_action
			result = do_action(action)
	    end
		#do that action
		#repeat until user quits
		conclusion
	end

	def get_action
		action = nil
		until Analyst::Config.actions.include?(action)
			puts "Actions: " + Analyst::Config.actions.join(", ") if action
			print "> "
			user_response = gets.chomp
			action = user_response.downcase.strip
		end
		return action
	end

	def do_action(action)
		case action
		when 'mean'
			
			mean
		when "median"
			puts "Calculating the median..."
			median
		when "quit"
			return :quit
		end
	end

	def mean
		puts "Calculating the mean...".upcase
		
	end

	def median
	end

	def introduction
		puts
		puts "<<< Statistical information of lake pend oreille information >>> "
		puts
		puts "=" * 60
		puts
		puts "Gathering mean and median information for lake data"
		puts
		puts "=" * 60
		puts "Fetching text files from the lake data folder"
		puts
	end

	def conclusion
		puts "\n\n << Analysis complete! Thank you come again >>> \n\n\n"
	end
end


