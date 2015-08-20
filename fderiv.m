function output = fderiv(x, alpha, n, h)
% h      Sampling rate
% alpha  Fractional order
% x      Sampled function
% n      Size of the memory
%
% Please refer to http://www3.nd.edu/~msen/Teaching/UnderRes/FracCalc1.pdf
% See equ. 32

N = length(x);
output = zeros(1, N);

h_a = h^alpha;

for i = 1 : N
    sigma = 0;
    for m = 0 : 1 : n
    
    if i - m < 1
        break;
    end
        
        sigma = sigma + (-1)^m * gamma(alpha + 1) / (factorial(m) * ...
                gamma(alpha - m + 1)) * x(i - m);
    end
    
    output(i) = sigma / h_a;
end

end