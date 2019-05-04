n=1; %creating n
while n-0> 0 %having it as n is greater than 0 so that when it dips below the while loop stops.
    n=n/2; %continually gets smaller
    if n/2-0==0 %determining if number is equal to 0
        disp(n) %showing the number
        break %just incase this goes to long
    end
end
