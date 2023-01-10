server {
   listen {{ port }} default_server;
   listen [::]:{{ port }} default_server;
   root /var/www/{{ web }};
   index index.html;
   server_name {{ web }} {{ web_https }};

   location / {
       try_files $uri $uri/ =404;
  }
}
