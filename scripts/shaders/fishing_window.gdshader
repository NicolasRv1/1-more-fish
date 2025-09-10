shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0; // fade control
uniform float noise_scale = 100.0;


float rand(vec2 co) {
	return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
	
	// sample static noise based on UV
	float noise_val = rand(floor(UV * noise_scale));
	
	// compare noise vs progress to reveal texture
	float mask = 1.0 - step(progress, noise_val);
	
	if (noise_val < progress) {
		COLOR = vec4(0.0, 0.0, 0.0, 1.0); //solid black pixel
	}
	else {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0); //transparent
	}
	
	COLOR.a *= mask;
}

