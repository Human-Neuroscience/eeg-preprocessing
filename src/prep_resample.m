function data = prep_resample(cfg,data)
%% PREP_RESAMPLE
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
%  This function returns and saves the resampled data if needed.

if cfg.resample.flag
    
    fprintf('\n<strong> > Resampling data...</strong>\n\n');
    
    data = pop_resample(data, cfg.resample.freq);
    
    if cfg.resample.save
        save_subject_data(cfg,data,cfg.resample.sdir);
    end
end

end

