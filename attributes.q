l:til 10
t:([]time:(.z.t;.z.t + 00:05;.z.t + 00:10); sym:3?`3; price:(40.5 48.2 45.0))

// applying attributes
l:`s#l
l:@[`.; `l; `s#]
update `s#time from `t

// interestingly - update `s#time from t,
// without in-place notation, also sets the attribute in place
// whereas removing attributes without in-place notation
// does not remove the attribute in place
// best to always use in-place notation to avoid confusion

// removing attributes
l:`#l
l:@[`.;`l;`#]
update `#time from `t
