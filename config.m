%% ELECTROENCEPHALOGRAPHY PREPROCESSING - (config.m)
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------

% EEG preprocessing configuration file: On this file you can configure all
% the parameters and steps of your preprocessing routine.

%% Path to BIDS's compatible folder:

cfg.datapath = '/Users/David/Desktop/prueba_bids_eeg';

%% 0.1 Subjects to load:
%  By default the preprocessing script loads all the subjects containded in
%  the dataset folder. Add the desired subject ids to the cfg.subjects cell 
%  array to specify the subjects to load.   

cfg.subjects = {
     'sub-001';
%      'sub-002';
%      'sub-003';
%      'sub-004';
%      'sub-005';
%      'sub-006';
%      'sub-007';
%      'sub-008';
%      'sub-009';
%      'sub-010';
%      'sub-011';
%      'sub-012';
%      'sub-013';
%      'sub-014';
%      'sub-015';
%      'sub-016';
%      'sub-017';
%      'sub-018';
%      'sub-019';
%      'sub-020';
%      'sub-021';
%      'sub-022';
%      'sub-023';
%      'sub-024';
%      'sub-025';
%      'sub-026';
%      'sub-027';
%      'sub-028';
%      'sub-029';
%      'sub-030';
%      'sub-031';
%      'sub-032';
%      'sub-033';
    };

%% 0.2 Channels to load.
%  Channel indexes to load. 
%  Empty by default: Load all the channels.

cfg.chantoload = []; 

%% 0.3 Ignored channels
%  Ignored channels for different data preprocesing steps (ICA & trial 
%  rejection). e.g. Ocular channels, noisy channels, etc.

cfg.ignoredchannels = {
    [1 2 3]; % sub-001
    []; % sub-002
    []; % sub-003
    []; % sub-004
    []; % sub-005
    []; % sub-006
    []; % sub-007
    []; % sub-008
    []; % sub-009
    []; % sub-010
    []; % sub-011
    []; % sub-012
    []; % sub-013
    []; % sub-014
    []; % sub-015
    []; % sub-016
    []; % sub-017
    []; % sub-018
    []; % sub-019
    []; % sub-020
    []; % sub-021
    []; % sub-022
    []; % sub-023
    []; % sub-024
    []; % sub-025
    []; % sub-026
    []; % sub-027
    []; % sub-028
    []; % sub-029
    []; % sub-030
    []; % sub-031
    []; % sub-032
    []; % sub-033
    };

%% 1. Resample:
%  According to Nyquist Theorem your sampling frequency should be at least
%  the double of the higher frenquency you are interested in.

% Resampling configuration:
cfg.resample.flag = true;           % Enable/disable resampling.
cfg.resample.freq = 256;            % Desired sampling frequency (Hz).

cfg.resample.save = true;           % Save resampled data.
cfg.resample.sdir = '01-resampled'; % Destination folder.

%% 2. Filters:

% High-pass filter:
cfg.filter.highpass.flag = true;  	% Enable/disable high-pass filter.
cfg.filter.highpass.order = [];    	% Filter order: [] = default.
cfg.filter.highpass.fcutoff = 0.1;	% Cut-off frequency (Hz).

% Low-pass filter:
cfg.filter.lowpass.flag = true;     % Enable/disable low-pass filter.
cfg.filter.lowpass.order = [];      % Filter order: [] = default.
cfg.filter.lowpass.fcutoff = 126;	% Cut-off frequency (Hz).

% Notch filter:
cfg.filter.notch.flag = true;    	% Enable/disable notch filter.
cfg.filter.notch.order = [];    	% Filter order: [] = default.
cfg.filter.notch.fnull = [      	% Main freq and its harmonics.
    49 51;
    99 101
    ];

% Plot filter frequency response.
cfg.filter.plotfreqresp = false;    % Enable/disable.

cfg.filter.save = true;             % Save filtered data.
cfg.filter.sdir = '02-filtered';    % Destination folder.

%% 3. Extract epochs:
cfg.epochs.flag = true;             % Enable/disable data epoching.
cfg.epochs.bounds = [-1 2];         % Trial boundaries in seconds (s).

% Specify the trigger id to load.
% Empty by default: Load the complete dataset.
cfg.epochs.names = {                % Trial names to extract.
    };

cfg.epochs.save = true;             % Save epoched data.
cfg.epochs.sdir = '03-epoched';     % Destination folder.

%% 4. Independent Component Analysis (ICA):
% This algorithm is computed ignoring the channel indexes included in
% cfg.ignoredchannels. This is useful to compute the ICAs ignoring bad 
% channels that will be removed later.

cfg.ica.flag = true;            % Enable/disable ICA decomposition
cfg.ica.method = 'runica';      % ICA algorithm to use for decomposition.
cfg.ica.extended = true;        % Recommended.

cfg.ica.save = true;            % Save ICA weights.
cfg.ica.sdir = '04-icaweights'; % Destination folder.

%% 5. Bad components:
%  After computing the ICA decomposition the identified artifactual
%  components per subjects should be specified here.

cfg.ica.badcomponents.flag = true;  % Enable/dis. remove artifactual comp.
cfg.ica.badcomponents.delete = {    % Indexes to remove per subject.
    [1 2 3]; % sub-001
    []; % sub-002
    []; % sub-003
    []; % sub-004
    []; % sub-005
    []; % sub-006
    []; % sub-007
    []; % sub-008
    []; % sub-009
    []; % sub-010
    []; % sub-011
    []; % sub-012
    []; % sub-013
    []; % sub-014
    []; % sub-015
    []; % sub-016
    []; % sub-017
    []; % sub-018
    []; % sub-019
    []; % sub-020
    []; % sub-021
    []; % sub-022
    []; % sub-023
    []; % sub-024
    []; % sub-025
    []; % sub-026
    []; % sub-027
    []; % sub-028
    []; % sub-029
    []; % sub-030
    []; % sub-031
    []; % sub-032
    []; % sub-033
    };

cfg.ica.badcomponents.save = true;              % Save ICA pruned data.
cfg.ica.badcomponents.sdir = '05-icapruned';    % Destination folder.

%% 6. Trial rejection:
%  Select the automatic trial rejection processes to compute:

cfg.trialrej.abspect.flag = true;   % Enable/disable: Abnormal spectra.
cfg.trialrej.impdata.flag = true;   % Enable/disable: Improbable data.
cfg.trialrej.extrval.flag = true;   % Enable/disable: Extreme values.

cfg.trialrej.type = 1;              % Data type (1=electrods|0=components).
cfg.trialrej.report = true;         % Enable/disable rejection report.

% Abnormal spectra configuration:
cfg.trialrej.abspect.threshold = [-50 50;-100 25];  % Threshold lim. in dB.
cfg.trialrej.abspect.freqlimits = [0 2;20 40];      % Freq. limits in Hz.
cfg.trialrej.abspect.method = 'fft';                % Method(fft|multitap).
cfg.trialrej.abspect.eegplotreject = 0;

% Improbable data configuration:
cfg.trialrej.impdata.loclim = 6;        % Local limit(s) (in std. dev.)
cfg.trialrej.impdata.globlim = 6;       % Global limit(s) (in std. dev.)    

% Extrme values configuration:
cfg.trialrej.extrval.uplim = 150;       % Upper voltage limit.
cfg.trialrej.extrval.lolim = -150;      % Lower voltage limit

cfg.trialrej.save = true;               % Save trial pruned data.
cfg.trialrej.sdir = '06-trialpruned';   % Destination folder.

%% 7. Electrodes to interpole:
%  Cell array of electrodes to interpole for each subject must be specified
%  in cfg.interpole.channels.

cfg.interpole.flag = true;              % Enable/disable interpolation.
cfg.interpole.metohd = 'spherical';     % Interpolation method.

cfg.interpole.channels = {
    [1 2 3]; % sub-001
    []; % sub-002
    []; % sub-003
    []; % sub-004
    []; % sub-005
    []; % sub-006
    []; % sub-007
    []; % sub-008
    []; % sub-009
    []; % sub-010
    []; % sub-011
    []; % sub-012
    []; % sub-013
    []; % sub-014
    []; % sub-015
    []; % sub-016
    []; % sub-017
    []; % sub-018
    []; % sub-019
    []; % sub-020
    []; % sub-021
    []; % sub-022
    []; % sub-023
    []; % sub-024
    []; % sub-025
    []; % sub-026
    []; % sub-027
    []; % sub-028
    []; % sub-029
    []; % sub-030
    []; % sub-031
    []; % sub-032
    []; % sub-033
    };

cfg.interpole.save = true;              % Save interpoled data.
cfg.interpole.sdir = '07-interpoled';   % Destination folder.

%% 8. Reference electrode and re-reference:
%  Recover the reference electrode manually and compute re-reference.

% Recover reference electrode:
cfg.refelec.flag = true;        % Enable/disable ref. electrode recovery.

cfg.refelec.chan  = 64;         % Channel number.
cfg.refelec.label = 'FCz';      % Channel label.
cfg.refelec.type  = 'REF';      % Channel type.

% Polar coordinates:
cfg.refelec.theta  = 0;
cfg.refelec.radius = 0.125; 

% Cartesian coordinates:
cfg.refelec.X  = 0.38268;				 
cfg.refelec.Y  = 0;
cfg.refelec.Z  = 0.92388;

% Spherical coordinates:
cfg.refelec.sph_theta  = 0;
cfg.refelec.sph_phi  = 67.5;
cfg.refelec.sph_radius  = 1;

% Compute data re-reference:
cfg.reref.flag = true;          % Enable/disable data re-reference.
cfg.reref.chan = [];            % New reference electrore - [] = average.

cfg.reref.save = true;                  % Save re-referenced data.
cfg.reref.sdir = '08-rereferenced';     % Destination folder.

%% 9. Extract conditions:
%  Condition to extract:

cfg.conditions.flag = true;           % Enable/disable cond. extraction.
cfg.conditions.baseline.flag = true;  % Enable/disable baseline correction.
cfg.conditions.baseline.w = [-200 0]; % Baseline boundaries in milisec.

cfg.conditions.report = true;         % Enable/disable conditions report.

% Specify condition names to extrac:
cfg.conditions.names{1} = 'target-congruent-correct';
cfg.conditions.names{2} = 'target-congruent-forced-correct';
cfg.conditions.names{3} = 'target-congruent-easy-forced-correct'; % ...


% Each condition could contain different triggers:

cfg.conditions.triggers{1} = { % Triggers to extract for condition 1
    'TARGET_CRC_FOR_C'
    'TARGET_CLC_FOR_C'
    'TARGET_CRI_FOR_C'
    'TARGET_CLI_FOR_C'
    'TARGET_CRC_VOL_C'
    'TARGET_CLC_VOL_C'
    'TARGET_CRI_VOL_C'
    'TARGET_CLI_VOL_C'
    };

cfg.conditions.triggers{2} = { % Triggers to extract for condition 2
    'TARGET_CRC_FOR_C'
    'TARGET_CLC_FOR_C'
    'TARGET_CRI_FOR_C'
    'TARGET_CLI_FOR_C'
    };

cfg.conditions.triggers{3} = { % Triggers to extract for condition 3
    'TARGET_CRC_FOR_C'
    'TARGET_CLC_FOR_C'
    };

cfg.conditions.save = true;             % Save extracted conditions.
cfg.conditions.sdir = '09-conditions';  % Destination folder.

%% Other parameters:

cfg.rename = true;          % Rename events.
cfg.saveformat = 'set';     % Outpud data format: 'mat'-'set'-'both'
