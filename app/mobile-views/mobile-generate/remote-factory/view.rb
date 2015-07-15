class Control

  attr_reader :rect, :top, :left, :bottom, :right, :textFont, :textSize, :textColor, \
  :textAlign, :name, :height, :width, :opaque, :showBorder

  def initialize(options = {})


    type_to_create = self.class.to_s
    puts "class: ", type_to_create
    if options[:name]
      remote_create(type_to_create, options[:name])
      options.delete(:name)
    else
      remote_create(type_to_create, "new_" + type_to_create)
    end

    options.each do |property, value|
      #puts "sending: #{(property.to_s + '=').to_sym} , #{value}"
      send((property.to_s + '=').to_sym, value)
    end
  end

  def remote_create(object, name)
    RemoteView.send_string("create #{object} " + '"' + name +'"')
    @id = RemoteView.receive_string
    #puts "create  #{object} " + '"' + name +'"'
  end

  def set_prop(prop, value)
    if prop == :contents
      RemoteView.send_string("put #{value} into " + @id.to_s)
    else
      puts "set the #{prop} of " + @id.to_s + " to #{value}"
      RemoteView.send_string("set the #{prop} of " + @id.to_s + " to #{value}")
    end
    RemoteView.receive_string
  end

  def rect=(left_top_right_bottom)
    set_prop("rect", '"' + left_top_right_bottom + '"')
    rect_ar = left_top_right_bottom.split(',')
    @left, @top, @right, @bottom = rect_ar
  end

  def name=(name)
    @name = name
    set_prop("name", top)
  end

  def top=(top)
    @top = top
    set_prop("top", top)
  end

  def height=(height)
    @height = height
    set_prop("height", height)
  end

  def width=(width)
    @width = width
    set_prop("width", width)
  end

  def left=(x)
    @left = x
    set_prop("left", x)
  end

  def opaque=(value)
    @opaque = value
    set_prop("opaque", value)
  end

  def showBorder=(value)
    @showBorder = value
    set_prop("showBorder", value)
  end

  def textFont=(name)
    @textFont = name
    set_prop("textFont", '"'+ name + '"')
  end

  def textAlign=(value)
    @textAlign = value
    set_prop("textAlign", value)
  end

  def textSize=(value)
    @textSize = value
    set_prop("textSize", value)
  end

  def textColor=(value)
    @textColor = value
    set_prop("textColor", '"' + value + '"')
  end

  def setCallback=(script)
    @callBack = script
    set_prop("script", script )
    puts script
  end

  def delete
    RemoteView.send_string("delete " + @id.to_s)
  end

  def script=(script)
    set_prop("script", script)

  end

end

def delete(the_class, name)
  @deleted = true
  RemoteView.send_string ("delete " + the_class + ' "' + name + '"')
end

class Field < Control
  attr_reader :contents, :locktext, :contents

  def contents=(contents)
    @contents = contents
    set_prop(:contents, contents)
  end

  def locktext=(value)
    @locktext = value
    set_prop("lockText", value)
  end

  def hGrid=(value)
    @hGrid = value
    set_prop("hGrid", value)
  end

  def vGrid=(value)
    @vGrid = value
    set_prop("vGrid", value)
  end

  def tabStops=(value)
    @tabStops = value
    set_prop("tabStops", value)
  end

  def vScrollbar=(value)
    @vScrollbar = value
    set_prop("vScrollbar", value)
  end

end

class Button < Control


end

class Image < Control
  def src=(path)
    set_prop("filename", '"' + path + '"')
    puts "in set src"
  end
end

class App
  def initialize
    begin
     #`open -a MacOS_UIServer.app`
      sleep(1.0)
      RemoteView.open_connection("localhost", 5555)
    rescue SocketError => e
      puts e.message
    end
    @running = true
  end


  def close
    if @running
      @running = false
      RemoteView.close
    end
  end

  def save
    RemoteView.send_string("save stack")
  end
end


# def properties
#   RemoteView.send_string 'put the properties of ' + @id.to_s + ' into myArray '
#   RemoteView.send_string 'combine myArray using return and ": " '
#   RemoteView.send_string 'sendMessage  myArray '
#   @properties = RemoteView.receive_string
# end
class Song
  def self.first
    '"African Noel" & tab & "Johnson" & tab & tab & "Christmas" & tab & return'
  end
end