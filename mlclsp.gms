*mlclsp
*Autor:
*Stand: 31.01.2012
option optcr=0.00;
option limrow = 20;
$include mlclsp_include_instanz.inc

Variables
         F Zielfunktionswert;
Positive variables
         q(k,t) Losgroe�e fuer Arbeitsgang k und Periode t
         y(k,t) Lagerbestand fuer Produkt k am Ende der Periode t
;
Binary variables
         g(k,t) binaere Ruestvariable fuer Arbeitsgang bzw. Produkt k in Periode t
;

Equations
         Ziel Zielfunktion Minimierung der Kosten
         Bilanz(k,t) Lagerbilanz f�r Produkt k und Ressource j
         Kapa(j,t) Kapazitaetsrestriktion fuer Ressource j und Periode t
         Restr(k,t)
;

Ziel ..
         F =e= sum((k,t),s(k)*g(k,t)+h(k)*y(k,t));

Bilanz(k,t)..
         y0(k)$(ord(t)=1) + y(k,t-1)$(ord(t)>1) + q(k,t-z(k))
         - sum(i$NF(i,k), a(k,i) * q(i,t)) - y(k,t) =e= d(k,t);

Kapa(j,t)..
         sum(k$PR(k,j),tb(k)*q(k,t)+tr(k)*g(k,t)) =l= b(j,t);

Restr(k,t)..
         q(k,t)-M*g(k,t) =l= 0;


model mlclsp /
         Ziel
         , Bilanz
         , Kapa
         , Restr/;

solve mlclsp minimizing F using mip;

display q.l, y.l, g.l;


file outputfile1 / 'mlclsp_solution_1.txt'/;
put outputfile1;


loop(k,
         loop(t$(q.l(k,t)>0),
                 put k.tl:0, ' ; ' t.tl:0, ' ; ' q.l(k,t) /
         );
);
putclose outputfile1;

file outputfile3 / 'mlclsp_solution_2.txt'/;
put outputfile3;

loop(k,
         loop(t$(y.l(k,t)>0),
                 put k.tl:0, ' ; ' t.tl:0, ' ; ' y.l(k,t) /
         );
);
putclose outputfile3;


file outputfile4 / 'mlclsp_solution_3.txt'/;
put outputfile4;
loop(k,
         loop(t$(g.l(k,t)>0),
                 put k.tl:0, ' ; ' t.tl:0, ' ; ' g.l(k,t) /
         );
);

putclose outputfile4;


file outputfile2 / 'Objective_F_Value.txt'/;
put outputfile2;


put 'Objective_F_Value:  ',F.l /
put '**************************'

putclose outputfile2;
