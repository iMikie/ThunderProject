# ThunderProject
Explore the Livecode development system as a way of deploying mobile clients on iOS and Android

Livecode is an IDE used to create Macintosh, Windows, iOS, Android and Server apps.  It is based on a language that I wrote the LALR grammar for back in my Apple days.  I am interested in exploring whether I can use Livecode to create user interfaces for fully decopled mobile apps.  The goal of my Thunder Project would be to release an iPhone, iPad and as a stretch goal, an Android front end for a simple app.

The client apps would either 
  1. talk JSON to the Sinatra/Rails server using the normal RESTful routes.  
  2. potentially talk websockets (what would the advantages be?)
  
In phase 1 and 2 I built my mobile UIServer as a separate application that talked TCP/IP sockets with Sinatra.  This was simpy because we hadn't learned routes yet.  Yet, websockets is an up and coming technology for de-coupled apps.  Why?

Ultimately our problem is this:  A web app pushes stateless pages to the client "UI Server" known as a web browser.  Without being terribly clever, the entire web page is redrawn each time.  A page is a terrible metaphor for an application. 

A mobile app is the reverse: everything is coded at the client and simple data requests are made of the server.  This makes sense but it potentially means tripling the cost and complexity of our jobs: we must write a web-app, an iOS app, and Android.  Phone Gap tries to avoid this by trying to create an application out of a document's CSS and HTML.  But isn't that like racing moving vans instead of formula one cars?  Other solutions try to write "mobile-first" web apps which fail if the device is not connected. Neither of those are valuable solutions.

I don't know what the answer is, but I will try to ask these questions:
  1. Can LiveCode be used to significantly reduce the pain and learning curve associated with mobile clients?
  2. Is there any way to compose pages on the server without having to learn two completely different environments but without sucumbing to stateless complete page redraws?  
