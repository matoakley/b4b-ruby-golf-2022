require "rspec/core/rake_task"
require "debugger"

RSpec::Core::RakeTask.new(:rspec)

task :default => [:check_version, :specs, :score]

task :check_version do
  fail "Please run using Ruby 1.9.3" unless RUBY_VERSION == "1.9.3"
end

task :specs do
  begin
    Rake::Task[:rspec].invoke
  rescue RuntimeError
  end
end

task :score do
  Scorer.new(File.expand_path("../spec_output.txt", __FILE__)).print_scores
end

class Scorer
  def initialize file
    spec_output = File.read file
    @scores = (1..2).map {|hole| Score.calculate hole, spec_output }
  end

  def print_scores
    puts <<-EOF

  +--------+---------+---------+
  |  Hole  |  Shots  |  Total  |
  +--------+---------+---------+
    EOF
    @scores.each do |score|
      score.print
      puts "  +--------+---------+---------+"
    end
  end
end

class Score
  class Failed
    def initialize hole
      @hole = hole
    end

    def print
      puts "  |   %2d   |  Failed |   ---   |" % @hole
    end
  end

  def initialize hole
    @hole = hole
  end

  def self.calculate hole, spec_output
    completed_hole?(hole, spec_output) ? new(hole) : Failed.new(hole)
  end

  def self.completed_hole? hole, spec_output
    spec_output !~ /^\s*\d+\) Golf.hole_#{hole}\s/
  end

  def print
    puts "  |   %2d   |   %3d   |         |" % [@hole, 42]
  end
end
