#version 150

in vec4 aPosition;
in vec3 aNormal;
in vec3 aColor;
in float aSplatSize;

uniform mat4 uModelViewMatrix;
uniform mat4 uInvTranspModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform float uScaleToScreen;
uniform int uRenderPass;

out vec4 vPosition;
out vec3 vNormal;
out vec3 vColor;
out float vSplatSize;

void main() {

    // Transform points from global to eye-space
    vPosition = uModelViewMatrix * aPosition;

    // =======================================================================
    // =======================================================================
    // Assignment code:
    // Part D:
    // Modify depth based  on uRenderPass
    // =======================================================================
    // =======================================================================
    if(uRenderPass == 1)
	{
		vPosition.z = vPosition.z + 0.1;
	}
    // =======================================================================
    // End assignment code
    // =======================================================================

    // Pass normal, color, and splat size to fragment shader
    // Note: No bi-linear interpolation will be applied
    // since we're rendering points instead of triangles
    vNormal = normalize(vec3(uInvTranspModelViewMatrix * vec4(aNormal, 0.0f)));
    vColor = aColor;
    vSplatSize = aSplatSize;

    // Set the point size to the scaling factor times
    // the real splat size divided by the points depth in
    // eye-coordinates
    gl_PointSize = uScaleToScreen * aSplatSize / vPosition.z;

    // Project point
    gl_Position = uProjectionMatrix * vPosition;
}
