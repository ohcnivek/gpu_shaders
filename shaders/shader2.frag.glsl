// Automatically provided by three.js
//
// uniform mat4 viewMatrix;
// uniform vec3 cameraPosition;
// uniform bool isOrthographic;

varying vec3 v_normal;
varying vec2 v_texcoord;

uniform vec3 u_color;
uniform sampler2D u_colorTexture;
uniform vec3 u_ambient;

void main() {
    if ((v_texcoord.x-0.85)*(v_texcoord.x-0.85) + (v_texcoord.y-0.85)*(v_texcoord.y-0.85) < (u_ambient.x/.2) * 0.002) {
        discard;
    }
    else if ((v_texcoord.x-0.135)*(v_texcoord.x-0.135) + (v_texcoord.y-0.5)*(v_texcoord.y-0.5) < (u_ambient.x/.2) * 0.005) {
        discard;
    } 
    else if ((v_texcoord.x-0.235)*(v_texcoord.x-0.35) + (v_texcoord.y-0.01)*(v_texcoord.y-0.01) < (u_ambient.x/.2) * 0.06) {
        discard;
    }
    else if ((v_texcoord.x-0.75)*(v_texcoord.x-0.75) + (v_texcoord.y-0.35)*(v_texcoord.y-0.35) < (u_ambient.x/.2) * 0.05) {
        discard;
    }
    else if ((v_texcoord.x-0.02)*(v_texcoord.x-0.02) + (v_texcoord.y-0.35)*(v_texcoord.y-0.35) < (u_ambient.x/.2) * 0.0005) {
        discard;
    }
    else if ((v_texcoord.x-0.92)*(v_texcoord.x-0.92) + (v_texcoord.y-0.95)*(v_texcoord.y-0.95) < (u_ambient.x/.2) * 0.01) {
        discard;
    } 
    else if ((v_texcoord.x-0.42)*(v_texcoord.x-0.42) + (v_texcoord.y-0.95)*(v_texcoord.y-0.95) < (u_ambient.x/.2) * 0.05) {
        discard;
    } else {
        vec3 light = vec3( 0.5, 0.2, 1.0 );
        light = normalize( light );

        // dot product of light and sorface normal
        float dProd = max(0.0,dot( v_normal, light ));

        // calculate a gray scaling value from the texture, using the typical brightness formula of rgb
        vec4 tcolor = texture2D( u_colorTexture, v_texcoord );
        vec4 gray = vec4( vec3( tcolor.r * 0.3 + tcolor.g * 0.59 + tcolor.b * 0.11 ), 1.0 );

        // calculate the diffuse color by multiplying the surface color by the dot product
        vec4 diffuse = vec4( u_color, 1.0 ) * dProd;
        vec4 ambient = vec4( u_ambient, 1.0 );

        // final color is diffuse + ambient * the gray scale of the texture
        gl_FragColor = gray * (diffuse + ambient);
    }
}
