IPRUG Ruby Golf 2013
====================

Time for another Ruby golf challenge – can you pare your code down to fewer characters than everyone else?

There will be nine "holes" to complete (I'll provide the tests to describe them on the night, to stop anyone getting a head start). The winner is whoever gets the lowest total score for all nine, or if no-one finishes then the lowest total for the furthest hole (if that makes sense). No prizes I'm afraid, apart from the admiration of your peers.

Requirements
------------

Ruby 1.9.3 (any patchlevel, but has to be 1.9.3 so everyone's on a level playing field in terms of language features).

Setup
-----

Before you turn up (to avoid having to download everything on the night over dodgy wifi):

    git clone https://github.com/kerryb/iprug-rubygolf-2013.git
    cd iprug-rubygolf-2013
    gem install bundler
    bundle

Testing
-------

Run rake, and you should see something like this:

    $ rake
    ruby -S rspec ./spec/golf_spec.rb
    FFFFFFFFF

    Failures:

      1) Golf.hole_1 needs a problem to solve
         Failure/Error: fail
         RuntimeError:
         # ./spec/golf_spec.rb:6:in `block (3 levels) in <top (required)>'

      # ... more failure messages ...

    Finished in 0.00355 seconds
    9 examples, 9 failures

    Failed examples:

    rspec ./spec/golf_spec.rb:5 # Golf.hole_1 needs a problem to solve
    rspec ./spec/golf_spec.rb:11 # Golf.hole_2 needs a problem to solve
    rspec ./spec/golf_spec.rb:17 # Golf.hole_3 needs a problem to solve
    rspec ./spec/golf_spec.rb:23 # Golf.hole_4 needs a problem to solve
    rspec ./spec/golf_spec.rb:29 # Golf.hole_5 needs a problem to solve
    rspec ./spec/golf_spec.rb:35 # Golf.hole_6 needs a problem to solve
    rspec ./spec/golf_spec.rb:41 # Golf.hole_7 needs a problem to solve
    rspec ./spec/golf_spec.rb:47 # Golf.hole_8 needs a problem to solve
    rspec ./spec/golf_spec.rb:53 # Golf.hole_9 needs a problem to solve

      +--------+---------+---------+
      |  Hole  |  Shots  |  Total  |
      +--------+---------+---------+
      |    1   |  Failed |   ----  |
      +--------+---------+---------+
      |    2   |  Failed |   ----  |
      +--------+---------+---------+
      |    3   |  Failed |   ----  |
      +--------+---------+---------+
      |    4   |  Failed |   ----  |
      +--------+---------+---------+
      |    5   |  Failed |   ----  |
      +--------+---------+---------+
      |    6   |  Failed |   ----  |
      +--------+---------+---------+
      |    7   |  Failed |   ----  |
      +--------+---------+---------+
      |    8   |  Failed |   ----  |
      +--------+---------+---------+
      |    9   |  Failed |   ----  |
      +--------+---------+---------+

Rules
-----

* No editing of any file apart from `lib/golf.rb`
* All code must go in the methods that are already there (`hole_1` etc)
* Whitespace **does** count (apart from the spaces before the `def`)
