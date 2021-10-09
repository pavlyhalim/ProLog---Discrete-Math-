male(jack).
male(edward).
male(mark).
male(ian).
male(nick).
male(paul).
male(sam).

female(catherine).
female(elizabeth).
female(sophia).
female(rose).
female(emily).

married(jack,rose).
married(edward,emily).
married(paul,elizabeth).
married(sam,sophia).

parent(jack,edward).
parent(rose,edward).
parent(jack,elizabeth).
parent(rose,elizabeth).
parent(elizabeth,sophia).
parent(paul, sophia).
parent(edward, catherine).
parent(emily, catherine).
parent(edward, ian).
parent(emily, ian).
parent(edward, mark).
parent(emily, mark).
parent(sophia,nick).
parent(sam, nick).

father(X,Y)	:-male(X),parent(X,Y).
mother(X,Y)	:-female(X),parent(X,Y).
son(X,Y):-male(Y),parent(X,Y).
daughter(X,Y):-female(Y),parent(X,Y).
brother(X,Y):- male(X), father(F, Y), father(F,X), mother(M,Y),  mother(M,X), X \= Y.
sister(X,Y):- female(X), father(F, Y), father(F,X), mother(M,Y),  mother(M,X), X \= Y.
aunt(X,Y):- female(X), sister(X,Z), parent(Z,Y).
uncle(X,Y):- male(X), brother(X,Z), parent(Z,Y).
child(X,Y):-  son(Y,X); daughter(Y,X).
grandfather(X,Y):- male(X), parent(X,Z), parent(Z,Y).
grandmother(X,Y):- female(X), parent(X,Z), parent(Z,Y).
nephew(X,Y):- male(X), aunt(Y,X); male(X), uncle(Y,X).
niece(X,Y):- female(X), aunt(Y,X); female(X), uncle(Y,X). 
grandchild(X,Y):- child(X,Z), child(Z,Y).



/* <<<<TEST CASES>>>> 
nephew(ian,elizabeth);
sister(catherine,mark);
father(edward,ian);
mother(elizabeth,sophia);
niece(sophia,edward);
grandfather(jack,sophia);
child(nick,sophia);
grandchild(ian,jack);
aunt(elizabeth,catherine);
uncle(edward,sophia);
uncle(elizabeth,jack).
*/
