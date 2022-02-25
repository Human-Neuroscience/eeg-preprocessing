function data = prep_filter(cfg,data)
%% PREP_FILTER
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
%  This function returns the filtered version of the input dataset.

% High-pass filter:
if cfg.filter.highpass.flag
    fprintf('\n<strong> > Applying high-pass filter...</strong>\n\n');
    data = pop_eegfiltnew(data,cfg.filter.highpass.fcutoff,[],...
        cfg.filter.highpass.order,0,[],cfg.filter.plotfreqresp);
end

% Low-pass filter:
if cfg.filter.lowpass.flag
    fprintf('\n<strong> > Applying low-pass filter...</strong>\n\n');
    data = pop_eegfiltnew(data,[],cfg.filter.lowpass.fcutoff,...
        cfg.filter.highpass.order,0,[],cfg.filter.plotfreqresp);
end

% Notch filter:
if cfg.filter.notch.flag
    fprintf('\n<strong> > Applying notch filters...</strong>\n\n');
    for i = 1 : size(cfg.filter.notch.fnull,1)
        data = pop_eegfiltnew(data,...
            cfg.filter.notch.fnull(i,1),cfg.filter.notch.fnull(i,2),...
            cfg.filter.notch.order,1,[],cfg.filter.plotfreqresp);
    end
end

% Save data if needed:

if cfg.filter.save && (cfg.filter.notch.flag || cfg.filter.lowpass.flag ...
        || cfg.filter.highpass.flag)
    save_subject_data(cfg,data,cfg.filter.sdir);
end


end

