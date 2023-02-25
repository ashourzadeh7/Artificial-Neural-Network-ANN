%%                                              Test a pattern (u)
u=input('Enter test vector: ');
z_in = u*v(1:n,:)+1*v(n+1,:);
for j=1:p
    x1 = z_in(j);
    z_out(j) = eval(f1);
end
y_in = z_out*w(1:p,:)+1*w(p+1,:);
for j=1:m
    x1 = y_in(j);
    y_out(j) = eval(f1);
end
y_out
[C,I]=max(y_out);
y_out_max=zeros(1,m);
y_out_max(1,I)=1;
y_out_max