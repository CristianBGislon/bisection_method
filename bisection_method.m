clear all
close all

%Number of max iterations
n = 100;  
%Acceptable error
eps = 10^(-6);
%Vectors
Y = []; X = []; A = []; B = []; I = [];
%Initial Points
A(1) = 0.6; 
B(1) = 1;
i=1;
I(1)= i;

X(1) = (A(1)+B(1))/2;  
%F(x)
Y(i) = Function(X(i));
while ((i <= n)&&(abs(Function(X(i))) > eps))
  
   %intermediate value theorem
   if ((Function(A(i))*Function(X(i))) < 0)
       A(i+1) = A(i);
       B(i+1) = X(i);  
   else
       A(i+1)= X(i);
       B(i+1) = B(i);
   end      
   i= i+1;
   %Iterations
   I(i) = i;
   X(i) = (A(i)+B(i))/2;  
   %F(x)
   Y(i) = Function(X(i));
   
end
%Complete array
Y(i) = Function(X(i));

%%Plots
subplot(2,1,1)
plot(I,Y)
xlabel('Iteration')
legend('F(Xi)')
subplot(2,1,2)
plot(I,A)
hold on
plot(I,B)
plot(I,X)
hold off
xlabel('Iteration')
legend('A Value','B Value','X Value')


