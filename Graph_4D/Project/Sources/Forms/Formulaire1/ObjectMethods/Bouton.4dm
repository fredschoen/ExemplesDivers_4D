C_PICTURE:C286(vGraph)  //Variable of graph
ARRAY TEXT:C222(X; 2)  //Create an array for the x-axis
X{1}:="1995"  //X Label #1
X{2}:="1996"  //X Label #2
ARRAY REAL:C219(A; 2)  //Create an array for the y-axis
A{1}:=30  //Insert some data
A{2}:=40
ARRAY REAL:C219(B; 2)  //Create an array for the y-axis
B{1}:=50  //Insert some data
B{2}:=80
//With vType equal to 1, you obtain a Column graph:
vType:=1  //Initialize graph type
GRAPH:C169(vGraph; vType; X; A; B)  //Draw the graph
GRAPH SETTINGS:C298(vGraph; 0; 0; 0; 0; False:C215; False:C215; True:C214; "France"; "USA")  //Set the legends for the graph
TRACE:C157
