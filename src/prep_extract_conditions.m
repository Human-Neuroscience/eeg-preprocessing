function report = prep_extract_conditions(cfg,data)
%% PREP_EXTRACT_CONDITIONS
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
% Note:
%  Posible warning if your are re-epoching:
%  Warning: event 308 out of data boundary
%  Explanation: https://sccn.ucsd.edu/pipermail/eeglablist/2008/002092.html

if cfg.conditions.flag
    for i = 1 : length(cfg.conditions.names)
        
        fprintf(['\n<strong> > Extracting trials for condition :' ...
            cfg.conditions.names{i} '</strong>\n\n']);
        
        try
            % Extract epochs
            [data_,idx{i}] = pop_epoch(data,cfg.conditions.triggers{i},...
                cfg.epochs.bounds);
            data_.setname = cfg.conditions.names{i};
            
            report(1,i) = length(idx{i});
            
            % Baseline correction
            if cfg.conditions.baseline.flag
                data_ = pop_rmbase(data_,cfg.conditions.baseline.w);
            end
            
            % Save condition data:
            if cfg.conditions.save
                save_dir = [cfg.conditions.sdir filesep ...
                    cfg.conditions.names{i}];
                save_subject_data(cfg,data_,save_dir);
            end
            
        catch
            warning(['No epochs found for ' cfg.conditions.names{i}...
                ' condition.'])
            
            report(1,i) = 0; 
        end
    end
end

end

