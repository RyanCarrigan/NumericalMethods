function [nd] = dayscounter(mo,da,leap)
%This functrion is used to determine the elapsed days in a year.
nd = da;
for m=1:mo-1
    switch m
        case(1, 3,, 5, 7, 8, 10, 12)% months with 31 days
        nd=nd+31;
    case (4 ,6, 9, 11) %months with 30 days
        nd = nd+30;
    case (2)
        if leap = yes %February with leap year
            nday= nd+29;
        else %February without leap year
            nday= nd+28;
        end
    end
end
    
end

