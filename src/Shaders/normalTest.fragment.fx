varying vec3 vNormalWorld;

void main(void)
{
	gl_FragColor = vec4(normalize(vNormalWorld), 1.0);
}