class Faction
	attr_reader :attacks, :type, :armors_allowed

	def initialize (type)
		@type = type
		@attacks = []
		@armors_allowed = []
	end

	def add_armor (armor)
		@armors_allowed.push armor
	end

	def add_attack (attack)
		@attacks.push attack
	end

	def to_s		
		"#{super} \ttype: #{@type}"
	end
end