#version 150

in vec4 aPosition;
in vec3 aColor;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;

out vec3 vColor;

void main() {

    // =======================================================================
    // =======================================================================
    // Assignment code:
    // Part A:
    // =======================================================================
    // =======================================================================
    gl_PointSize = 1;  
    vColor = aColor;
	// =======================================================================
    // End assignment code
    // =======================================================================

    // Project point
    gl_Position = uProjectionMatrix * uModelViewMatrix * aPosition;
}
