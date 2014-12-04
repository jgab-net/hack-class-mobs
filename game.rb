load 'admin.rb'

class Game 

	attr_reader :player1, :player2

	def initialize 
		factions = Admin.new.setup
		
		@player1 = Player.new 'pffrff'
		@player1.set_faction(factions[0]);

		@player2 = Player.new 'yii'
		@player2.set_faction(factions[1]);

	end

end