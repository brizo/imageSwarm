uniform float focusDistance;
uniform float aperture;
uniform float pointBrightness;
uniform float maxPointSize;

const float PI = 3.14159265;

void main() {
// get the homogeneous 2d position
  gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
// use the distance from the camera and aperture to determine the radius
// the +.5 is because point sizes <1 are rendered differently than those >1

  float size = abs(gl_Position.z - focusDistance) * aperture + 1.;
  size = min(size,maxPointSize);
  gl_PointSize = size;

  gl_FrontColor = gl_Color;
  float radius = size / 2.;
// divide the color alpha by the area
float area =  PI * radius * radius;
  gl_FrontColor.a /= (area * (1.f-pointBrightness));
}