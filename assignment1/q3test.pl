robot(r1). robot(r2). robot(r3).
robot(r4). robot(r5). robot(r6).
hasBall(r3).
pathClear(r1, net).
pathClear(r2, r1).
pathClear(r3, r2).
pathClear(r3, net).
pathClear(r3, r1).
pathClear(r3, r4).
pathClear(r4, net).
pathClear(r1, r5).
pathClear(r5, r6).
pathClear(r6, net).
pathClear(r5, net).

canPass(R1, R2, M) :- pathClear(R1, R2), robot(R1), robot(R2), M >= 1.
canPass(R1, R2, M) :- pathClear(R2, R1), robot(R1), robot(R2), M >= 1.
canPass(R1, R2, M) :- M >= 1, robot(R1), robot(R2), robot(X), pathClear(R1, X), canPass(X, R2, M - 1).
canPass(R1, R2, M) :- M >= 1, robot(R1), robot(R2), robot(X), pathClear(X, R1), canPass(X, R2, M - 1).

canScore(R, M) :- hasBall(R), pathClear(R, net), M >= 1.
canScore(R, M) :- hasBall(Y), canPass(Y, R, M - 1), pathClear(R, net).
