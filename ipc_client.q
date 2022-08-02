// run this script after running ipc_server.q

// open a handle to the server process listening on port 1234
h:hopen 1234;

// show what socket the handle h has been assigned to
h;

// open a handle to the server process listening on port 1234 and specifying the host
h1:hopen `:localhost:1234
h2:hopen `::1234
