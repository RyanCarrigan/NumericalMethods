function [I] = Simpson(x,y)
%Simpson: This function uses a combination of simpson's 1/3 method and the
%trapazoidal rule to compute an esimate of the intregral of a functions.
%   Inputs: 
%       y: the values 
%       x: integrated with respect to x
%   Outputs:
%       I: The estimated value of the integral.

%Checking the length of each matrix to make sure that the inputs are the
%same length.
if length(y)~=length(x) 
    error('Your inputs must be the same length.') %Printing error if they are not the same length.
end

%Checking the spacing in the x to make sure that the spacing is equal.
xspacing = range(x(2:end)-x(1:end-1)); %range calculates the difference between the array values. If all are equally spaced the range will be 0.
if xspacing ~= 0
    error('Your x must be equally spaced.') %printing an error if the spacing is not equal.
end

%If statement for using trapazoidal rule. Uses rem to see if there is an odd or even number of intervals.
if rem(length(x),2)==0
    
    % Printing a warning if the trapazoidal rule was used.
    warning('The trapazoidal rule was used.') 
    
    % setting variables
    a=1;
    I=0;
    
    % While loop to run through values
    while a < length(y)-1
        
        %Calculating using simpsons 1/3 and trapazoidal rule
        value =((x(2)-x(1))/3)*(y(a)+4*(y(a+1))+y(a+2));
        %Moving forward two points to do the next set of simpsons iteration
        a=a+2;
        %Saving the first step and adding it to the next step
        I=I+value;
    end
    
    %Doing the trapazoidal rule and adding it to the answer.
    I=I+((y(end)+y(end-1))*(x(end)-x(end-1))/2);
% Else to run if trapazoidal rule not used. Uses rem to see if there is an odd or even number of intervals.   
else rem(length(x),2)~=0
    
    %Setting variables
    a=1;
    I=0;
    
    %While loop to run through values
    while a < length(y)
        
        %Computing using simpsons 1/3 rule
        value =((x(2)-x(1))/3)*(y(a)+4*(y(a+1))+y(a+2));
        %moving forward two to do the next set of simpsons 
        a=a+2;
        %Adding the first step to the next steps
        I=I+value;
    end
end     
end


