machine_eps = 1; %creating epsilon
while 1 + (machine_eps/2) > 1 %loop operates until less than 1
    machine_eps = machine_eps / 2; %continually gets smaller
end
fprintf( 'Machine epsilon is %s\n', machine_eps) %printing calculated value
fprintf('The value for machine epsilon the computer has is %s',eps) %showing computers value