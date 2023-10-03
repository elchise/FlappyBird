public class Player extends Sprite{
  PImage[] images;
  
  int direction;
  int index;
  int frame;
  
  public Player(String img, float scale, float x, float y){
    super(img, scale, x, y);
    images = new PImage[3];
    images[0] = loadImage("birdUp.png");
    images [1] = loadImage("birdNeutral.png");
    images[2] = loadImage("birdDown.png");
  }
  
  public Player(String img, float scale){
    this(img, scale, 0, 0);
  }
  
  public void update(){
    p.change_y += GRAVITY;
    super.update();
    updateAnimation();
  }
  
  public void updateAnimation(){
    if (change_y > 0){
      image = images[2];
    } else if (change_y < 0){
      image = images[0];
    } else {
      image = images[1];
    }    
  }
  
}
