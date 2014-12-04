class Player

	LIFE = 1000

	attr_reader :life
	def initialize (name)
		@life = LIFE
		@name = name
	end

	def attack (player)	
		attack = @faction.attacks[0...@faction.attacks.length-1]
		player.damage attack.damage unless player.is_dead?		
	end	

	def damage (damage)
		@life -= damage
	end	

	def set_faction (faction)
		@faction = faction
	end

	def to_s
		"name: #{@name} \tlife: #{@life}"
	end

	def is_dead?
		@life <= 0
	end

	protected :damage
end