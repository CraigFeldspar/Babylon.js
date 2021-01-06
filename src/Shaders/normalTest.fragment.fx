varying vec3 vNormalView;

void main(void)
{
	gl_FragColor = vec4(vNormalView, 1.0);
}