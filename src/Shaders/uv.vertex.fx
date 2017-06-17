#version 300 es

// Attribute
in vec3 position;
in vec3 normal;
in vec2 uv;
#include<bones300Declaration>

// Uniform
#include<instances300Declaration>

uniform mat4 viewProjection;

out vec2 vUV;
out vec4 vWorldPosition;
out vec3 vWorldNormal;

void main(void)
{
#include<instancesVertex>

#include<bonesVertex>
	gl_Position = vec4(uv * 2.0 - 1.0, 0.0, 1.0);
	vUV = uv;
	
	// World space
	vWorldNormal = normalize(vec3(finalWorld * vec4(normal, 0.0)));
	vWorldPosition = finalWorld * vec4(position, 1.0);
}