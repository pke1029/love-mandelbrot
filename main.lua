

function love.load()

	love.window.setTitle("Mandelbrot and Julia set")
	love.window.setMode(600, 600)
	width, height = love.graphics.getDimensions()
	canvas = love.graphics.newCanvas()

	-- load shader
	mandelbrot = love.graphics.newShader("mandelbrot.fs")
	julia = love.graphics.newShader("julia.fs")

	-- set shader
	shader = mandelbrot

end


function love.update(dt)

	frameRate = 1/dt

	if love.mouse.isDown(1) then
		x, y = love.mouse.getPosition()
		shader = julia
		shader:send("c0", {x/width, y/height})
	else
		shader = mandelbrot
	end

end


function love.draw()

	love.graphics.setShader(shader)
	love.graphics.draw(canvas)
	love.graphics.setShader()
	love.graphics.print("Hold down left mouse button for filled Julia set", 10, 10)
	love.graphics.print(string.format("%.0f FPS", frameRate), 10, 22)

end


function love.keypressed(key)

	if key == "space" then
		love.graphics.captureScreenshot(os.time() .. ".png")
	end

end