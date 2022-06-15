B4B Ruby Golf 2022
====================

There will be nine "holes" to complete. 

Requirements
------------

Ruby 3.0 (so everyone's on a level playing field in terms of language features).

Setup
-----

    git clone https://github.com/matoakley/b4b-ruby-golf-2022
    cd b4b-ruby-golf-2022
    gem install bundler
    bundle

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
