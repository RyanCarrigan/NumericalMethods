function [L,U,P] = luFactor(A)
%luFactor: Takes the input of a coefficient matrix and from that matrix it
%creats a lower triangular matrix, upper triangular matrix, and a pivot
%matrix in order to solve.
%   Input: 
%       A = coefficient matrix
%   Output: 
%       L = Lower triangular matrix
%       U = Upper triangular matrix
%       P = The pivot matrix

[m,n] = size(A);
% Generating the size of the inputted matrix


if m~=n
    error('The matrix must be a square matrix.')
end
% A quick error check to ensure that the user inputed a correct matrix.

U=A; 
%Making U (the upper triangular matrix) equal to the inputted matrix.

L=eye(n);
%Making L (the lower triangular matrix) equal to an identity matrix

P=eye(n);
%Making P (the pivot) equal to an identity matrix 

%Partial Pivoting for L, U, and P
for a = 1:n %Creating loop to go through each line
    [UnusedVariable, b] = max(abs(U(a:n,a))); %going through the first column and finding the maximum absolute value.
    b = b+a-1; %going through to see if the pivoting element is already at the top
   
    if b~=a %Checking to make sure that the values aren't already in the right order
        PivotU = U(a,:); % sets pivot equal to U
        U(a,:) = U(b,:);  % switches U to have the the largest absolute values
        U(b,:) = PivotU;  % sets the new max to min value matrix equal to the pivot
        
        PivotU = P(a,:); % sets pivot equal to the pivot matrix
        P(a,:)=P(b,:); %switches P to have the largest absolute values 
        P(b,:)=PivotU; %sets the new max to min value matrix equal to the pivot
        
        if a>=2 % need this line because if the square matrix is more than 2x2 the L matrix will need to pivoted as well.
            PivotU = L(a,1:a-1); %sets pivot equal to L
            L(a,1:a-1)=L(b,1:a-1); %switches L to have the value needed to multiply U by for the first pivot first
            L(b,1:a-1)=PivotU; % sets that value equal to the pivoted matrix.
        end
    end
    
    for b=a + 1:n %goes through the matrix to compute the actual values for U and L
        L(b,a)= U(b,a)/U(a,a); % takes U21/U11 to find the values to be put in the correct spots in the L matrix
        U(b,:)= U(b,:)-L(b,a).*U(a,:); % takes those L values, multiplies them out and solves to find the U values for the U matrix.
    end
end
%Displaying the final values for each 
Upper_Triangular_Matrix = U
Lower_Triangular_Matrix = L
Pivot_Matrix = P

    

end

