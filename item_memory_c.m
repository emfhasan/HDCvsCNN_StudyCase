function [ decoded ] = item_memory_c(vector, memory )
%
% DESCRIPTION
%   findthe closest vector in associative memory and outputs corresponding
%   value.
%
%   Input:
%       vector  vector to be recalled
%       memory  item memory of HD representation for classes      
%
%   Output:
%       decoded index in AM, which HD-vector has the smallest Hamming   
%           distance with the input vector
%

    % Hamming distances between the input and the values in AM
    HD = pdist2(memory,vector','hamming');
    
    % Index of the closest vector in AM
     [v,decoded]=min(HD);


end

