require "bundler/setup"
require "pry"
require "rspec/core/rake_task"
require "method_source"
require_relative "lib/golf"

RSpec::Core::RakeTask.new(:rspec)

task :default => [:check_version, :specs, :score]

task :check_version do
  fail "Please run using Ruby 2.2.1" unless RUBY_VERSION == "2.2.1"
end

task :specs do
  begin
    Rake::Task[:rspec].invoke
  rescue Exception
  end
end

task :score do
  Scorer.new(File.expand_path("../spec_output.txt", __FILE__)).print_scores
end

class Scorer
  def initialize file
    spec_output = File.read file
    number_of_holes = spec_output.lines.grep(/^  \#hole_\d+$/).count
    @holes = (1..number_of_holes).map {|n| Hole.score n, spec_output }
  end

  def print_scores
    puts <<-EOF

  +--------+---------+---------+
  |  Hole  |  Shots  |  Total  |
  +--------+---------+---------+
    EOF
    @holes.inject(Total.new) do |total, hole|
      total << hole
      hole.print total
      puts "  +--------+---------+---------+\n"
      total
    end
  end
end

class Hole
  class Failed
    def initialize number
      @number = number
    end

    def success?
      false
    end

    def print total_so_far
      puts "  |   %2d   |  Failed |   %4s  |" % [@number, total_so_far]
    end
  end

  attr_reader :score

  def initialize number
    @number = number
    calculate_score
  end

  def success?
    true
  end

  def self.score number, spec_output
    completed?(number, spec_output) ? new(number) : Failed.new(number)
  end

  def self.completed? number, spec_output
    spec_output !~ /^\s*\d+\) Golf#hole_#{number}\s/
  end

  def print total_so_far
    puts "  |   %2d   |   %3d   |   %4s  |" % [@number, @score, total_so_far]
  end

  private

  def calculate_score
    method = Golf.instance_method :"hole_#{@number}"
    lines = method.source.split(/[\;\n]/)[1..-2].map(&:strip)
    @score = lines.join.length
  end
end

class Total
  def initialize
    @still_playing = true
    @score = 0
  end

  def << hole
    if hole.success?
      @score += hole.score
    else
      @still_playing = false
    end
  end

  def to_s
    @still_playing ? @score.to_s : "----"
  end
end
