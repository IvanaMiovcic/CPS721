
% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Ivana Miovcic 
%%%%% NAME: Mishelle Bitman
%%%%% NAME: Daniel Persaud
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: q2_kb
%%%%% You should put the atomic statements in your KB below in this section
totalDeposits(mishelle, cibc, 500).
totalDeposits(mishelle, bmo, 1600).
totalDeposits(ivana, cibc, 2000).
totalDeposits(ivana, bmo, 300).
totalDeposits(daniel, cibc, 700).
totalDeposits(daniel, bmo, 700).

totalWithdrawals(mishelle, cibc, 0).
totalWithdrawals(mishelle, bmo, 100).
totalWithdrawals(ivana, cibc, 500).
totalWithdrawals(ivana, bmo, 105).
totalWithdrawals(daniel, cibc, 710).
totalWithdrawals(daniel, bmo, 710).

monthlyRate(cibc, 0.005).
monthlyRate(bmo, 0.01).

interestLevel(cibc, 1500).
interestLevel(bmo, 500).

penalty(cibc, 50).
penalty(bmo, 100).

%%%%% SECTION: q2_rules
%%%%% Put statements for subtotal, accruedInterest, accruedPenalty, and endOfMonthBalance below.
%%%%% You may also put helper predicates here
%%%%% DO NOT PUT ATOMIC FACTS FOR hasAccount, totalDeposits, totalWithdrawals, monthlyRate, interestRate, or penalty below.
subtotal(Name, Bank, Subtotal) :- totalDeposits(Name, Bank, AmountD), totalWithdrawals(Name, Bank, AmountW), Subtotal is AmountD - AmountW.

accruedInterest(Name, Bank, I) :- subtotal(Name, Bank, Subtotal), monthlyRate(Bank, X), interestLevel(Bank, Y), Y =< Subtotal,  I is Subtotal * X.
accruedInterest(Name, Bank, I) :- subtotal(Name, Bank, Subtotal), monthlyRate(Bank, X), interestLevel(Bank, Y), Y > Subtotal,  I is 0.

accruedPenalty(Name, Bank, P) :- subtotal(Name, Bank, Subtotal), penalty(Bank, X), Subtotal > 0, P is 0.
accruedPenalty(Name, Bank, P) :- subtotal(Name, Bank, Subtotal), penalty(Bank, X), Subtotal < 0, P is X.

endOfMonthBalance(Name, Bank, Balance) :- subtotal(Name, Bank, Subtotal), accruedInterest(Name, Bank, I), accruedPenalty(Name, Bank, P), Balance is (Subtotal - I - P).

endOfMonthBalance(Name, Balance) :- endOfMonthBalance(Name, BankY, BalanceY), endOfMonthBalance(Name, BankX, BalanceX), not BankX = BankY, Balance is BalanceY + BalanceX.

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
