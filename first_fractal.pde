
void setup(){
  size(800,800); 
  background(0);
}
class  Pair<T1,T2>{
  T1 x;
  T2 y;
  public Pair(T1 x,T2 y){
    this.x=x;
    this.y=y;
  }
 
}
void drawPointAndRepeat(Pair<Float,Float> pair, int times,ArrayList<Pair<Float,Float>> arr){
  if(times==0){
     return; 
  }

}
ArrayList<Pair<Float,Float>> arr = createTraingle();

Pair<Float, Float> pair = drawPointInsideTraingle(arr.get(0));
void draw(){
  circle(pair.y,pair.x,10);  
  Pair<Float,Float> corner = arr.get((int)random(3));
  Float nx = (corner.x+pair.x)/2;
  Float ny = (corner.y+pair.y)/2;
  fill(nx,ny,0);
  pair = new Pair(nx,ny);
}

ArrayList<Pair<Float,Float>> createTraingle(){
  ArrayList<Pair<Float,Float>> arr = new ArrayList<>();
  Pair<Float,Float> first = new Pair(700.0,100.0);
  arr.add(first);
  Float lengthh = 600.0;
  Pair<Float,Float> second =  moveToRight(first,lengthh);
  Pair<Float,Float> third =  rotate(first,second,lengthh);
  arr.add(second);
  arr.add(third);
  return arr;
  
}

Pair<Float,Float> moveToRight(Pair<Float,Float> first, Float second){
  return new Pair(first.x, first.y+second);
}

Pair<Float,Float> rotate(Pair<Float,Float> first, Pair<Float,Float> second, Float lengthh){
  Float y = (first.y+second.y)/2;
  Float x = first.x - (sqrt(3)/2)*lengthh;
  return new Pair(x,y);
}


Pair<Float,Float> drawPointInsideTraingle(Pair<Float,Float> first){
  
  return new Pair(first.x-10,first.y+10);
}
