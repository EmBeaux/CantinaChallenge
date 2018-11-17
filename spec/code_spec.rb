require 'spec_helper'
require 'pry'

RSpec.describe 'test with aruba' do
  it 'tests code.rb' do
    setup_aruba
    directory = "/Users/matthewbowler/challenges/CantinaChallenge"
    run "ruby #{directory}/code.rb"

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to eq("Please put enter in an Identifier(ex: #identifier), Class Name(ex: .className), or Class(ex: class). The views will then be returned.\n")
  end

  it 'tests Class Box' do
    setup_aruba
    directory = "/Users/matthewbowler/challenges/CantinaChallenge"
    run "ruby #{directory}/code.rb"
    type "Box"

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to include("Total results = 5")
  end

  it 'tests ClassName .container' do
    setup_aruba
    directory = "/Users/matthewbowler/challenges/CantinaChallenge"
    run "ruby #{directory}/code.rb"
    type ".container"

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to include("Total results = 6")
  end

  it 'tests identifier #textureMode' do
    setup_aruba
    directory = "/Users/matthewbowler/challenges/CantinaChallenge"
    run "ruby #{directory}/code.rb"
    type "#textureMode"

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to include("Total results = 1")
  end

  it 'tests identifier #rate' do
    setup_aruba
    directory = "/Users/matthewbowler/challenges/CantinaChallenge"
    run "ruby #{directory}/code.rb"
    type "#rate"

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to include("Total results = 1")
  end
end
