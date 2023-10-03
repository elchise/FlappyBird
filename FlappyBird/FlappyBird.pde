final static float GRAVITY = 0.6;
final static float JUMP_SPEED = 15;
final static float MOVE_SPEED = -3;
final static float BETWEEN = 250;

static int highscore = 0;

int score;
boolean gameOver;
Player p;
ArrayList<Pipe> pipes;

void setup(){
  size(800, 600);
  imageMode(CENTER);  
  gameOver = false;  
  score = 0;
  p = new Player("birdNeutral.png", 0.22, 75, 300); 
  pipes = new ArrayList<Pipe>();
  float setY = 300;
  float setX = width;
  for (int i = 0; i < 4; i++){
    pipes.add((new Pipe(1.75, setX, setY)));
    setY = (float)(Math.random() * height - 200 ) + 100;
    setX += BETWEEN;
    pipes.get(i).change_x = MOVE_SPEED;
  }

}

void draw(){
  background(#91DAE8);
  noStroke();
  fill(#62A255);
  rect(0, height-30, width, 30);

  displayAll();
  
  if (!gameOver){
    p.update();
  
    Sprite cur;
    for (int i = 0; i < pipes.size(); i++){
      cur = pipes.get(i);
      cur.update();
      if (cur.center_x < 0){
        score++;
        if(score > highscore){
          highscore = score;
        }
        if (i > 0){
          cur.center_x = pipes.get(i-1).center_x + BETWEEN;
        } else {
          cur.center_x = pipes.get(pipes.size()-1).center_x + BETWEEN;
        }
        cur.center_y = (float)(Math.random() * height - 50) + 25;
        
      }
      
    }
    if (checkCollisionList(p, pipes).size() > 0 || p.getBottom() >= height){
      gameOver = true;        
    }
  } else {
    //game over screen
    textSize(32);
    fill(#000000);
    text("GAME OVER!", 210, 310);
    text("Press SPACE to restart", 210, 340);  
  }

}

void displayAll(){
  p.display();
  for (Sprite pip : pipes){
    pip.display();      
  }
  textSize(28);
  fill(#000000);
  text("Score: " + score, 50, 50);
  text("High Score: " + highscore, 50, 80);
  

}


void keyPressed(){
  if (!gameOver && (key == 'w' || keyCode == UP || key == ' ')){
    p.change_y = -JUMP_SPEED; 
  } else if (gameOver && key == ' '){
    setup();
  }
}

void keyReleased(){
  if (key == 'w' || keyCode == UP || key == ' '){
    p.change_y = 0 ; 
  }
}



boolean checkCollision(Sprite s1, Pipe s2){
  boolean XOverlap = s1.getRight() >= s2.getLeft() && s1.getLeft() <= s2.getRight(); 
  boolean YOverlap = s1.getTop() <= s2.getTop() || s1.getBottom() >= s2.getBottom();
  return XOverlap && YOverlap;
}

ArrayList<Sprite> checkCollisionList(Sprite s, ArrayList<Pipe> list){
  ArrayList<Sprite> colList = new ArrayList<Sprite>();
  for(Pipe pip: list){
    if(checkCollision(s, pip))
      colList.add(pip);
  }
  return colList;
}
