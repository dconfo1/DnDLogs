=begin
  This program is made so that a user can input all of their character
  information and their logs shall be automatically made for them.

  @author vict0rem
=end



=begin
  These defs are made to determine the amount of CP a character needs to level
  up and if they did level up how much CP they will need for their next level.
=end
CPneeded = 0
def CP(level)
  if level > 0 && level <= 5
    CPneeded + 4
  elsif level > 5 && level <= 20
    CPneeded + 8
  else
    CPneeded + 0
  end
end

def CP2(level)
  level + 1
  if level > 0 && level <= 5
    CPneeded + 4
  elsif level > 5 && level <= 20
    CPneeded + 8
  else
    CPneeded + 0
  end
end

=begin
  This is all the information the program needs from the user in order to
  create their logs and do all of the necessary calculations.
=end
puts "Enter your character's name: "
name = gets

puts "Enter your character's level (1-20): "
level = gets
level.to_i

puts "Enter your character's race: "
race = gets

puts "Enter your character's class(es): "
classes = gets

puts "Enter the quest name: "
quest = gets

puts "Enter the amount of CP your character currently has: "
CPnow = gets
CPnow.to_f

puts "Enter the name of your current magical item: "
TPitem = gets

puts "Enter the current amount of TP in your magical item: "
TPnow = gets
TPnow.to_f

puts "Enter the total amount of TP needed for your magical item: "
TPneeded = gets
TPneeded.to_i

puts "Enter your character's current GP total: "
GPnow = gets
GPnow.to_f

puts "Enter the amount of CP gained from the quest: "
CPgained = gets
CPgained.to_f

puts "Enter the amount of TP gained from the quest: "
TPgained = gets
TPgained.to_f

puts "Enter the amount of GP gained from the quest: "
GPgained = gets
GPgained.to_f

=begin
  Right at this point the program seems to shut down in command prompt.
=end

CPtotal = CPnow + CPgained
TPtotal = TPnow + TPgained
GPtotal = GPnow + GPgained

CPneeded2
TPitem2
TPneeded2

=begin
  This if-else statement figures out if the user's character did level up and
  depending on if that is true or false it uses either the def CP or CP2.
=end
if CPtotal > CP(level)
  level + 1
  CPneeded = CP2(level)
else
  CPneeded = CP(level)
end

=begin
  This if-else statement checks to see if the user's character receives their
  current magical item. If they do then they must choose their next magical
  item and enter how much TP it neeeds and if they don't then there is no next
  magical item for them to input.
=end
if TPtotal > TPneeded
  TPnow = TPtotal - TPneeded
  puts "Enter the name of your next magical item: "
  TPitem2 = gets
  puts "Enter the total amount of TP needed for this magical item: "
  TPneeded2 = gets
  TPneeded2.to_i
else
  TPitem2 = "N/A"
  TPneeded2 = 0
end

=begin
  This section is to check if the user's character would like to buy or sell
  anything and gets the user to input the prices for the various items.
=end
puts "Are you buying any items (Y or N)? "
buying = gets
if buying == "y"
  puts "What item(s) are you buying? "
  itemsBought = gets
  puts "What is the total cost of these items? "
  itemsBPrice = gets
  itemsBPrice.to_f
  GPtotal = GPtotal - itemsBPrice
else
  itemsBought ="N/A"
  itemsBPrice = 0
end

puts "Are you selling any items (Y or N)? "
selling = gets
if selling == "y"
  puts "What item(s) are you selling? "
  itemsSold = gets
  puts "What is the total cost of these items? "
  itemsSPrice = gets
  itemsSPrice.to_f
  GPtotal = GPtotal + itemsSPrice
else
  itemsSold = "N/A"
  itemsSPrice = 0
end

puts ""
puts ""

=begin
  Everything after this point contains automatically created logs and
  information based off the user's previously made inputs. There are no more
  inputs past here.
=end
puts "Character Information (announced in #character-logs)"
print "Creation:     "
puts "Creating" + name + ", Level" + level + " " + race + " " + classes
print "Death:      "
puts "**DEATH:** " + name + " has fallen in battle during **" + quest + "**."
print "Near-Death Experience:      "
puts name + " dodged death and receives no rewards from **" + quest + "**."

puts ()

puts "Leveling (announced in #character-logs)"
print "Gaining CP/Leveling U:      "
if CPtotal > CPneeded
  puts name + " gains " + CPgained + " CP from **" + quest + "** and levels up
  to level " + level + " (" + (CPtotal - CPneeded) + "/" + CP2(level) + " to
  level " + (level + 1) + ")."
else
  puts name + " gains " + CPgained + " CP from **" + quest + "** (" + CPtotal
  + "/" + CP(level) + " to level " + (level + 1) + ")."
end

puts ()
puts ()

puts "Currency & Items (announced in #purchase-logs)"
print "Gaining TP and GP:     "
if TPtotal > TPneeded
  puts name + " gains " + TPgained + " TP and " + GPgained + " GP from **"
  + quest + "** and puts the TP towards **" + TPitem + "** completing it
  and puts the rest of their TP into **" + TPitem2 + "** (" + TPnow + "/"
    + TPneeded2 + ") and has a total of " + GPtotal + " GP."
  else
    puts name + " gains " + TPgained + " TP and " + GPgained + " GP from **"
    + quest + "** and puts the TP towards **" + TPitem + "** (" + TPnow
    + TPneeded + ") and has a total of " + GPtotal + " GP."
end

  print "Buying Items:      "
  puts name + " buys " + itemsBought + " for " + itemsBPrice + " GP. " + name
  + " now has " + (GPtotal - itemsBPrice) + " GP."
  print "Selling Items:     "
  puts name + " sells " + itemsSold + " for " + itemsSPrice + " GP. " + name
  + " now has " + (GPtotal + itemsSPrice) + " GP."
  print "Buying and Selling Items:      "
  puts name + " buys " + itemsBought + " for " + itemsBPrice + " GP and sells "
  + itemsSold + " for " + itemsSPrice + " GP. " + name + " now has "
  + (GPtotal + itemsSPrice - itemsBPrice) + " GP."

  puts ()
  puts()
  puts()
  puts()
  puts "Thanks for using my program! Have a great time, " + name + "! - vict0rem"

=begin
  This "ending = gets" is so that the program doesn't immediately close once it
  puts out the last line of the program.
=end
ending = gets
