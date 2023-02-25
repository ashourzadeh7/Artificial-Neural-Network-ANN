clear all
clc
filename = input('Enter filename for loading inputs: ');
A = importdata(filename);
filename = input('Enter filename for loading targets: ');
B = importdata(filename);
%%                                                  Select Random
g=(1:size(A,1))';
h=round((9/10)*numel(g));
a = randperm(numel(g),h);
m1=g(a);
m2=setdiff(g,m1);
A1=zeros(h,size(A,2));
B1=zeros(h,size(B,2));
for i=1:h
    A1(i,:)=A(m1(i),:);
end
for i=1:h
    B1(i,:)=B(m1(i),:);
end
%%                                                  Variables
n = size(A1,2);
p = input('Enter number of neurons in headen layer: ');
m = size(B1,2);
z_in = zeros(1,p);
z_out = zeros(1,p);
y_in = zeros(1,m);
y_out = zeros(1,m);
v = rand(n+1,p)-.5;
w = rand(p+1,m)-.5;
dv = zeros(n+1,p);
dw = zeros(p+1,m);
delta_y = zeros(1,m);
delta_z = zeros(1,p);
deltain_z = zeros(1,p);
alpha = input('Enter Alpha: '); %Learning Rate
epoch = input('Enter number of epochs: ');
syms x1 f1 df1
f1 = (1-exp(-x1))/(1+exp(-x1)); %Activation Function (Sigmoid)
df1 = .5*(1+f1)*(1-f1);
for i=1:epoch
    for j=1:size(A1,1)
        %%                                          Feed-Forward
        z_in = A1(j,:)*v(1:n,:)+1*v(n+1,:);
        for k=1:p
            x1 = z_in(k);
            z_out(k) = eval(f1);
        end
        y_in = z_out*w(1:p,:)+1*w(p+1,:);
        for k=1:m
            x1 = y_in(k);
            y_out(k) = eval(f1);
        end
        %%                                          Back-Propagation
        for k=1:m
            x1=y_in(k);
            delta_y(k)=(B1(j,k)-y_out(k))*eval(df1);
            dw(1:p,k)=alpha*delta_y(k)*z_out';
            dw(p+1,k)=alpha*delta_y(k);
        end
        for k=1:p
            deltain_z(k)=delta_y*w(k,:)';
            x1=z_in(k);
            delta_z(k)=deltain_z(k)*eval(df1);
            dv(1:n,k)=alpha*delta_z(k)*A1(j,:)';
            dv(n+1,k)=alpha*delta_z(k);
        end
        %%                                          Weight Adjustment
        w=w+dw;
        v=v+dv;
    end
end
disp('Done.');