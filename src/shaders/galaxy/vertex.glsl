uniform float uSize;
uniform float uTime;
attribute float aScale;
attribute vec3 aRandomness;


varying vec3 vColor;

 void main(){
        
        vec4 modelPosition = modelMatrix* vec4(position,1.0);

       float angle = atan(modelPosition.x, modelPosition.z);
       float distanceToCenter = length(modelPosition.xz);
       float offsetAngle = uTime/distanceToCenter * .2;
            angle += offsetAngle;
            modelPosition.x = cos(angle) * distanceToCenter;
            modelPosition.z = sin(angle) * distanceToCenter;


// randomness

            //modelPosition.x +=aRandomness.x ;
            //modelPosition.y +=aRandomness.y ;
          // modelPosition.z +=aRandomness.z  ;
          modelPosition.xyz +=aRandomness  ;

        vec4 viewPosition = viewMatrix * modelPosition;
        vec4 projectedPosition =  projectionMatrix * viewPosition;


        gl_Position = projectedPosition;
       
        gl_PointSize = uSize * aScale * ( 1.0/ -viewPosition.z);
       vColor = color;
}