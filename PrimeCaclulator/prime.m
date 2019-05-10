%% Prime Number Calculator 
% By: Ryan Carrigan
% Created: 11/26/2018
% Description: The user inputs 2 seperate number and the function
% calculates all the prime numbers between the user inputs.

function pr = prime(m,n)
%Description: The user inputs two integers and all prime numbers bwteeen
%the two integers are output. 
% Input parameters: 
%   m = positive integer
%   n = posititve integer > m
% Outputs: all prime numbers between m and n

%Error checking for n<m, decimals, and negative values.
    if n<m 
        error('The value of n must be larger than the value of m.')
    elseif floor(m)~=m
        error('The input argument must be a positive integer.')
    elseif floor(n)~=n
        error('The input argument must be a positive integer.')
    elseif n<0
        error('The input argument must be a positive integer.')
    elseif m<0
        error('The input argument must be a posititve integer.')
    end 
 % making pr a vector
    pr=[];
% l is all values between n and m
    for l = m:n
        if l == 2 
            pr = [pr,l];
        end
        % divides l values by 2 all the way through l-1.
        for k = 2:l-1
            if rem(l,k) == 0 % finding remainder
                break
            elseif k == l-1 % places l in vector is l is a prime number. 
                pr = [pr,l];
            end
        end
    end % ending all the loops. 
end