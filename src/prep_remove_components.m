function prep_remove_components(cfg,subject)
%% PREP_REMOVE_COMPONENTS 
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
% This function removes the identified artifactual components after ICA
% decomposition:

if cfg.ica.badcomponents.flag
    
    fprintf(['\n<strong> > Loading subject: ' subject.id '</strong>\n\n']);
    
    % Directory to load data:
    load_dir = [cfg.datapath filesep 'derivatives' filesep ...
        cfg.ica.sdir filesep];
    files = dir([load_dir subject.id '*.set']);
    file_name = files(1).name;
    
    % Select subject idx:
    subject_idx = str2double(subject.id(end-2:end));
    
    % Importa data:
    data = pop_loadset('filename',file_name,'filepath',load_dir);
    
    fprintf('\n<strong> > Removing artifuactual ICA components...</strong>\n\n');
    
    % Delete bad components:
    data = pop_subcomp(data,cfg.ica.badcomponents.delete{subject_idx},0);
    
    % Save data if needed:
    if cfg.ica.badcomponents.save
        save_subject_data(cfg,data,cfg.ica.badcomponents.sdir);
    end
end  

end

