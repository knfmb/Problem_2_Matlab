x1 = input('Input the first x coordinate: ');
y1 = input('Input first y coordinate: ');
x2 = input('Input second x coordinate: ');
y2 = input('Input second y coordinate: ');
x3 = input('Input third x coordinate: ');
y3 = input('Input third y coordinate: ');

%Point 1 = (x1,y1)
%Point 2 = (x2,y2)
%Point 3 = (x3,y3)

%Solving the slopes
m12 = (y2-y1)/(x2-x1);
m23 = (y3-y2)/(x3-x2);

%If points are collinear, there is no solution.
if m12 == m23
    error 'There is no solution since the three points are collinear.'
else
    
    %====Systems of equation solving DEF===%
%The equation of the circle is described by the equation
% Ax^2 + Ay^2 + Dx + Ey + F = 0

%Coefficients of A,D,E,F can be determined using determinants.
A = [x1,y1,1;x2,y2,1;x3,y3,1];
D = [(x1^2+y1^2),y1,1;(x2^2+y2^2),y2,1;(x3^2+y3^2),y3,1];
E = [(x1^2+y1^2),x1,1;(x2^2+y2^2),x2,1;(x3^2+y3^2),x3,1];
F = [(x1^2+y1^2),x1,y1;(x2^2+y2^2),x2,y2;(x3^2+y3^2),x3,y3];

a = det(A);
dp = -det(D);
ep = det(E);
fp = -det(F);

%Divide the d,e,f by 'a' to determine 
%the coefficients D,E,F of the general equation.
d = dp/a;
e = ep/a;
f = fp/a;

%Finding the center point (h,k) passing through the 3 points
h = (-dp./(2*a));
k = (-ep./(2*a));

%Find the the radius r of the circle
r = round((sqrt((h-x1)^2 + (k-y1)^2)),2);

%Displaying the center, radius, and vector [D,E,F]
format short
center = round(([h,k]),2);
def = round(([d,e,f]),2);

format short
disp ('The center of the circle (h,k) is at point:');
disp(center);
disp('Radius of the circle: ')
disp(r);
disp ('The vector [D,E,F]:')
disp (def);

end

    

