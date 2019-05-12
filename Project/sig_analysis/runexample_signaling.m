% Example for using SoptSC for cell-cell and cluster-cluster
% signaling network inference from single cell data.
%
% After running example (data in example is from Joost paper), 
% run this script for signaling network inference for given pathways
% Tgfb, Wnt and Bmp.


%% Setup  
% save cluster labels to sigfolder
resfolder = 'Results';
sigfolder = [resfolder '/Signaling'];
dlmwrite('Data/cluster_labels.txt', cluster_label)


% Run each section separately or run them all 


%% Wnt: ligand-receptor pairs and their target genes 
Lig = {{'Wnt4'},{'Wnt5b'},{'Wnt6'}};
Rec = {{'Fzd1'},{'Fzd1'},{'Fzd1'}};
Target = {{'Ctnnb1','Lgr5','Runx2','Apc','Ccnd1'},...
        {'Ctnnb1','Lgr5','Runx2','Apc','Ccnd1'},...
        {'Ctnnb1','Lgr5','Runx2','Apc','Ccnd1'}};

% Computing cell-cell interaction probability for given ligand-receptor pairs
[Pidv, Pall] = LR_Interaction(data, allgenes, Lig, Rec, Target);


%%
threshold = 0.1;

plot_sig_network(Pidv,Pall,cluster_label,Lig,Rec,threshold,sigfolder)

%% Write P matrices to file
P_write = Pall;
dlmwrite([sigfolder '/P_all_' Lig{1}{1} '.txt'], P_write, 'delimiter','\t')

for i = 1:size(Pidv,1)
    dlmwrite([sigfolder '/P_' Lig{i}{1} '_' Rec{i}{1} '.txt'], Pidv{i}, 'delimiter','\t')
end


