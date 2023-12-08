function P = lagrangepoly(x,y,z)
% x,y = data (stored as vectors)
% z = evaluation point(s)
% P = the lagrange polynomial evaluated at all points in z
    n = length(x);
    P = zeros(size(z));
    
    for k = 1:length(z)
        z_val = z(k);
        P_val = 0;
        for i = 1:n
            Li = 1;
            for j = [1:i-1, i+1:n]
                Li = Li * (z_val - x(j)) / (x(i) - x(j));
            end
            P_val = P_val + y(i) * Li;
        end
        P(k) = P_val;
    end
end