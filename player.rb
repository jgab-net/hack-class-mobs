class Player

	LIFE = 10000

	attr_reader :life, :name
	def initialize (name)
		@life = LIFE
		@name = name
	end

	def attack (player)	
		attack = @faction.attacks[Random.rand(0...@faction.attacks.length-1)]
		unless player.is_dead?
			damage = attack.damage
			player.damage attack.damage	
			puts "#{@name} ataco a #{player.name} con #{attack.name} y causo #{damage} daño, dejando a #{player.name} con #{player.life} puntos de vida"
		end
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