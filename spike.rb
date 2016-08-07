class Spike
	attr_reader :x, :y

	def initialize(imagem, x, y)
		@imagem = imagem
		@x, @y = x, y
	end

	def draw
		@imagem.draw(@x, @y, 0)
	end
end