#version 300 es

in vec2 vUV;
in vec4 vWorldPosition;
in vec3 vWorldNormal;

vec3 madd = vec3(0.5);

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

void main(void)
{
	color0 = vec4(normalize(vWorldNormal) * madd + madd, 1.0);
	color1 = vec4(vWorldPosition.xyz / vWorldPosition.w, 1.0);
}