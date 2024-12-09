function varagout=landmark_visualize()
%this function prepares data for visualization in matchgui. 
%It is for use only to for the data published by Criscuolo et al., it is not meant to be generalized for other registration applications
if isfile('img1.mat')==0 ||isfile('img2.mat')==0 ||isfile('example_landmarks.mat')==0
    error(['Please make sure the working directory is set to the folder containing the tutorial data. ' ...
        'To load any image pair from the dataset, please refer to the instructions on our GitHub'])
else
    load('img1.mat');
    load('img2.mat');
    load('example_landmarks.mat');
end


    
    num_landmarks=length(landmarks1);
    landmark_pairs= [(1:num_landmarks)' landmarks1 ones(num_landmarks,1) landmarks2 ones(num_landmarks,1) ones(num_landmarks,1)];
    matchgui(img1,img2,'landmarks',landmark_pairs,'windowcenter',1000,'windowwidth',300,'ratio',voxelsize1);
end
