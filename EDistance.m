%Computes Euclidean distance between two matrices

function d = EDistance(Xin, Yin)


%Finding significant portion 
p=1;
q=1;

for(j=1:1:3800)
  
    %voice detected
    if Xin(j)<0.0001 
      p=j;
    else
      break;
    end
    
end

%cuting significant portion
x=Xin(p:p+4000-1);

for(j=1:1:3800000)
  
    %voice detected
    if Yin(j)<0.0001 
      q=j;
    else
      break;
    end
    
end

%cuting significant portion
y=Yin(q:q+4000-1);


%converting to frequency domain

x=fft(x);

y=fft(y);

[R1, C1] = size(x);
[R2, C2] = size(y); 

if (R1 ~= R2)
    error('Matrix dimensions do not match.')
end


d = zeros(C1, C2);

if (C1 < C2)
    copies = zeros(1,C2);
    for n = 1:C1
        d(n,:) = sum((x(:, n+copies) - y) .^2, 1);
    end
else
    copies = zeros(1,C1);
    for p = 1:C2
        d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';
    end
end

d = d.^0.5;

end