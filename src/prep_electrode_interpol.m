function data = prep_electrode_interpol(cfg,data)
%% PREP_ELECTRODE_INTERPOL
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
% This function interpoles the indicated bad channels:

if cfg.interpole.flag
    
    fprintf('\n<strong> > Electrode interpolation...</strong>\n\n');
    
    % Select subject idx:
    subject_idx = str2double(data.subject.id(end-2:end));
    
    % Compute interpolation:
    if ~isempty(cfg.interpole.channels{subject_idx})
        
        data = pop_interp(data,cfg.interpole.channels{subject_idx},...
            cfg.interpole.metohd);
        
    end
    
    % Save data if needed:
    if cfg.interpole.save
        save_subject_data(cfg,data,cfg.interpole.sdir);
    end 
    
end

end

