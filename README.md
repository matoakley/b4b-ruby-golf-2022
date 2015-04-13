IPRUG Ruby Golf 2015
====================

[IPRUG, 14 April 2015](http://iprug.org/2015/03/17/april-meeting-ruby-golf/)

Time for another Ruby golf challenge – can you pare your code down to fewer
characters than everyone else?

There will be nine "holes" to complete. I'll provide the tests to describe them
on the night, to stop anyone getting a head start. And because I haven't
written them yet.

The winner is whoever gets the lowest total score for all nine, or if no-one
finishes then the lowest total for the furthest hole (if that makes sense). No
prizes I'm afraid, apart from the admiration of your peers.

Requirements
------------

Ruby 2.2 (so everyone's on a level playing field in terms of language features).

Setup
-----

Before you turn up (to avoid having to download everything on the night over
dodgy wifi):

    git clone https://github.com/kerryb/iprug-rubygolf-2015.git
    cd iprug-rubygolf-2015
    gem install bundler
    bundle

You'll probably want to grab an
[offline copy of the Ruby API docs](http://ruby-doc.org/downloads/) too.

Testing
-------

Run rake, and you should see something like this:

    $ bundle exec rake
    .........

    Finished in 0.0019 seconds (files took 0.07298 seconds to load)
    9 examples, 0 failures


      +--------+---------+---------+
      |  Hole  |  Shots  |  Total  |
      +--------+---------+---------+
      |    1   |    10   |     10  |
      +--------+---------+---------+
      |    2   |     0   |     10  |
      +--------+---------+---------+
      |    3   |     0   |     10  |
      +--------+---------+---------+
      |    4   |     0   |     10  |
      +--------+---------+---------+
      |    5   |     0   |     10  |
      +--------+---------+---------+
      |    6   |     0   |     10  |
      +--------+---------+---------+
      |    7   |     0   |     10  |
      +--------+---------+---------+
      |    8   |     0   |     10  |
      +--------+---------+---------+
      |    9   |     0   |     10  |
      +--------+---------+---------+

Rules
-----

* No editing of any file apart from `lib/golf.rb`
* All code must go in the methods that are already there (`hole_1` etc)
* No extra classes or methds, evaluation of other files or any other creative cheating
* The `def ...` line and the final `end` of each method don't count towards the score
* Whitespace **does** count, apart from newlines and indentation
