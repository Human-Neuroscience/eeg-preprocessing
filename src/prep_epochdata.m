function data = prep_epochdata(cfg,data)
%% PREP_EPOCHDATA
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
% This function splits the data in epochs if needed.

% Epoch data if needed:
if cfg.epochs.flag
    
    fprintf('\n<strong> > Epoching data...</strong>\n\n');
    
    data = pop_epoch(data, cfg.epochs.names, cfg.epochs.bounds,...
        'newname', 'epochs', 'epochinfo', 'yes');
    
    % Save data if needed:
    if cfg.epochs.save
        save_subject_data(cfg,data,cfg.epochs.sdir);
    end
    
end

end

