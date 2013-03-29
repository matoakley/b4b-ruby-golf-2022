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
    @holes = (1..2).map {|n| Hole.score n, spec_output }
  end

  def print_scores
    puts <<-EOF

  +--------+---------+---------+
  |  Hole  |  Shots  |  Total  |
  +--------+---------+---------+
    EOF
    @holes.each do |hole|
      hole.print
      puts "  +--------+---------+---------+\n"
    end
  end
end

class Hole
  class Failed
    def initialize number
      @number = number
    end

    def print
      puts "  |   %2d   |  Failed |   ---   |" % @number
    end
  end

  def initialize number
    @number = number
  end

  def self.score number, spec_output
    completed?(number, spec_output) ? new(number) : Failed.new(number)
  end

  def self.completed? number, spec_output
    spec_output !~ /^\s*\d+\) Golf.hole_#{number}\s/
  end

  def print
    puts "  |   %2d   |   %3d   |         |" % [@number, 42]
  end
end
