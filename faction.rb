class Faction
	attr_reader :attacks

	def initialize (type)
		@type = type
		@attacks = []
	end

	def add_attack (attack)
		@attacks.push(attack)
	end

	def to_s		
		"#{super} \ttype: #{@type}"
	end
end