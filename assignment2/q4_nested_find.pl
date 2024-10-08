% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Mishelle Bitman, mishelle.bitman@torontomu.ca, 501091629
%%%%% NAME: Ivana Miovcic, ivana.miovcic@torontomu.ca, 501012152
%%%%% NAME: Daniel Persaud, d2persaud@torontomu.ca, 501083191
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: nestedLists
%%%%% Put your rules for nestedFindDepth, nestedFindIndex, and any helper predicates below

nestedFindDepth([I|T], I, 0).
nestedFindDepth([H|T], I, Depth) :- is_list(H), nestedFindDepth(H, I, SubDepth), Depth is SubDepth + 1.
nestedFindDepth([H|T], I, Depth) :- nestedFindDepth(T, I, Depth).
nestedFindDepth([], I, Depth) :- false.

nestedFindIndex(List, I, Depth, Index) :- helper(List, I, 0, Depth, Index).
helper([H|T], I, Index, Depth, Index) :- findI(H, I, Depth).
helper([H|T], I, CurrentIndex, Depth, Index) :- NextIndex is CurrentIndex + 1, helper(T, I, NextIndex, Depth, Index).
findI(I, I, 0).  
findI(List, I, Depth) :- is_list(List), nestedFindIndex(List, I, SubDepth, Index), Depth is SubDepth + 1.
