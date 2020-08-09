        location /api/ {
            add_header Application-Name secrets;

            #CORS
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Methods' 'GET, PUT, POST, DELETE, OPTIONS';
            add_header Access-Control-Allow-Headers "Content-Type, Authorization, X-Requested-With";
            if ($request_method = 'OPTIONS') {
                add_header 'Access-Control-Allow-Origin' '*';
                add_header 'Access-Control-Allow-Methods' 'GET, PUT, POST, DELETE, OPTIONS';
                add_header 'Access-Control-Max-Age'        86400;
                add_header 'Access-Control-Allow-Credentials' 'true';
                add_header 'Access-Control-Allow-Headers' 'Authorization,DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
                add_header 'Content-Length' 0;
                add_header 'Content-Type' 'text/plain; charset=UTF-8';
                return 204;
            }

            proxy_redirect          off;
            proxy_set_header        X-Real-IP $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        Host $http_host;
            proxy_pass              http://1.2.3.4:5678;
        }