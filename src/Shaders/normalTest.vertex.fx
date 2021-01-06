// Attribute
attribute vec3 position;
attribute vec3 normal;

uniform mat4 viewProjection;
uniform mat4 world;

varying vec3 vNormalWorld;

void main(void)
{
	gl_Position = viewProjection * world * vec4(position, 1.0);
	vNormalWorld = vec3(world * vec4(normal, 0.0));
}
