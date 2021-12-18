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

    float color = 1.0;
    int adjust = int(floor(((u_ambient.x) * 15.0)));
    adjust += 5;
    float adjustFloat = float(adjust); // number of squares across as a float 
    float vTexScaledx = floor(v_texcoord.x * adjustFloat);
    float vTexScaledy = floor(v_texcoord.y * adjustFloat);
    bool cond1 = mod(vTexScaledx, 2.0) == 1.0 && mod(vTexScaledy, 2.0) == 0.0; 
    bool cond2 = mod(vTexScaledx, 2.0) == 0.0 && mod(vTexScaledy, 2.0) == 1.0; 

    if (cond1 || cond2) {
        color = 0.0;
    }
    gl_FragColor = vec4(color, color, color, 1.0);

}
