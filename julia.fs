
uniform vec2 x0 = vec2(0.75, 0.5);
uniform vec2 c0 = vec2(0.0);
uniform float k = 3.0;
uniform int ITER = 1000;

vec4 effect(vec4 color, Image tex, vec2 uv, vec2 screen_coords){

	// vector transformation
	vec2 z = vec2(uv.x, uv.y);
	z = 4.0 * (z - vec2(0.5, 0.5));
	
	vec2 c = k * (c0 - x0);

	float r;
	vec4 col = vec4(1.0);
	for (int i = 1; i <= ITER; i++){

		z = c + vec2(z.x*z.x - z.y*z.y, 2*z.x*z.y);
		r = sqrt(z.x*z.x + z.y*z.y);
		
		if (r > 2.0){
			col = vec4(1.0, 1-pow(0.9,i), 0.0, 1.0);
			break;
		}
	}

	return col;

}