//your variable declarations here
SpaceShip yeah = new SpaceShip();
Star[] stars = new Star[200]; 
Asteroid[] aster = new Asteroid[10];
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;
boolean hitCheck = false;
public void setup() 
{
  size(500,500);
  for(int i = 0;i<stars.length;i++)
  {
    stars[i] = new Star();
  }
  for(int i = 0;i<aster.length;i++)
  {
    aster[i] = new Asteroid();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0;i<stars.length;i++)
  {
    stars[i].show();
  }
  yeah.show();
  yeah.move();
  for(int i = 0;i<aster.length;i++)
  {
     aster[i].show();
     aster[i].move();
  }
}
public void keyPressed()
{
  if(key=='w'){up = true;}
  if(key=='s'&&!(yeah.getDirectionX()==0 || yeah.getDirectionY()==0)){down = true;}
  if(key=='a'){left = true;}
  if(key=='d'){right = true;}
  if(key=='e'){
    yeah.setX((int)(Math.random()*501)); 
    yeah.setY((int)(Math.random()*501));
    yeah.setDirectionX(0);
    yeah.setDirectionY(0);
    yeah.setPointDirection((int)(Math.random()*360));}
  if(up==true){yeah.accelerate(0.5);}
  if(down==true){yeah.accelerate(-1);}
  if(left==true){yeah.setPointDirection((int)yeah.myPointDirection-15);}
  if(right==true){yeah.setPointDirection((int)yeah.myPointDirection+15);}
}
public void keyReleased()
{
  if(key=='w'){up = false;}
  if(key=='s'){down = false;}
  if(key=='a'){left = false;}
  if(key=='d'){right = false;}
}
class Star
{
    private int myX; int myY;
    public Star()
    {
      myX = (int)(Math.random()*500);
      myY = (int)(Math.random()*500);
    }
    public void show()
    {
      fill(255);
      stroke(255);
      ellipse(myX,myY,2,2);
    }
}

class SpaceShip extends Floater  
{  
  SpaceShip()
  {
    corners = 6;
    int[] xS = {12,-6,-7,0,-7,-6};
    int[] yS = {0,-10,-9,0,9,10};
    xCorners = xS;
    yCorners = yS;
    myColor = color(127,255,0);
    myCenterX = 250; 
    myCenterY = 250;
    myDirectionX = 0; 
    myDirectionY = 0;
    myPointDirection = 270;
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
}
class Asteroid extends Floater
{
  private int rotSpeed;
  Asteroid()
  {
    corners = 6;
    int[] xS = {(int)(Math.random()*30)+5, (int)(Math.random()*30)+5, (int)(Math.random()*30)-35, (int)(Math.random()*30)-35, (int)(Math.random()*30)-35, (int)(Math.random()*30)+5};
    int[] yS = {0, (int)(Math.random()*30)-35, (int)(Math.random()*30)-35, 0, (int)(Math.random()*30)+5, (int)(Math.random()*30)+5};
    xCorners = xS;
    yCorners = yS;
    myColor = color(200);
    myCenterX = (int)(Math.random()*500); 
    myCenterY = (int)(Math.random()*500);
    myDirectionX = Math.random()*2-1; 
    myDirectionY = Math.random()*2-1;
    myPointDirection = 270;
    rotSpeed = (int)(Math.random()*6)-3;
    if(rotSpeed == 0)
    {
      rotSpeed = (int)(Math.random()*3)+1;
    }
  }
  public void move()
  {
    myPointDirection = myPointDirection + rotSpeed;
    super.move();
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

