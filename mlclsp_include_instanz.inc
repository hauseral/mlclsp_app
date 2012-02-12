set k / 
k1
k2
k3
k4
k5
/

t / 
t1
t2
t3
t4
/

j / 
j1
j2
/;

alias(k,i);
Set NF(k,i) ;
NF(k,i)= no;
NF( 'k1', 'k3') = yes;
NF( 'k1', 'k4') = yes;
NF( 'k2', 'k3') = yes;
NF( 'k3', 'k5') = yes;
NF( 'k4', 'k5') = yes;
Set PR(k,j) ;

 PR(k,j)=  no ;

PR( 'k1', 'j1') = yes;

PR( 'k2', 'j1') = yes;

PR( 'k3', 'j2') = yes;

PR( 'k4', 'j2') = yes;

PR( 'k5', 'j1') = yes;



Parameter
  h(k) /
k1  40
k2  35
k3  15
k4  4
k5  3
/


s(k) /
k1  200
k2  500
k3  300
k4  1000
k5  300
/


tb(k) /
k1  1
k2  1
k3  1
k4  1
k5  1
/


tr(k) /
k1  20
k2  30
k3  10
k4  20
k5  10
/


z(k) /
k1  1
k2  1
k3  1
k4  1
k5  1
/


y0(k) /
k1  50
k2  120
k3  100
k4  110
k5  80
/


a(k,i) /
k3.k1 1
k4.k1 1
k3.k2 1
k5.k3 1
k5.k4 1
/


b(j,t) /
j1.t1 150
j1.t2 150
j1.t3 150
j1.t4 150
j2.t1 150
j2.t2 150
j2.t3 150
j2.t4 150
/


d(k,t) /
k1.t1 10
k1.t2 20
k1.t3 30
k1.t4 80
k2.t1 20
k2.t2 80
k2.t3 50
k2.t4 90
k3.t3 30
k4.t4 80
/;

Scalar M;
 M = 10000;
