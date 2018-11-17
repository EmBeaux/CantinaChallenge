require 'json'
require 'pp'
require 'pry'

json = File.read('/Users/matthewbowler/challenges/CantinaChallenge/object.json')
@obj = JSON.parse(json)
puts "Please put enter in an Identifier(ex: #identifier), Class Name(ex: .className), or Class(ex: class). The views will then be returned."
@element = gets.chomp

className = false
rubyClass = false
identifier = false
@count = 0

if @element[0] == '.'
  className = true
  @element[0] = ''
elsif @element[0] == '#'
  identifier = true
  @element[0] = ''
else
  rubyClass = true
end


def parseClassNameFunc(element, starting, parent)
  starting.each do |subview|
    if subview["classNames"] != nil
      if subview["classNames"].include?(element)
        pp subview
        puts "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+="
        @count += 1
        if subview["subviews"] != nil
          parseClassNameFunc(element, subview["subviews"], subview)
        elsif subview["contentView"] != nil
          parseClassNameFunc(element, subview["contentView"]["subviews"], subview)
        end
      else
        parseClassNameFunc(element, subview["subviews"], subview)
      end
    end
  end
end


def parseRubyClassFunc(element, starting, parent)
  starting.each do |subview|
    if subview.class == Array  && subview[0] == "class" && subview[1] == element
      pp starting
      puts "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+="
      @count += 1

    elsif subview.class == Hash && subview["class"] == element
      pp subview
      puts "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+="
      @count += 1
      if subview["subviews"] != nil
        parseRubyClassFunc(element, subview["subviews"], subview)
      elsif subview["contentView"] != nil
        parseRubyClassFunc(element, subview["contentView"]["subviews"], subview)
      end
    else
      if subview.class == Hash && subview["subviews"] != nil
        parseRubyClassFunc(element, subview["subviews"], subview)
      elsif subview.class == Hash && subview["contentView"] != nil
        parseRubyClassFunc(element, subview["contentView"]["subviews"], subview)
      elsif subview.class == Hash && subview["control"] != nil
        parseRubyClassFunc(element, subview["control"], subview)
      end
    end
  end
end


def parseIdentifierFunc(element, starting, parent)
  starting.each do |subview|
    if subview.class == Array && subview[0] == "identifier" && subview[1] == element
      pp starting
      puts "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+="
      @count += 1
    elsif subview.class == Hash && subview["identifier"] == element
      pp subview
      puts "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+="
      @count += 1
      if subview["subviews"] != nil
        parseIdentifierFunc(element, subview["subviews"], subview)
      end
    else
      if subview.class == Hash && subview["subviews"] != nil
        parseIdentifierFunc(element, subview["subviews"], subview)
      elsif subview.class == Hash && subview["contentView"] != nil
        parseIdentifierFunc(element, subview["contentView"]["subviews"], subview)
      elsif subview.class == Hash && subview["control"] != nil
        parseIdentifierFunc(element, subview["control"], subview)
      elsif subview.class == Array && subview[1].class == Array
        parseIdentifierFunc(element, subview[1], subview)
      end
    end
  end
end

def countTrack
  puts "Total results = #{@count}"
  @count = 0
end

if className == true
  parseClassNameFunc(@element, @obj["subviews"], @obj)
  countTrack()
end

if rubyClass == true
  parseRubyClassFunc(@element, @obj["subviews"], @obj)
  countTrack()
end
if identifier == true
  parseIdentifierFunc(@element, @obj, @obj)
  countTrack()
end
