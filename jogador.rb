require 'gosu'
require 'game'

class Astronautinha
     attr_reader :x, :y

     def initialize(window, x, y)
     @x, @y = x, y
     @dir = :right
     @vy = 0
     @map = window.map
     @parado = Gosu::Image.new(window, "media/AstParado.png", true)
     @andando1, @andando2 = *Gosu::Image.load_tiles(window, "media/AstAndando.png", 35, 50, false)
     @pulando = Gosu::Image.new(window, "media/AstPulando.png", true)
     @imagemdesenhada = @parado
     end

     def draw
          if @dir == :left then
               factor = -1.0
               offs_x = -20.0
          else
               factor = 1.0
               offs_x = 20.0
          end
     @imagemdesenhada.draw(@x - offs_x, @y - 49, 0, factor, 1)
     end

     def would_fit(offs_x, offs_y)
          not @map.solid?(@x + offs_x, @y + offs_y) and
               not @map.solid?(@x + offs_x, @y + offs_y - 49) 
     end

     def update(move_x)
          if (move_x == 0)
               @imagemdesenhada = @parado
          else
               @imagemdesenhada = (Gosu::milliseconds / 300 % 2 == 0) ? @andando1 : @andando2
          end

          if (@vy < 0)
               @imagemdesenhada = @pulando
          end

          if move_x > 0 then
               @dir = :right
               move_x.times do 
                    if would_fit(1, 0) then @x += 1 end 
               end
          end

          if move_x < 0 then
               @dir = :left
               (-move_x).times do
                    if would_fit(-1, 0) then @x -= 1 end 
               end
          end
     
          @vy += 1
          if @vy > 0 then
               @vy.times do
                    if would_fit(0, 1) then @y += 0.8
                    else @vy = 0 
                    end 
               end
          end

          if @vy < 0 then
               (-@vy).times do
                    if would_fit(0, -1) then @y -= 0.8
                    else @vy = 0 
                    end 
               end
          end
     end

     def pular
          if @map.solid?(@x, @y + 1) then @vy = -25 end
     end

     def coletar_combustivel(fuels)          
          fuels.reject! do |combustivel|
               ((combustivel.x - @x).abs < 50 and (combustivel.y - @y).abs < 50)
          end    
     end

     def morrer(spikes)
          spikes.each do |spike|
               if ((spike.x - @x).abs < 10 and (spike.y - @y).abs < 50) then
                    puts "GAME OVER"
                    puts "!"
                    $vida -= 1
               end
          end
     end
end