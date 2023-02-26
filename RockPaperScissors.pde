Game game;
ArrayList<Objects> objects=new ArrayList<>();
PImage image1;
PImage image2;
PImage image3;
color c1=color(233,3,233);
color c2=color(3,233,233);
color c3=color(245, 168, 154);
void setup(){
    size(800,800);
    image1=loadImage("rock.jpg");
    image2=loadImage("paper.jpg");
    image3=loadImage("scissor.jpg");

    game=new Game(this);
     for(int i=0;i<100;i++){
         objects.add(new Objects(Type.ROCK));
     }
          for(int i=0;i<100;i++){
         objects.add(new Objects(Type.PAPER));
     }
          for(int i=0;i<100;i++){
         objects.add(new Objects(Type.SCISSOR));
     }
}

void draw() {
    background(0);
    strokeWeight(4);
    for(Objects ob:objects){
        if(ob.type==Type.ROCK){
          stroke(c1);
           fill(c1); 
        }
        else if(ob.type==Type.PAPER){
                    stroke(c2);

          fill(color(c2)); 
        }
        else{
          stroke(c3);

          fill(color(c3)); 
        }
       draw(ob);
       ob.move();
    }
    for(Objects first:objects){
       for(Objects second: objects){
         if(dist(first.x,first.y,second.x,second.y)<=first.z+20){
             if(first.type==Type.ROCK){
               if(second.type==Type.SCISSOR){
                  second.type=Type.ROCK; 
               }
             }
             if(first.type==Type.PAPER){
               if(second.type==Type.ROCK){
                  second.type=Type.PAPER; 
               }
             }
             if(first.type==Type.SCISSOR){
               if(second.type==Type.PAPER){
                  second.type=Type.SCISSOR; 
               }
             }
         }
       }
    }
}  
  public void draw(Objects object){
         String t;
         if(object.type==Type.ROCK){
           t="R";
         }
         else if(object.type==Type.PAPER){
           t="P";
         }  
         else{
           t="S";
         }
             noFill();
             textSize(30);
         circle(object.x,object.y,30);
        text(t,object.x-10,object.y+10,20);
  }
   
