# CantinaChallenge

run -> "**ruby code.rb**" to start the program.

run -> "**rspec**" to test the program.

Use this tool to parse through the object.json file and gather views that match the selected ClassName, Identifier, or Class.

These inputs are recognized in the code by what preceeds them, so a ClassName will be started with a '.', an Identifier will be started with a '#', and a Class will be preceeded by nothing. This is similar to the naming convention when doing CSS.

**Technology**

I store the data in a javascript object and iterate through it with a recursive function made in Ruby.

I utilize the Ruby gem 'PP';  this gem ensures a more readable hash in the terminal.

I utilize the gem 'Aruba' and the gem 'RSpec'. These are both used to test my command line interface
