function [HGN] = hologn_encoder(seeds,d,IHV)
% Generate a distributed representation for the image  
% 
%
% DESCRIPTION
%   Creates distributed representation for a image 
%   
%   Input:
%       seed  pattern to be represented by HD vector
%              
%
%   Output:
%       HD holographic representation of the activated elements   
%           
%

%

%Set the dimensionality of HD-vectors
d=10000;

%Number of seeds is determined by the legnth of the input pattern
numseed=size(seeds,2);

%Initialize an array of initialization high-dimensional vectors for every
%seed

%An array for shifted initialization HD-vectors
E=[]; 

%For every seed shift initialization HD-vectors in the value activated in the GN
for i=1:numseed
E(end+1,:)=circshift(IHV(i,:), [0 seeds(1,i)]);   
end

%Create HGN representation by majority sum on E
HGN=majority_sum(E);


end

