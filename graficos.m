clear all
clc

cd 098008
file_format = "%d %d ; %d ; %d ; %d ; %d ; %d ; %d ; %d ;";
fp = fopen('highest_profits.txt','r');
size_times = [9 Inf];
profits = fscanf(fp,file_format,size_times);
%disp(profits);

for k = 2 : 9   %  por programador
    figure(101);
    title("Profit de 1 a 34 tasks relativamente ao nº de programadores usados");
    ylabel("Profits");
    xlabel("Nº de tarefas executadas");
    plot([1:34], profits(k,:), '-*');
    hold on;
end
hold off;

N = 8;
Legend=cell(N,1);
for iter=1 : N
Legend{iter}=strcat(num2str(iter), ' programadores');
end
legend(Legend)


file_format = "%d %f ; %f ; %f ; %f ; %f ; %f ; %f ; %f ;";
fp = fopen('solution_times.txt','r');
size_times = [9 Inf];
times = fscanf(fp,file_format,size_times);
%disp(times);
x = times(9,:)/60;

%%---------------------------------------------------------------------------------------------

cd ..
cd 098008_v1

file_format = "%d %f ; %f ; %f ; %f ; %f ; %f ; %f ; %f ;";
fp = fopen('solution_times.txt','r');
size_times = [9 Inf];
times2 = fscanf(fp,file_format,size_times);
%disp(times);
y = times2(9,:)/60;

figure(305);
plot([1:34], times(9,:)/60, '-*');
hold on;
plot([1:34], times2(9,:)/60, '-*');
title("Comparação de tempo de execução de 1 a 34 tarefas com 8 programadores usando 2 métodos (recursivo e não recursivo)");
legend("Método não recursivo","Método recursivo");
ylabel("Execution time (minutes) para 8 programadores");
xlabel("Nº de tarefas");
hold off;

fclose(fp);
cd ..
