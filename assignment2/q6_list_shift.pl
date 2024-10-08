% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME:Ivana Miovcic 
%%%%% NAME:Mishelle Bitman
%%%%% NAME:Daniel Persaud
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: listShift
%%%%% Put your rules for listShift and any helper predicates below

% Base case lengh of list is 0
list_Len(nil, 0).

% Calculate len of list
list_Len(next(H, T), Len) :- list_Len(T, TLen), Len is TLen + 1.

% Appends two lists
append_List(nil, L, L).
append_List(next(H, T1), L, next(H, T2)) :- append_List(T1, L, T2).

% Splits list into two, shifted elements and remaining elements
split_list(List, 0, nil, List).
split_list(next(H, T), Shift, next(H, T1), Rest) :- Shift2 is Shift - 1, split_list(T, Shift2, T1, Rest).

listShift(List, I, Result) :- list_Len(List, Len), Shift is I mod Len, split_list(List, Shift, ShiftedElem, Rest), append_List(Rest, ShiftedElem, Result).