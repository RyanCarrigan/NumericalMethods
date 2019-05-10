function [nd] = days1(mo, da, leap)
%This functrion is used to determine the elapsed days in a year. Months
%must be between 1 and 12, days bust be between 1-31, or 30, or 28
%depending on month, and leap year must be 1 or 0.
months=[31,28,31,30,31,30,31,31,30,31,30,31];
if (mo==2)&&(da>28)&&(leap==0) 
    error('There can not be more than 28 days in February when it is not a leap year.')
elseif (mo==2)&&(da==29)&&(leap==1)
    nd=sum(months(1:mo-1))+da;
    fprintf('%.0f days have elapsed',nd);
elseif ((mo==4)||(mo==6)||(mo==9)||(mo==11))&&(da>30)
    error('There can not be more than 30 days in these months.')
elseif (mo>13)
    error('There are not more than 12 months.')
elseif (da>31)
    error('No month has more than 31 days')
elseif (leap>1)
    error('Leap years only add 1 day so this cannot be greater than 0.')
else
    nd=sum(months(1:mo-1))+da+leap;
    fprintf('%.0f days have elapsed',nd);
end
end
