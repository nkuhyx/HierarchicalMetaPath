function [ Output_Association_First , Output_Association_Sec , Output_Row_Index ] = Row_Index_Alignment( Input_Association_First , Input_Association_Sec , Row_Index_First , Row_Index_Sec )


[Output_Row_Index,ia,ib] = intersect(Row_Index_First,Row_Index_Sec);

Output_Association_First = Input_Association_First(ia,:);
Output_Association_Sec = Input_Association_Sec(ib,:);

end

