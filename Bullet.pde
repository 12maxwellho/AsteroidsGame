class Bullet extends Floater
{
	Bullet(SpaceShip yeah)
	{
		myCenterX = yeah.getX();
		myCenterY = yeah.getY();
		myPointDirection = yeah.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5*Math.cos(dRadians) + yeah.getDirectionX();
		myDirectionY = 5*Math.sin(dRadians) + yeah.getDirectionY();
	}
	public void show()
	{
		fill(255,0,0);
		stroke(255,0,0);
		ellipse((int)myCenterX,(int)myCenterY,3,3);
	}
	public void move()
	{
		myCenterX+=myDirectionX;
		myCenterY+=myDirectionY;
		if(myCenterY<1 || myCenterY>499 || myCenterX<1 || myCenterX>499)
		{
			bang.remove(this);
		}
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