load 'player.rb'
load 'faction.rb'
load 'attack.rb'

class Admin

	def setup 

		attack1 = Attack.new 'dragon punch', 20
		attack2 = Attack.new 'bruce lee kick', 50
		attack3 = Attack.new 'chuck norris stare', 1500

		ninja = Faction.new 'ninja'

		#ninja.add_attack attack0
		ninja.add_attack attack1
		ninja.add_attack attack2
		ninja.add_attack attack3

		attack0 = Attack.new 'no attack', 0
		attack4 = Attack.new 'bite', 500
		attack5 = Attack.new 'step', 1000
		attack6 = Attack.new 'tail whipe', 500

		dinosaur = Faction.new 'dinosaur'

		dinosaur.add_attack attack0
		dinosaur.add_attack attack4
		dinosaur.add_attack attack5
		dinosaur.add_attack attack6

		return ninja, dinosaur

	end

end
