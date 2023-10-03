public class Pipe extends Sprite{
  float gap;
  final static float MOVE = -5;
  
  public Pipe (float scale, float x, float y){
    super("pipe.png", scale, x, y);
    this.change_x = -4;
    this.change_y = 0;
    gap = 120*scale;
  }

  // public Pipe (float scale, float x){
  //  this(scale, x, (float)(Math.random() * height-50) + 25);
  //}
  
  //public Pipe (float scale){
  //  this(scale, width, (float)(Math.random() * height-50) + 25);
  //}
  
  public float getTop(){
    return (this.center_y - (gap/2));
  }
  
  public float getBottom(){
    return (this.center_y + (gap/2));
  }
  

}
