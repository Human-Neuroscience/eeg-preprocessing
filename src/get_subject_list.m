function [subject_list] = get_subject_list(cfg)
%% GET_SUBJECT_LIST 
%  If the subject array is not empty, return the original subject array.
%  If the subject array is empty, return all the subjects containded in the
%  BIDS compatible folder.

if isempty(cfg.subjects)
    
    folders = dir([cfg.datapath filesep 'sub*']);
    
    for i = 1 : length(folders)
        subject_list(i).id =  folders(i).name;
        subject_list(i).dir =  [folders(i).folder filesep ...
            folders(i).name filesep 'eeg'];
    end
    
else
    
    for i = 1 : length(cfg.subjects)
        subject_list(i).id = cfg.subjects{i};
        subject_list(i).dir = [ cfg.datapath filesep ...
            cfg.subjects{i} filesep 'eeg'];
    end
    
end

end

