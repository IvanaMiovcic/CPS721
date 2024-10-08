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

%%%%% SECTION: alternatePlusMinus
%%%%% Put your rules for alternatePlusMinus and any helper predicates below

alternatePlusMinus([], 0).
alternatePlusMinus([H|T], Sum) :- alternatePlusMinus(T, Sum2, add), Sum is Sum2 + H.
alternatePlusMinus([], 0, Op).
alternatePlusMinus([H|T], Sum, Op) :- Op = add, alternatePlusMinus(T, Sum2, sub), Sum is Sum2 + H.
alternatePlusMinus([H|T], Sum, Op) :- Op = sub, alternatePlusMinus(T, Sum2, add), Sum is Sum2 - H.
