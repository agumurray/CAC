.data
base: .double 5.85
altura: .double 13.47
area: .double 0
a: .double 2

.code 
l.d f5, a(r0)
l.d f1, base(r0)
l.d f2, altura(r0)
mul.d f3, f1, f2
div.d f4, f3, f5
s.d f4, area(r0)
halt 
