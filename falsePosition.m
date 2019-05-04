function [root,fx,ea,iter] = falsePosition(func,x_l,x_u,es,maxiter)
%falsePosition.m - Calculates the roots of a function from a function,
%upper and lower bounds, the relative error, and the maximum iterations that the user inputs.
%   
%   Inputs: 
%       func = user inputed function
%       x_l = user inputed lower bound
%       x_u = user inputed upper bound
%       es = desired relative error (if user does not input one then defaults
%       to .0001%
%       maxiter = user inputed maximum number of iterations (if user does not
%       input one then defaults to 200

%   Outputs: 
%       root = root of the function
%       fx = function
%       ea = relative error
%       iter = iterations

%making sure that es and maxiter are defined if user does not input a
%value.
if nargin==3
    es = .0001;
    maxiter = 200;
%adding an error if the user does not put in at least three values. 
elseif nargin<3
    error('You must give at least the function, upper bound, and lower bound for this function to work.')
end

if feval(func,x_u)*feval(func,x_l)>0
    error('You must bracket the root.')
end

%setting variables
ea = 1;
x_r = 0;
iter= 0;

format long

while iter < maxiter && ea > es %setting while loop to stop if error drops below the max relative error or the iterations go over the max iterations.
    previous = x_r; %setting a previous estimate
    x_r= [x_u - (feval(func,x_u)*(x_l-x_u))/(feval(func,x_l)-feval(func,x_u))]; %equation for the the iteration.
    iter= iter + 1; %adding to the count after every iteration.
    
    ea = abs((x_r-previous)/x_r)*100; % equation for computing the relative error.
   
    % reassigning either x_u of x_l depending on which which one changes
    % sign.
    if feval(func,x_r)*feval(func,x_u)>0
        x_u=x_r;
    else
        x_l=x_r;
    end
end
% assigning the outputs for function
ea=ea
root=x_r
fx=feval(func,x_r)
end

