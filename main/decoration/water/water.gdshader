shader_type canvas_item;
// https://www.shadertoy.com/view/MclXDB

uniform sampler2D iChannel1: filter_nearest;
uniform vec2 param1 = vec2(0.3, 0.2);
uniform vec2 param2 = vec2(0.4, 0.7);
uniform vec2 param3 = vec2(0.3, 0.1);
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_nearest;

void fragment(){
    vec2 uv = UV;
    vec2 dist = vec2(0.0);
    dist += texture(iChannel1,fract(uv+vec2(TIME*0.2,0.0))).r * param1;
    dist += texture(iChannel1,fract(uv+vec2(TIME*-0.1,TIME*-0.1))).r * param2;
    dist += texture(iChannel1,fract(uv+vec2(TIME*-0.03,TIME*0.2))).r * param3;
    vec3 col = texture(SCREEN_TEXTURE, SCREEN_UV - dist * 0.02 * 1.).rgb;
	float x = dot(normalize(vec3(dist.x,1.0,dist.y)),vec3(0.0,1.0,0.0));
    col += x * x * x * x * x * x  * x * x * x * x * x;
    COLOR = vec4(col,1.0);
}