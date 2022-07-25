
PImage BG= new PImage();
PImage[] Flags = new PImage[7];
Hamilton_cycle[] path = new Hamilton_cycle[7];
float D[] = {0,0,0,0,0,0,0}; int ind_min;
int MP[][] = {{255,380}  // Cristo Redentor (BRAZIL)
             ,{575,236}  // Taj Mahal (INDIA)
             ,{412,179}  // Coliseo Romano (ITALIA)
             ,{667,183}  // Gran Muralla China (CHINA)
             ,{141,247}  // Chichén Itzá (MEXICO)
             ,{173,344}  // Macchu Picchu (PERU)
             ,{466,216}};// Petra (JORDANIA)
void setup(){
  size(800,600);
  BG = loadImage("mapa.jpg");
  Flags[0] = loadImage("Brazil.png");
  for(int i = 0; i < 7; i++){
    path[i] = new Hamilton_cycle(i);
    path[i].calculate_hamilton_less();
    D[i] = path[i].distance;
    println(path[i].distance);
  }
  ind_min = minimal(D);
}

int delay = 20; int mod = delay; int i = 0;
void draw (){
  background(BG);
  draw_all_vertexes();
  draw_all_edges();
  if(delay == 0) i = (i + 1) % 7; 
  delay = (delay - 1) % mod;
  
  path[0].draw_hamilton_less();
  //int C[] = {0,5,4,2,6,3,1,0};
  //draw_path(C);
  
  textSize(28);
  fill(#FFFFFF);
  text("DISTANCIA MINIMA: 1197.3302", 20, 550);
  textSize(28);
  fill(#0B5345);
  text("DISTANCIA MINIMA DEL ALGORITMO V. MAS CERCANO: " + D[0], 20, 580);
  show_settings();
}

void draw_all_vertexes(){
  fill(#FB4949);
  strokeWeight(2);
  stroke(#FFB9B9);
  for(int i = 0; i < 7; i++){
    circle(MP[i][0], MP[i][1], 10);
  }
}

void draw_all_edges(){
  strokeWeight(2);
  stroke(#F1948A);
  for(int i = 0; i < 7; i++){
    for(int j = i + 1; j < 7; j++){
      line(MP[i][0],MP[i][1],MP[j][0],MP[j][1]);
    }
  }
}

int minimal(float []A){
  float min = A[0]; int ind = 0;
    for(int i = 0; i < 7; i++){
      if(min > A[i]){
        ind = i; min = A[i];
      }    
    }
  return ind;
}

void show_settings(){
  if((pow(MP[0][0] - mouseX,2) + pow(MP[0][1] - mouseY,2) <= 12) ){
     image(Flags[0],MP[0][0],MP[0][1],50,35);
  }
}
void draw_path(int []A){
  strokeWeight(4);
  stroke(#0DCD2D);
  for(int i = 0; i < 7; i++){
    line(MP[A[i]][0],MP[A[i]][1],MP[A[i + 1]][0],MP[A[i + 1]][1]);
  }  
}
