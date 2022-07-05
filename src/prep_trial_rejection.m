function [data,out] = prep_trial_rejection(cfg,subject)
%% PREP_TRIAL_REJECTION
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
% This function computes a semi-automatic trial rejection process:

fprintf(['\n<strong> > Loading subject: ' subject.id '</strong>\n\n']);

% Directory to load data:
load_dir = [cfg.datapath filesep 'derivatives' filesep ...
    cfg.badcomponents.sdir filesep];
files = dir([load_dir subject.id '*.set']);
file_name = files(1).name;

% Importa data:
data = pop_loadset('filename',file_name,'filepath',load_dir);

% Prepare report:
out.total_trials = data.trials;
out.total_rejected = 0;
out.percent = 0;

% Exclude bad channels:
total_channels = (1:length(data.chanlocs));
subject_idx = str2double(data.subject.id(end-2:end));
badchannels = cfg.badchannels{subject_idx};
channels = setdiff(total_channels, badchannels);

% Abnormal spectra:
if cfg.trialrej.abspect.flag
    fprintf('\n<strong> > Computing trial rejection...</strong>\n\n');
    [data,ab_spec_idxs] = pop_rejspec( data,...
        cfg.trialrej.type,...
        'elecrange',channels,...
        'method',cfg.trialrej.abspect.method,...
        'threshold',cfg.trialrej.abspect.threshold,...
        'freqlimits',cfg.trialrej.abspect.freqlimits,...
        'eegplotreject',cfg.trialrej.abspect.eegplotreject);
    
    out.ab_spec_idxs = ab_spec_idxs;
    out.nrej_ab_spec = length(ab_spec_idxs);
    out.total_rejected = out.total_rejected + length(ab_spec_idxs);
    
    data = pop_rejepoch(data,ab_spec_idxs,0);
    
end

% Improbable data:
if cfg.trialrej.impdata.flag
    fprintf('\n<strong> > Computing trial rejection...</strong>\n\n');
    [data,~,~,out.nrej_improbable_data,~,imp_data_idxs] = pop_jointprob_idxs(...
        data,...
        cfg.trialrej.type,...
        channels,...
        cfg.trialrej.impdata.loclim,...
        cfg.trialrej.impdata.globlim,1,1,1);
    
    out.imp_data_idxs = imp_data_idxs;
    out.total_rejected = out.total_rejected + out.nrej_improbable_data;
end

% Extreme values:
if cfg.trialrej.extrval.flag
    fprintf('\n<strong> > Computing trial rejection...</strong>\n\n');
    [data, ext_values_idxs] = pop_eegthresh(data,...
        cfg.trialrej.type,...
        channels,...
        cfg.trialrej.extrval.lolim,...
        cfg.trialrej.extrval.uplim,...
        data.xmin,data.xmax,1,1);
    
    out.ext_values_idxs = ext_values_idxs;
    out.nrej_ext_values = length(ext_values_idxs);
    out.total_rejected = out.total_rejected + length(ext_values_idxs);
end

% Update report:
out.percent = out.total_rejected * 100 / out.total_trials;

% Save data if needed:
if cfg.trialrej.save
    save_subject_data(cfg,data,cfg.trialrej.sdir);
end
end

