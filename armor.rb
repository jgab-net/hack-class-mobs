class Armor
	attr_accessor :name, :value, :type

	def initialize (name, type, value)
		@name = name
		@type = type
		@value = value
	end
end