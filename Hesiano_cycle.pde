class Hamilton_cycle{
  int ind;
  int I[] = {0,0,0,0,0,0,0,0};
  int C[] = {0,0,0,0,0,0,0};
  float distance = 0;
  Hamilton_cycle(int ind){
    this.ind = ind;  
  }
  
  void calculate_hamilton_less(){
    C[ind] = 1; I[0] = ind;
    int pivot = I[0];  I[7] = ind;
    for(int j = 0; j < 6; j++){
      int aux = pivot;  float min = 800;
      for(int i = 0; i < 7; i++){
        if(C[i] == 0 && (distance(pivot,i) < min)){
          aux = i;  min = distance(pivot,i);
        }
      }
      pivot = aux; C[pivot] = 1; I[j + 1] = pivot;
      distance += min; 
    }
    distance += distance(I[6],I[7]);
  }
  
  void draw_hamilton_less(){
    strokeWeight(4);
    stroke(#0DCD2D);
    for(int i = 0; i < 7; i++){
      line(MP[I[i]][0],MP[I[i]][1],MP[I[i + 1]][0],MP[I[i + 1]][1]);
    }  
  }
  
  float distance(int i, int f){
    return sqrt(pow(MP[i][0] - MP[f][0],2) + pow(MP[i][1] - MP[f][1],2));} 
  }
