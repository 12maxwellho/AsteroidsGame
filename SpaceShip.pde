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