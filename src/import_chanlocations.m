function import_chanlocations(data)
%% Import external channel locations:

    chanlocs = readtable('chanlocs_ced.txt');
    tableloc = struct2table(data.chanlocs);
    tableloc{:,3:10} = num2cell(chanlocs{:,4:11});
    data.chanlocs = table2struct(tableloc);
    

end

