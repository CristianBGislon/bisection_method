clear all
close all

a = 0.6; 
b = 1;
n = 100;  %Numero max de itera��es
eps = 10^(-6);
F = []; X = []; A = []; B = []; I = [];
i=1;

Xi = (a+b)/2;  
while ((i <= n))
   
   %Intervalos
   A(i)= a;
   B(i)= b;
   %Valor de X
   X(i) = Xi;
   %Valor de F
   F(i) = Funcao(Xi);
   %Itera��es
   I(i) = i;
   
   %Teorema do valor intermedi�rio
   if ((Funcao(a)*Funcao(Xi)) < 0)
       a = a;
       b = Xi;  
   else
       a =Xi;
       b = b;
   end
   i= i+1;
   Xi = (a+b)/2;  

   %Verifica se ja encontrou o zero da fun��o
   if((abs(Funcao(Xi)) <= eps))
       %Intervalos
       A(i)= a;
       B(i)= b;
       %Valor de X
       X(i) = Xi;
       %Valor de F
       F(i) = Funcao(Xi);
       %Itera��es
       I(i) = i;
       
       %Permite sair do loop 
       i= n + 1;
       
   end
  
   %Plot dos gr�ficos
   subplot(2,1,1)
   scatter(X,F)
   hold on
   fplot(@(x)  4*x^3 - 3*x - 0.1 * exp(-x),[0.8 0.9])
   hold off
   grid on
   legend('F(Xk)','Graf F')
   xlabel('Valores de X')
   ylabel('F(x)')
   
   subplot(2,1,2)
   scatter(I,A)
   hold on
   scatter(I,B)
   hold off
   grid on
   legend('Valor de A','Valor de B')
   xlabel('Itera��es')
   %pause
end


