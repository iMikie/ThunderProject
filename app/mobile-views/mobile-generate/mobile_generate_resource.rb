=begin
Mobile Generate does for mobile app views what mobile-geneate does for Rails.  In Fact it assumes Rails on the back end.


***************************************
mobile-generate mobile-app
***************************************

#this creates the new blank app with our communications software so that we can create views and controls inside those views

mobile-generate resource fieldname1, fieldname2, fieldname3...

This generates  builds the mobile views for the resource:
  Create:
    an index view to read the values of an instance
   an edit button, which switches to an edit view
    fields to edit each model variable, edit button becomes submit
      a cancel button
      a new button

    a list view where you can click to edit


mobile-generate session
  Creates a login screen
  Places a login button on the home screen
  username and password fields with behavior for logging in.
  LOGIN button that properly communicates with Rails and passes back information/errors

mobile-add_background
  This is the equivalent of the application.html.erb file, a background that is added to every screen.
=end

require 'chilkat'
require_relative 'remote-factory/sockets.rb'
require_relative 'remote-factory/view.rb'

app = App.new

def mobile-generate-background1
menu_bar = Image.new(name: "buttonBar",
                     src: "./images/menu-bar.png",
                     height: 55,
                     width: 1100,
                     left: 30,
                     top: 16)

photo = Image.new(name: "stfyc",
                  src: "./images/stfyc-night.jpg")

background = Image.new(name: "background",
                       src: "./../../assets/images/bg_watermark.jpg",
                       height: 1002,
                       width:1040 ,
                       left: -41,
                       top: 94)
end
def mobile-generate-background2
menu_bar = Image.new(name: "buttonBar",
                     src: "./images/menu-bar.png",
                     height: 55,
                     width: 1100,
                     left: 30,
                     top: 16)

photo = Image.new(name: "stfyc-narrow",
                  src: "./images/stfyc-night.jpg")

background = Image.new(name: "background",
                       src: "./../../assets/images/stfyc_logo_strip.png",
                       height: 67,
                       width:1100 ,
                       left: -9,
                       top: 94)

  #select and group these objects, set act as background
  #
end

def mobile_generate_resource resource, option = {}

  #for each resource create a field
  #name the field after the resource
  #give it a default style - create a default field, button styles, show doing this with the tool
  #set the behavior of each field
  #create an edit button, cancel, and new buttons with standard scripts
  #can I store the script?
  #create a viewer card
  #put the list on it with the right scripts to view and edit
  #std menu: one button for each resource on the menu bar: list,edit

end