// Attribute
attribute vec3 position;
attribute vec3 normal;

uniform mat4 viewProjection;
uniform mat4 view;
uniform mat4 world;

varying vec3 vNormalView;

void main(void)
{
	gl_Position = viewProjection * world * vec4(position, 1.0);
	
	vNormalView = mat3(view) * mat3(world) * normal;
}
