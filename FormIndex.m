function [ Index_Inform , Index_Pilot ] = FormIndex( Nc, Ration_Of_Pilots)
    Index_Pilot(:) = 1:100/Ration_Of_Pilots:Nc+1;
    Index_Inform = [];
    for l = 1 : length(Index_Pilot) - 1
        Index_Inform = [Index_Inform...
            (Index_Pilot(l) + 1 ):( Index_Pilot(l+1) - 1)];
        end
end