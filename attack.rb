class Attack
	attr_reader :name, :damage
	def initialize (name, max_damage)
		@name = name
		@max_damage = max_damage
		#@damage = damage == 0? 0 : Random.rand(0...damage)
	end

	def damage
		@max_damage == 0? 0 : Random.rand(0...@max_damage)
	end
end
