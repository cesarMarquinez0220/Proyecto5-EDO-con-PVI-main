clc;
%Titulo del Programa  mtdEDO
fprintf("\t\t\tMETODOS de Euler Mejorado y Runge-Kutta (EDO basados en PVI)\n\n")
%Variable
opcion=0;
clo = 0;
aux = 0;
k1 =0;
k2 =0;
k3 =0;
k4 =0;
%Ingresion de la derivada de la funcion y  demas datos
fprintf("Ingrese la derivada de la funcion, ejemplo: @(x,y) cos(2*x)\n");
dxdy=input('');
h   = input('Ingrese el valor de h: ');
x_n = input('Ingrese el valor de x_0 : ');
y_n = input('Ingrese el valor de y_0 : ');
finx = input('Numero de iteraciones deseadas  : '); 
% Seleccion del tipo de metodo por el que se desea resolver el problema
clc;
fprintf("\n1. Euler Mejorado");
fprintf("\n2. Runge Kutta");
fprintf("\n3. Salir");
fprintf("\n\n-----------\n");
opcion = input('Ingrese la opción requerida: ');

switch (opcion)
    case 1
           
            fprintf('\n \t i     \t    x_i   \t      y_i+1\n');
        fprintf('         _______________________________________________\n'); 
           while (x_n <= finx)
              if(clo ==0)
                 fprintf('\n\t%2i\t %8.4f\t %8.4f \n',clo, x_n, y_n );
              else
               %calculos de las y_n
                    y_n = y_an + (h/2)*( feval(dxdy,x_an,y_an) + feval(dxdy,x_an+h,y_an + h*(feval(dxdy,x_an,y_an))) );
                    
                    fprintf('\n\t%2i\t %8.4f\t %8.4f\t  \n',clo, x_n, y_n );
               endif
            
                if( x_n == finx )
                  fprintf('\ni:   %8i',clo);
                  fprintf('\nx_i:   %8.4f', x_n);   
                  fprintf('\ny_i:   %8.4f\n', y_n);
                endif
                
                clo ++;
                x_an = x_n;
                x_n += h;
                y_an = y_n;
           endwhile
          
    case 2

            fprintf('\n \t i     \t    x_i   \t    k1  \t   k2\t           k3  \t            k4 \t  \t    y_n\n');
        fprintf('         _________________________________________________________________________________________________\n');      
              while ( x_n <= finx )
                  if (clo == 0)
                    fprintf('\n\t%2i\t %8.4f\t \t \t \t \t\t \t                 %8.4f \n',clo, x_n, y_n );
                  else
                    % calculos de las k
                    k1 = feval(dxdy, x_an, y_an);
                    k2 = feval(dxdy, x_an + 0.5 * h, y_an + 0.5 * k1 * h);
                    k3 = feval(dxdy, x_an + 0.5 * h, y_an + 0.5 * k2 * h);
                    k4 = feval(dxdy, x_an + h, y_an + k3 * h);
                    
                    % calculo de las y_n
                    y_n = y_an + h/6*( k1 + 2 * k2 + 2 * k3 + k4 );
                    
                    fprintf('\n\t%2i\t %8.4f\t %8.4f\t %8.4f\t %8.4f\t %8.4f\t %8.4f\t \n',clo, x_n, k1, k2, k3, k4, y_n );
                  endif 
                
                if( x_n == finx )
                  fprintf('\ni:   %8i', clo);
                  fprintf('\nx_i:   %8.4f', x_n);   
                  fprintf('\ny_i:   %8.4f\n', y_n);
                endif
                
                clo ++;
                x_an = x_n;
                x_n += h;
                y_an = y_n;
                
          endwhile
    case 3
        fprintf("Finalizacion del programa");
             %salir
endswitch