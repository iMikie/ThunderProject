require 'chilkat'
require_relative 'sockets.rb'
require_relative 'view.rb'

app = App.new

#delete("button","click me")
my_button = Button.new(name: "click_me")
my_button.left = 200

menu_bar = Image.new(name: "buttonBar",
                     src: "./images/menu-bar.png",
                     height: 55,
                     width: 1100,
                     left: 30,
                     top: 16)

photo = Image.new(name: "stfyc",
                  src: "./images/stfyc-night.jpg")
photo.left = 30
photo.top = 70


home_button_options= {name: "home",
                      locktext: true,
                      contents: "Home",
                      textFont: "Times New Roman",
                      textAlign: "center",
                      opaque: false,
                      showBorder: false,
                      textSize: 18,
                      textColor: "98,98,98",
                      rect: "196,30,314,73"}

 home = Field.new(home_button_options)

music_button_options= {name: "music",
                       locktext: true,
                       contents: "Music",
                       textFont: "Times New Roman",
                       textAlign: "center",
                       opaque: false,
                       showBorder: false,
                       textSize: 18,
                       textColor: "98,98,98",
                       rect: "314,30,432,73"}

music = Field.new(music_button_options)

performances_button_options= {name: "performances",
                              locktext: true,
                              contents: "Performances",
                              textFont: "Times New Roman",
                              textAlign: "center",
                              opaque: false,
                              showBorder: false,
                              textSize: 18,
                              textColor: "98,98,98",
                              rect: "444,30,588,73"}

performance = Field.new(performances_button_options)

SOTS_button_options = {name: "sots", locktext: true, contents: "SOTS", textFont: "Times New Roman", textAlign: "center", opaque: false, showBorder: false, textSize: 18, textColor: "98,98,98", rect: "588,30,700,73"}
sots = Field.new(SOTS_button_options)

login_button_options = {name: "login", locktext: true, contents: "Login", textFont: "Times New Roman", textAlign: "center", opaque: false, showBorder: false, textSize: 18, textColor: "98,98,98", rect: "720,30,838,73"}
login = Field.new(login_button_options)


col1_heading = Field.new(name: "Title", contents: "  Title", width: 306, height: 25, left: 24, top: 439, textFont: "Arial Bold", showBorder: true)
col2_heading = Field.new(name: "Composer", contents: " Composer", width: 198, height: 25, left: 332, top: 439, textFont: "Arial Bold", showBorder: true)
col3_heading = Field.new(name: "Voicing", contents: " Voicing", width: 99, height: 25, left: 532, top: 439, textFont: "Arial Bold", showBorder: true)
col4_heading = Field.new(name: "Category", contents: " Category", width: 100, height: 25, left: 632, top: 439, textFont: "Arial Bold", showBorder: true)
sleep(0.3)
col5_heading = Field.new(name: "Larger_Work", contents: '"Larger Work"', width: 100, height: 25, left: 733, top: 439, textFont: "Arial Bold", showBorder: true)
col6_heading = Field.new(name: "1st_Arranger", contents: '"1st Arranger"', width: 99, height: 25, left: 831, top: 439, textFont: "Arial Bold", showBorder: true)
col7_heading = Field.new(name: "2nd_Arranger", contents: '"2nd Arranger"', width: 103, height: 25, left: 931, top: 439, textFont: "Arial Bold", showBorder: true)
col8_heading = Field.new(name: "URL", contents: '"URL"', width: 87, height: 25, left: 1031, top: 439, textFont: "Arial Bold", showBorder: true)


table_options = {name: "data", width: 1096, height: 400, left: 24, top: 464, showBorder: true}
table = Field.new(table_options)

table.tabStops = '300,500,600,700,800,900,1000,1100,0'
table.hGrid = true
table.vGrid = true
table.vScrollbar = true



data = Song.first
puts data
table.contents = data

home.setCallback= %("on mouseUp" & return & "global socket" & return & "write " & quote & "mouseUp in "  & quote & "& " & " the short name of me " & "to socket socket" & return & "end mouseUp")
remote_call = RemoteView.receive_string
puts
puts "*" * 50
puts
puts "remote call: " + remote_call


app.close
