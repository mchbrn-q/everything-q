// open port 1234
\p 1234;

// show what port you are listening on
\p

// show all open client handles
.z.W;

// add password checking
permitted_users:`Matthew`Jordan`Michael;
.z.pw:{[u;p] (u in permitted_users) & (p~"password123")};

// reset the .z.pw message handler
\x .z.pw;

// add password checking on users by loading users.txt
// $q -u user.txt

// show the ip address, current datetime, user and the handle number on every new connection to server
.z.po:{show (.z.a;.z.p;.z.u;x)}

// show the hostname and handle number when a connection is closed
.z.pc:{show(.z.h;x)}

// make server sleep for 10 seconds
system"sleep 10"

// open port 1234 and load users from users.txt from the command line
// this will then only allow connections from user and password pairs specified in the txt file
// q -p 1234 -u users.txt

// define a function on the server that can be used by the client
f:{x*x}

// define a list that can be requested by the client
list1:12 8 10 9 2

// define a message handler that is used everytime a synchronous message is received to return the value of the expression to the server console and the client console
.z.pg:{0N! value x}

// stop listening to port
\p 0

// push data received asynchronously to a table that logs time and value of request
tab:([]time:();result:()};
.z.ps:{`tab insert (.z.p;.Q.s1 value x)}
