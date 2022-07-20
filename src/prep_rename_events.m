function events = prep_rename_events (events)
%% RENAME_EVENTS
% -------------------------------------------------------------------------
% David Lopez-Garcia
% dlopez@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
%  This function returns the renamed events:

fprintf('\n<strong> > Renaming events...</strong>\n\n');

for i = 1 : length(events)
    
    event_code = events(i).code;
    event_id = events(i).type;
    
    if strcmp(event_code,'Stimulus')
        
        if strcmp(event_id,'S  1')
            str = 'CUE_ANIMAL_SYMBOL_INT';
        elseif strcmp(event_id,'S  2')
            str = 'CUE_TOOL_SYMBOL_INT';
        elseif strcmp(event_id,'S  3')
            str = 'CUE_ANIMAL_LETTER_INT';  
        elseif strcmp(event_id,'S  4')
            str = 'CUE_TOOL_LETTER_INT';
        elseif strcmp(event_id,'S  5')
            str = 'CUE_ANIMAL_SYMBOL_SEL'; 
        elseif strcmp(event_id,'S  6')
            str = 'CUE_TOOL_SYMBOL_SEL';
        elseif strcmp(event_id,'S  7')
            str = 'CUE_ANIMAL_LETTER_SEL';
        elseif strcmp(event_id,'S  8')
            str = 'CUE_TOOL_LETTER_SEL';
        elseif strcmp(event_id,'S  9')
            str = 'TAR_ANIM_G_C_INT'; 
        elseif strcmp(event_id,'S 10')
            str = 'TAR_ANIM_G_I_INT'; 
        elseif strcmp(event_id,'S 11')
            str = 'TAR_ANIM_P_C_INT'; 
        elseif strcmp(event_id,'S 12')
            str = 'TAR_ANIM_P_I_INT';
        elseif strcmp(event_id,'S 13')
            str = 'TAR_TOOL_G_C_INT';
        elseif strcmp(event_id,'S 14')
            str = 'TAR_TOOL_G_I_INT'; 
        elseif strcmp(event_id,'S 15')
            str = 'TAR_TOOL_P_C_INT'; 
        elseif strcmp(event_id,'S 16')
            str = 'TAR_TOOL_P_I_INT';
        elseif strcmp(event_id,'S 17')
            str = 'TAR_ANIM_G_C_SEL';
        elseif strcmp(event_id,'S 18')
            str = 'TAR_ANIM_G_I_SEL'; 
        elseif strcmp(event_id,'S 19')
            str = 'TAR_ANIM_P_C_SEL';
        elseif strcmp(event_id,'S 20')
            str = 'TAR_ANIM_P_I_SEL';
        elseif strcmp(event_id,'S 21')
            str = 'TAR_TOOL_G_C_SEL'; 
        elseif strcmp(event_id,'S 22')
            str = 'TAR_TOOL_G_I_SEL';
        elseif strcmp(event_id,'S 23')
            str = 'TAR_TOOL_P_C_SEL';
        elseif strcmp(event_id,'S 24')
            str = 'TAR_TOOL_P_I_SEL';
        elseif strcmp(event_id,'S 25')
            str = 'TAR_CATCH'; 
        elseif strcmp(event_id,'S 26')
            str = 'DIS_ANIM_G_C_INT'; 
        elseif strcmp(event_id,'S 27')
            str = 'DIS_ANIM_G_I_INT';
        elseif strcmp(event_id,'S 28')
            str = 'DIS_ANIM_P_C_INT'; 
        elseif strcmp(event_id,'S 29')
            str = 'DIS_ANIM_P_I_INT';
        elseif strcmp(event_id,'S 30')
            str = 'DIS_TOOL_G_C_INT';
        elseif strcmp(event_id,'S 31')
            str = 'DIS_TOOL_G_I_INT'; 
        elseif strcmp(event_id,'S 32')
            str = 'DIS_TOOL_P_C_INT';
        elseif strcmp(event_id,'S 33')
            str = 'DIS_TOOL_P_I_INT';
        elseif strcmp(event_id,'S 34')
            str = 'DIS_ANIM_G_C_SEL';
        elseif strcmp(event_id,'S 35')
            str = 'DIS_ANIM_G_I_SEL'; 
        elseif strcmp(event_id,'S 36')
            str = 'DIS_ANIM_P_C_SEL';
        elseif strcmp(event_id,'S 37')
            str = 'DIS_ANIM_P_I_SEL';
        elseif strcmp(event_id,'S 38')
            str = 'DIS_TOOL_G_C_SEL';
        elseif strcmp(event_id,'S 39')
            str = 'DIS_TOOL_G_I_SEL'; 
        elseif strcmp(event_id,'S 40')
            str = 'DIS_TOOL_P_C_SEL'; 
        elseif strcmp(event_id,'S 41')
            str = 'DIS_TOOL_P_I_SEL'; 
        elseif strcmp(event_id,'S 42')
            str = 'LOC_ANIM_GO'; 
        elseif strcmp(event_id,'S 43')
            str = 'LOC_ANIM_NOGO';
        elseif strcmp(event_id,'S 44')
            str = 'LOC_TOOL_GO';
        elseif strcmp(event_id,'S 45')
            str = 'LOC_TOOL_NOGO';
        elseif strcmp(event_id,'S 46')
            str = 'RSP_Resp';
        elseif strcmp(event_id,'S 47')
            str = 'RSP_Corr';
        elseif strcmp(event_id,'S 48')
            str = 'RSP_Incorr';
        elseif strcmp(event_id,'S 49')
            str = 'EXP_STR';
        elseif strcmp(event_id,'S 50')
            str = 'BLK_INT';
        elseif strcmp(event_id,'S 51')
            str = 'BLK_SEL'; 
        elseif strcmp(event_id,'S 52')
            str = 'BLK_LOC'; 
        elseif strcmp(event_id,'S 53')
            str = 'BLK_1';
        elseif strcmp(event_id,'S 54')
            str = 'BLK_2';    
        elseif strcmp(event_id,'S 55')
            str = 'BLK_3';
        elseif strcmp(event_id,'S 56')
            str = 'BLK_4';    
        elseif strcmp(event_id,'S 57')
            str = 'BLK_5'; 
        elseif strcmp(event_id,'S 58')
            str = 'BLK_6';    
        elseif strcmp(event_id,'S 59')
            str = 'BLK_7';     
        elseif strcmp(event_id,'S 60')
            str = 'BLK_8';
        elseif strcmp(event_id,'S 61')
            str = 'BLK_9';    
        elseif strcmp(event_id,'S 62')
            str = 'BLK_10';    
        elseif strcmp(event_id,'S 63')
            str = 'BLK_11';
        elseif strcmp(event_id,'S 64')
            str = 'BLK_12';    
        elseif strcmp(event_id,'S 65')
            str = 'BLK_13';
        elseif strcmp(event_id,'S 66')
            str = 'BLK_14';    
        elseif strcmp(event_id,'S 67')
            str = 'BLK_15';
        elseif strcmp(event_id,'S 68')
            str = 'BLK_16';    
        elseif strcmp(event_id,'S 69')
            str = 'BLK_17';    
        elseif strcmp(event_id,'S 70')
            str = 'BLK_18';    
        elseif strcmp(event_id,'S 71')
            str = 'BLK_19';
        elseif strcmp(event_id,'S 72')
            str = 'BLK_20';    
        elseif strcmp(event_id,'S 73')
            str = 'BLK_21';    
        elseif strcmp(event_id,'S 74')
            str = 'BLK_22'; 
        elseif strcmp(event_id,'S 75')
            str = 'BLK_23';    
        elseif strcmp(event_id,'S 76')
            str = 'BLK_24';    
        elseif strcmp(event_id,'S 77')
            str = 'BLK_25';    
        elseif strcmp(event_id,'S 78')
            str = 'BLK_26';
        elseif strcmp(event_id,'S 79')
            str = 'BLK_27';    
        elseif strcmp(event_id,'S 80')
            str = 'BLK_28';    
        elseif strcmp(event_id,'S 81')
            str = 'BLK_29';
        elseif strcmp(event_id,'S 82')
            str = 'BLK_30';    
        elseif strcmp(event_id,'S 83')
            str = 'BLK_31';
        elseif strcmp(event_id,'S 84')
            str = 'BLK_32';    
        elseif strcmp(event_id,'S 85')
            str = 'BLK_33';    
        elseif strcmp(event_id,'S 86')
            str = 'BLK_34';    
        elseif strcmp(event_id,'S 87')
            str = 'BLK_35';
        elseif strcmp(event_id,'S 88')
            str = 'BLK_36';    
        elseif strcmp(event_id,'S 89')
            str = 'BLK_37';    
        elseif strcmp(event_id,'S 90')
            str = 'BLK_38';
        elseif strcmp(event_id,'S 91')
            str = 'BLK_39';    
        elseif strcmp(event_id,'S 92')
            str = 'BLK_40';    
        elseif strcmp(event_id,'S 93')
            str = 'BLK_41';
        elseif strcmp(event_id,'S 94')
            str = 'BLK_42';    
        elseif strcmp(event_id,'S 95')
            str = 'BLK_43';
        elseif strcmp(event_id,'S 96')
            str = 'BLK_44';    
        elseif strcmp(event_id,'S 97')
            str = 'BLK_45';
        elseif strcmp(event_id,'S 98')
            str = 'BLK_46';    
        elseif strcmp(event_id,'S 99')
            str = 'BLK_47';    
        elseif strcmp(event_id,'S 100')
            str = 'BLK_48';    
        end
        
        events(i).type = str;
        
    end
    
end

end