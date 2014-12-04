class Player

	LIFE = 10000

	attr_reader :life, :name, :faction
	def initialize (name)
		@life = LIFE
		@name = name
	end

	def attack (player)	
		attack = @faction.attacks[Random.rand(0...@faction.attacks.length)]
		unless player.is_dead?
			damage = attack.damage
			player.damage damage
			return "<div class='row'>
			  <div class='col-md-12'>
			    <div class='fight-box'>
			      #{@name} [#{@faction.type}] ataco a #{player.name} [#{player.faction.type}] con #{attack.name} y causo #{damage} daño, dejando a #{player.name} con #{player.life} puntos de vida
			    </div>
			  </div>
			</div>"
			#return "#{@name} [#{@faction.type}] ataco a #{player.name} [#{player.faction.type}] con #{attack.name} y causo #{damage} daño, dejando a #{player.name} con #{player.life} puntos de vida"
		end

		"#{player.name} esta muerto "
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