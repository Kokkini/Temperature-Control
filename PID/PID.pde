
double T0;
double Te = 20;
double step = 0.01;
double I,T, integral, proportional;
float x;
float dot = 0.3;
void setup(){
  size(1000,1000);
  I=0;
  T=Te;
  T0=Te;
  x=0;
  line(0,500,width,500);
  integral=0;
}
void draw(){
  proportional = 10*(T0-T);
  integral+=step*I_derivative(T, T0);
  I = proportional+integral;
  T+=step*T_derivative(I,T,Te);
  ellipse(x, (float)T*5,dot,dot);
  ellipse(x, 500+(float)I*10,dot,dot);
  ellipse(x, (float)T0*5,dot,dot);
  x+=dot;
  if(T0<100){T0+=0.1;}
  
}

double I_derivative(double T,double T0){
  double k=1;
  return k*(T0-T);
}

double P_in(double I){
  double R = 1;
  return R*I*I;
}

double P_out(double T, double Te){
  double k =1;
  return k*(T-Te);
}

double T_derivative(double I, double T, double Te){
  double k = 1;
  double P_in = P_in(I);
  double P_out = P_out(T,Te);
  return k*(P_in-P_out);
}