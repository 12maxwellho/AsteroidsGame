class Stalker extends Floater
{
	Stalker()
	{
		corners = 0;
    	myColor = color(255,0,0);
    	myCenterX = 250; 
    	myCenterY = 520;
    	myDirectionX = 0; 
    	myDirectionY = 0;
    	myPointDirection = 270;
	}
	public void show()
	{
		fill(255,0,0);
		stroke(0);
		ellipse((float)myCenterX,(float)myCenterY,20,20);
	}
	public void move()
	{
		if(myCenterX>yeah.getX())
		{
			myCenterX--;
		} else {
			myCenterX++;
		}
		if(myCenterY>yeah.getY())
		{
			myCenterY--;
		} else {
			myCenterY++;
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