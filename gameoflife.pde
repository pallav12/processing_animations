int dim = 100;
boolean pause = false;
ArrayList<ArrayList<Integer>> arr = new ArrayList();
void setup(){
  size(600,600);
  for(int i=0;i<dim+1;i++){
     arr.add(new ArrayList<Integer>(dim)); 
     for(int j=0;j<dim+1;j++){
        arr.get(i).add(0);
     }
  }
}

void draw(){
  background(255);
  
  drawVerticalGrid(dim);
  drawHorizontalGrid(dim);
  updateAndApplyRules();
  int fracx= height/dim;
  int fracy = width/dim;
  if(mouseX>0 && mouseX<width && mouseY>0 && mouseY<height){
    arr.get(mouseX/fracx).set(mouseY/fracy,1);
  }
  if(pause){
     return; 
  }
  createMatrix();
}

void keyPressed(){
   if(key=='p'){
     pause = !pause;
   }
}

void mouseClicked() {

}
void drawHorizontalGrid(int dim){
  float fac = width/dim;
  for(int i=0;i<dim;i++){
    line(0,fac*i,height,fac*i);
  }  
}

void drawVerticalGrid(int dim){
   float fac = height/dim;
   for(int i=0;i<dim;i++){
      line(fac*i,0,fac*i,width); 
   }
}
void updateAndApplyRules(){
  int diffx=height/dim;
  int diffy = width/dim;
  for(int i=0;i<dim;i++){
     for(int j=0;j<dim;j++){
       fill(0);
        if(arr.get(i).get(j)==1){
           rect(i*diffx,j*diffy,diffx,diffy);
        }
        fill(255);
     }
  }
}

void createMatrix(){
  int[][] dir = {{0,1},{0,-1},{1,0},{1,1},{1,-1},{-1,0},{-1,-1},{-1,1}};
  ArrayList<ArrayList<Integer>> brr = new ArrayList();

  for(int i=0;i<dim+1;i++){
     brr.add(new ArrayList<Integer>(dim)); 
     for(int j=0;j<dim+1;j++){
        brr.get(i).add(0);
     }
  }
  for(int i=0;i<dim+1;i++){
     for(int j=0;j<dim+1;j++){
        brr.get(i).set(j,arr.get(i).get(j));
     }
  }
  
  for(int i=0;i<dim;i++){
     for(int j=0;j<dim;j++){
         int ans = 0;
         for(int k=0;k<8;k++){
            ans+=arr.get(max(i+dir[k][0],0)).get(max(j+dir[k][1],0)); 
         }
         if(arr.get(i).get(j)==1 && (ans==2 || ans==3)){
            continue; 
         }
         if(arr.get(i).get(j)==0 && ans==3){
            brr.get(i).set(j,1); 
            continue;
         }
         brr.get(i).set(j,0);
     }
  }
    for(int i=0;i<dim+1;i++){
     for(int j=0;j<dim+1;j++){
        arr.get(i).set(j,brr.get(i).get(j));
     }
  }
}
