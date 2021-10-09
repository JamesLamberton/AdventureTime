varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_Colour;

void main()
{
    vec4 colour = texture2D( gm_BaseTexture, v_vTexcoord );
    colour.rgb *= u_Colour;
    gl_FragColor = v_vColour * colour;
}

