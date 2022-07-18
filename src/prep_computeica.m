function prep_computeica(cfg,subject)
%% PREP_COMPUTEICA
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
%  Compute ICA decomposition if needed:

if cfg.ica.flag
    
    fprintf(['\n<strong> > Loading subject: ' subject.id '</strong>\n\n']);
    
    % Directory to load data:
    load_dir = [cfg.datapath filesep 'derivatives' filesep ...
        cfg.epochs.sdir filesep];
    files = dir([load_dir subject.id '*.set']);
    file_name = files(1).name;
    
    % Importa data:
    data = pop_loadset('filename',file_name,'filepath',load_dir);
    
    % Exclude bad channels:
    total_channels = (1 : length(data.chanlocs));
    subject_idx = str2double(subject.id(end-2:end));
    ignoredchannels = cfg.ignoredchannels{subject_idx};
    channels = setdiff(total_channels, ignoredchannels);
    
    fprintf('\n<strong> > Computing ICA decomposition...</strong>\n\n');
    
    % Compute ICA:
    data = pop_runica(data,'icatype',cfg.ica.method,...
        'extended',cfg.ica.extended,'chanind',channels);
    
    % Save data if needed:
    
    if cfg.ica.save
        save_subject_data(cfg,data,cfg.ica.sdir);
    end
    
end

end

