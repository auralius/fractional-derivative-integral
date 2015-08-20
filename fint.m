function output = fint(x, alpha, n, h)
% h      Sampling rate
% alpha  Fractional order
% x      Sampled function
% n      Size of the memory

% Please refer to http://www3.nd.edu/~msen/Teaching/UnderRes/FracCalc1.pdf
% See equ. 36
% Read section 4 p. 19: since gamma(z) where z > 172, MATLAB gives inf
% Therefore, the size of memory is limited by  0 < n < 171

N = length(x);
output = zeros(1, N);

h_a = h^alpha;

for i = 1 : N
    sigma = 0;
    for m = 0 : 1 : n
    
    if i - m < 1
        break;
    end
        
        sigma = sigma +  gamma(alpha + m) / (factorial(m) * ...
                gamma(alpha)) * x(i - m);
    end
    
    output(i) = sigma * h_a;
end

end