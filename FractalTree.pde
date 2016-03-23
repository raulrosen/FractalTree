private double fractionLength = .8; 
private int smallestBranch = 15; 
private double branchAngle = .4; 
private int branchWeight = 2; 
public void setup() 
{   
	size(640,600);    
	noLoop(); 
} 
public void draw() 
{   
	background(255); 
	stroke(100,100,50); 
	strokeWeight(8);  
	line(320,600,320,500);   
	drawBranches(320,500,100,3*Math.PI/2,10);
} 
public void drawBranches(int x,int y, double branchLength, double angle, int weight) 
{   
	double angle1 = angle+Math.random() - branchAngle;
	double angle2 = angle - branchAngle;
	weight = weight - branchWeight;
	branchLength = branchLength*fractionLength;
	if(weight<1)
	{
		weight = 1;
	}

	int endX1 = (int)(branchLength*Math.cos(angle1)+x);
	int endY1 = (int)(branchLength*Math.sin(angle1)+y);
	int endX2 = (int)(branchLength*Math.cos(angle2)+x);
	int endY2 = (int)(branchLength*Math.sin(angle2)+y);

	strokeWeight(weight);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if(branchLength > smallestBranch){
		drawBranches(endX1, endY1, branchLength, angle1, weight);
		drawBranches(endX2, endY2, branchLength, angle2, weight);
		
	}  
}