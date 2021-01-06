#ifdef ALPHATEST
varying vec2 vUV;
uniform sampler2D diffuseSampler;
#endif

varying vec3 vViewPos;

#ifdef PACKED
	#include<packingFunctions>
#endif

void main(void)
{

	gl_FragColor = vec4(vViewPos.z, 0.0, 0.0, 1.0);
}