class Attack
	attr_reader :damage
	def initialize (name, damage)
		@name = name
		@damage = 0...damage
	end
end