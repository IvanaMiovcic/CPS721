% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Mishelle Bitman
%%%%% NAME: Ivana Miovcic
%%%%% NAME: Daniel Persaud
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: equalEntries
%%%%% Put your rules for equalEntries below

equalEntries([H], [H], [true]).
equalEntries([H], [H2], [false]) :- not(H = H2).
equalEntries([H | T], [H | T2], [true | T3]) :- equalEntries(T, T2, T3).
equalEntries([H | T], [H2 | T2], [false | T3]) :- not (H = H2), equalEntries(T, T2, T3).

