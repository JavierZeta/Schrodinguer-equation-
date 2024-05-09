function [f] = funcion_a_trozos(v,numerovec,energias,a,b)

n=length(v);

f=zeros(n,numerovec);

alpha=zeros(numerovec);

beta=zeros(numerovec);

f_1=cell(numerovec,1);

f_2=cell(numerovec,1);

f_3=cell(numerovec,1);

f_4=cell(numerovec,1);

f_5=cell(numerovec,1);

transicion = 0.05;

contador = 1;

for i=1 : numerovec

    alpha(i)= sqrt(2*(abs(-50)-abs(energias(i))));

    beta(i)=sqrt(2*abs(energias(i)));

    f_1{i}= @(x) 6.1*10^(14)*exp(beta(i).*x);

    f_2{i}= @(x) -6.1*10^(14)*exp(beta(i).*x);

    f_3{i}= @(x) 0.44*cos(alpha(i).*x);

    f_4{i}= @(x) 0.44*sin(alpha(i).*x);

    f_5{i}= @(x) 6.1*10^(14)*exp(-beta(i).*x);

end

for j=1 : numerovec

    for i=1 : n

        if j==1


            if v(i)>=a && v(i)<-5

                f(contador,j)= f_1{j}(v(i));

                contador=contador+1;

            end

            if v(i)>=-5 && v(i)<=5

                f(contador,j)= f_3{j}(v(i));

                contador=contador+1;

            end

            if  v(i)>5 && v(i)<=b

                f(contador,j)= f_5{j}(v(i));

                contador=contador+1;

            end

        end

        if j==2

            if v(i)>=a && v(i)<-5

                f(contador,j)= f_2{j}(v(i));

                contador=contador+1;

            end

            if v(i)>=-5 && v(i)<=5

                f(contador,j)= f_4{j}(v(i));

                contador=contador+1;

            end

            if  v(i)>5 && v(i)<=b

                f(contador,j)= f_5{j}(v(i));

                contador=contador+1;

            end

        end

        if j==3

            if v(i)>=a && v(i)<-5

                f(contador,j)= f_1{j}(v(i));

                contador=contador+1;

            end

            if v(i)>=-5 && v(i)<=5

                f(contador,j)= f_3{j}(v(i));

                contador=contador+1;

            end

            if  v(i)>5 && v(i)<=b

                f(contador,j)= f_5{j}(v(i));

                contador=contador+1;

            end

        end

        if j==4

            if v(i)>=a && v(i)<-5

                f(contador,j)= f_2{j}(v(i));

                contador=contador+1;

            end

            if v(i)>=-5 && v(i)<=5

                f(contador,j)= f_4{j}(v(i));

                contador=contador+1;

            end

            if  v(i)>5 && v(i)<=b

                f(contador,j)= f_5{j}(v(i));

                contador=contador+1;

            end

        end

        if j==5

            if v(i)>=a && v(i)<-5

                f(contador,j)= f_1{j}(v(i));

                contador=contador+1;

            end

            if v(i)>=-5 && v(i)<=5

                f(contador,j)= f_3{j}(v(i));

                contador=contador+1;

            end

            if  v(i)>5 && v(i)<=b

                f(contador,j)= f_5{j}(v(i));

                contador=contador+1;

            end

        end



    end

    contador= 1;

end

end