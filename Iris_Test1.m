%%                                              Test all patterns
R1=zeros(size(B,1),size(B,2));
for i=1:size(A,1)
    z_in = A(i,:)*v(1:n,:)+1*v(n+1,:);
    for j=1:p
        x1 = z_in(j);
        z_out(j) = eval(f1);
    end
    y_in = z_out*w(1:p,:)+1*w(p+1,:);
    for j=1:m
        x1 = y_in(j);
        y_out(j) = eval(f1);
    end
    [C,I]=max(y_out);
    R1(i,I) = 1;
end
R1
%%                                              Test testin patterns
A2=zeros(size(m2,1),size(A,2));
B2=zeros(size(m2,1),size(B,2));
for i=1:size(m2,1)
    A2(i,:)=A(m2(i),:);
end
for i=1:size(m2,1)
    B2(i,:)=B(m2(i),:);
end

R2=zeros(size(B2,1),size(B2,2));
for i=1:size(A2,1)
    z_in = A2(i,:)*v(1:n,:)+1*v(n+1,:);
    for j=1:p
        x1 = z_in(j);
        z_out(j) = eval(f1);
    end
    y_in = z_out*w(1:p,:)+1*w(p+1,:);
    for j=1:m
        x1 = y_in(j);
        y_out(j) = eval(f1);
    end
    [C,I]=max(y_out);
    R2(i,I) = 1;
end
R2