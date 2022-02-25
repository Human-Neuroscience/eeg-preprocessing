function save_subject_data(cfg,data,sdir)
%% SAVE_SUBJECT_DATA
%  This function saves an EEG dataset in the specified folder and format.

fname = data.subject.filename;
sdir = [cfg.datapath filesep 'derivatives' filesep sdir filesep];
mkdir(sdir);

if strcmp(cfg.saveformat,'set') || strcmp(cfg.saveformat,'both')
    
    data = pop_saveset(data, 'filename',fname,'filepath', sdir);
    
end
    
if strcmp(cfg.saveformat,'mat') || strcmp(cfg.saveformat,'both')
    
    save([sdir filesep fname],'data');
    
end
    
end

