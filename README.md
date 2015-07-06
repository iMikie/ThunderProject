# ThunderProject
Explore the Livecode development system as a way of deploying mobile clients on iOS and Android

Livecode is an IDE used to create Macintosh, Windows, iOS, Android and Server apps.  It is based on a language that I wrote the LALR grammar for back in my Apple days.  I am interested in exploring whether I can use Livecode to create the user interface for fully decopled mobile apps.  The goal of my Thunder Project would be to release an iPhone, iPad and as a stretch goal, an Android front end for a simple app.

The client apps would either 
  1. talk JSON to the Sinatra/Rails server using the normal RESTful routes.  
  2. talk websockets 
  
In phase 2 I wrote my own websockets interface between Sinatra and a UI server I wrote as a native Macintosh app.  I defined a 



In phase 0 I wrote a Macintosh user interface server that my Sinatra application could talk to over sockets and could instantiate a native user interface.  It did t
