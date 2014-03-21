#!/usr/bin/gawk -f
# httpd.awk
# original from http://dqn.sakusakutto.jp/2013/08/awk_http_server.html
BEGIN {
    port = "8080";
    http_service = "/inet/tcp/" port "/0/0";
    RS = ORS = "\r\n";

    for (;;) {
        if ((http_service |& getline) > 0) {
            print "HTTP/1.x 200 OK"         |& http_service;
            print "Content-type: text/html" |& http_service;
            print ""                        |& http_service;
            print "<h1>Hello, world!</h1>"  |& http_service;
        }
        close(http_service);
    }
}
