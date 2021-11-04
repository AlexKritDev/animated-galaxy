
varying vec3 vColor;

void main(){

float strength = distance(gl_PointCoord, vec2(.5));
//strength = step(0.5,strength);
//strength = 1.0 - strength;
strength = 1.0 - strength;
strength = pow(strength, 10.0);

vec3 colorMix =mix(vec3(0.0),vColor,strength);
gl_FragColor = vec4(vec3(colorMix), 1.0);
}