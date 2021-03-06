#version 150

in vec4 vPosition;
in vec3 vNormal;
in vec3 vColor;
in float vSplatSize;

uniform mat4 uProjectionMatrix;
uniform mat4 uInverseProjectionMatrix;
uniform float uWindowWidth;
uniform float uWindowHeight;
uniform float uNear;
uniform float uFar;

out vec4 oFragColor;

void main() {

    // =======================================================================
    // =======================================================================
    // Assignment code:
    // Part C:
    // =======================================================================
    // =======================================================================
    
	float ndcX = (gl_FragCoord.x/uWindowWidth)*2-1;
	float ndcY = (gl_FragCoord.y/uWindowHeight)*2-1;
	float ndcZ = (gl_FragCoord.z)*2-1;
	vec4 fragNDC = vec4(ndcX,ndcY,ndcZ,1/gl_FragCoord.w);
	
	fragNDC.xyz = fragNDC.xyz*fragNDC.w;
	
	vec4 fragEyeSpace = uInverseProjectionMatrix*fragNDC;
	
	if( abs( dot( ((fragEyeSpace.xyz-vPosition.xyz)),vNormal ) ) < 0.01)
	{
		if(distance(fragEyeSpace,vPosition)>vSplatSize)
		{
			discard;
		}

	}else
	{
		discard;
	}

    // Replace with your code
    oFragColor = vec4(vColor,1);
    
    // =======================================================================
    // End assignment code
    // =======================================================================
}
