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
%%%%% Below you can find the KB given in the assignment PDF. You may edit it as you wish for testing
%%%%% It will be ignored in the tests
%%%%% Do not put any part of the KB in the robocup section below. That section, should only
%%%%% have statements for the canPass, canScore, and any helper predicates needed for computing those
robot(r1).     robot(r2).     robot(r3).
robot(r4).     robot(r5).     robot(r6).
hasBall(r3).
pathClear(r1, net).    pathClear(r2, r1).    pathClear(r3, r2).
pathClear(r3, net).    pathClear(r3, r1).    pathClear(r3, r4).
pathClear(r4, net).    pathClear(r1, r5).    pathClear(r5, r6).

%%%%% SECTION: robocup
%%%%% Put your rules for canPass, canScore, and any helper predicates below

myMember(E, [E|T]).
myMember(E, [H|T]):- myMember(E, T).

myAppend([], L, L).
myAppend([H|L1], L2, [H|L3]) :- myAppend(L1, L2, L3).

canPass(R1, R2, M, [R1, R2]) :- robot(R1), robot(R2), pathClear(R1,R2), M >= 1.
canPass(R1, R2, M, [R1, R2]) :- robot(R1), robot(R2), pathClear(R2,R1), M >= 1.
canPass(R1, R2, M, [R1 | PathRest]) :- M >= 2, robot(R1), robot(R2), pathClear(R1,X), canPass(X, R2, M - 1, PathRest), not myMember(R1, PathRest).
canPass(R1, R2, M, [R1 | PathRest]) :- M >= 2, robot(R1), robot(R2), pathClear(X,R1), canPass(X, R2, M - 1, PathRest), not myMember(R1, PathRest).

canScore(R1, M, [R1, net]) :- robot(R1), hasBall(R1), pathClear(R1, net), M >= 1.
canScore(R1, M, P1) :- M >= 2, robot(R1), pathClear(R1, net), hasBall(X), canPass(X, R1, M - 1, P ), myAppend(P, [net], P1).
canScore(R1, M, P1) :- M >= 2, robot(R1), pathClear(R1, net), hasBall(X), canPass(X, R1, M - 1, P ), myAppend(P, [net], P1).
