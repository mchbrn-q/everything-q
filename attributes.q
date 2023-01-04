// sorted
// can be applied to lists in ascending order
// allows kdb to perform binary search on a list

l:til 10
// 0 1 2 3 4 5 6 7 8 9

t:([]time:(.z.t;.z.t + 00:05;.z.t + 00:10); sym:3?`3; price:(40.5 48.2 45.0))
// time         sym price
// ----------------------
// 11:15:56.775 fko 40.5
// 11:20:56.775 mkp 48.2
// 11:25:56.775 mbc 45


// applying attributes

l:`s#l
// `s#0 1 2 3 4 5 6 7 8 9

l:@[`.; `l; `s#]
// `s#0 1 2 3 4 5 6 7 8 9

update `s#time from `t
// `s#0 1 2 3 4 5 6 7 8 9


// removing attributes

l:`#l
// 0 1 2 3 4 5 6 7 8 9

l:@[`.;`l;`#]
// 0 1 2 3 4 5 6 7 8 9

update `#time from `t
// 0 1 2 3 4 5 6 7 8 9

// attribute remains for appends that don't unsort list
l,:10
// `s#0 1 2 3 4 5 6 7 8 9 10

// attribute removed for appends that unsort list
l,:7
//0 1 2 3 4 5 6 7 8 9 10 7


// interestingly - update `s#time from t,
// without in-place notation, also sets the attribute in place
// whereas removing attributes without in-place notation
// does not remove the attribute in place
// best to always use in-place notation to avoid confusion
