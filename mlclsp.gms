*mlclsp
*Autor:
*Stand: 31.01.2012
option optcr=0.00;
option limrow = 20;
$include mlclsp_include_instanz_3.inc

Variables
         F Zielfunktionswert;
Positive variables
         q(k,t) Losgroeße fuer Arbeitsgang k und Periode t
         y(k,t) Lagerbestand fuer Produkt k am Ende der Periode t
;
Binary variables
         g(k,t) binaere Ruestvariable fuer Arbeitsgang bzw. Produkt k in Periode t
;

Equations
         Ziel Zielfunktion Minimierung der Kosten
         Bilanz(k,t) Lagerbilanz für Produkt k und Ressource j
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
