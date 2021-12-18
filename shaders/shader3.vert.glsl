// Automatically provided by three.js
//
// uniform mat4 modelMatrix;
// uniform mat4 modelViewMatrix;
// uniform mat4 projectionMatrix;
// uniform mat4 viewMatrix;
// uniform mat3 normalMatrix;
// uniform vec3 cameraPosition;
// uniform bool isOrthographic;
// attribute vec3 position;
// attribute vec3 normal;
// attribute vec2 uv;

// interpolate the normal and texture coordinates across the surface
varying vec3 v_normal;
varying vec2 v_texcoord;

void main() {
    v_normal = mat3(normalMatrix) * normal;
    v_texcoord = uv;

    vec3 new_position = vec3(position.x, position.y, position.z + sin(position.x));
    vec3 newNormal = normalize(vec3(-cos(position.x),  1.0, position.z));
    v_normal = newNormal;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( new_position, 1.0 );
}
