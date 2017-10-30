
double T0 = 100;
double Te = 20;
double step = 0.01;
double I,T;
float x;
void setup(){
  size(1000,1000);
  I=0;
  T=Te;
  x=0;
  line(0,500,width,500);
}
void draw(){
  I+=step*I_derivative(T, T0);
  T+=step*T_derivative(I,T,Te);
  ellipse(x, (float)T*5, 2,2);
  ellipse(x, 500+(float)I*10,2,2);
  x+=0.5;
  
}

double I_derivative(double T,double T0){
  double k=0.06;
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