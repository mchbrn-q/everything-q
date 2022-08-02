// run this script after running ipc_server.q

// open a handle to the server process listening on port 1234
h:hopen 1234;

// show what socket the handle h has been assigned to
h;

// open a handle to the server process at localhost listening on port 1234 and specifying the host
h1:hopen `:localhost:1234;
h2:hopen `::1234;
h3:hopen("::1234")

// show all open client handles from current session
.z.W;

// close a connection
hclose h2;
// close a connection using its socket number
// hclose 5;

// open a connection to a server process with password protection
h2:hopen `:localhost:1234:Michael:password123;

// give a hopen request a timeout limit of 10 milliseconds
h4:hopen(":localhost:1234;10")

// send the expression 2+2 to the server
h1"2+2"

// send the expression 2+2 to the server in functional form using the handle number
// 3(+;2;2)

// define a variable g with value 42 on the server
h1"g:42"

// define a variable h with value 24 in functional form on the server
h1(set;`g;24)

// use a function f defined on the server that takes one integer parameter
h1"f[2]"
h1(`f;4)
h1("f";8)

// write a function on the client and execute it on the server
f2:{x - y}
h1(f2;3;4)

// get the list list1 from the server
h1(get;`list1)

// send the expression 2*2 to the server asynchronously
(neg h1)"2*2"
