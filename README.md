# ThunderProject
Explore the Livecode development system as a way of deploying mobile clients on iOS and Android

Livecode is an IDE used to create Macintosh, Windows, iOS, Android and Server apps.  It is based on a language that I wrote the LALR grammar for back in my Apple days.  I am interested in exploring whether I can use Livecode to create user interfaces for fully decopled mobile apps.  The goal of my Thunder Project would be to release an iPhone, iPad and as a stretch goal, an Android front end for a simple app.

The client apps would either 
  1. talk JSON to the Sinatra/Rails server using the normal RESTful routes.  
  2. potentially talk websockets (why would it want to do this?)
  
A web app pushes stateless pages to the client "UI Server" known as a web browser.  Without being terribly clever, the entire web page is redrawn each time.  A mobile app is reverse: everything is coded at the client and simple data requests are made of the server.  This makes sense but it potentially means tripling the cost and complexity of writing for web-app, iOS, and Android.  Phone Gap tries to avoid this by trying to create an application out of a document's CSS and HTML.  Isn't that like racing moving vans instead of formula one cars?

Two questions need to be answered:
  1. Can LiveCode be used to significantly reduce the pain and learning curve associated with mobile clients?
  2. Is there any way to compose pages on the server without having to learn two completely different environments but without sucumbing to stateless complete page redraws?  
