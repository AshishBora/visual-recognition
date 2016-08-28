function estimate = get_affine_estimate(Data)

    % Every row of Data is of the form (x, y, u, v)
    
    n = size(Data, 1);
    A = zeros(2*n, 6);
    b = zeros(2*n, 1);
    for i = 1 : n
        A(2*i-1, 1:2) = Data(i, 1:2);
        A(2*i-1, 5) = 1;
        A(2*i, 3:4) = Data(i, 1:2);
        A(2*i, 6) = 1;
        b(2*i-1:2*i) = Data(i, 3:4)';
    end
    
    estimate = pinv(A)*b;
    
end