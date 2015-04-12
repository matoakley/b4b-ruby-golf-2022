require_relative "../lib/golf"

# NOTE:
#
# Specs are in reverse hole order, to save you having to scroll up in the shell
# to read the failures from the first incomplete hole. Start implementing from
# the bottom of this file!

describe Golf do
  describe "#hole_9" do
    it "calculates overall category totals from a two-deep hash" do
      data = {
        department_1: {
          project_1: {cost: 10, revenue: 20, staff: 3},
          project_2: {cost: 5, revenue: 50, staff: 1},
          project_3: {cost: 20, revenue: 40, staff: 2},
        },
        department_2: {
          foo: {cost: 100, revenue: 20, staff: 1},
          bar: {cost: 50, revenue: 500, staff: 10},
        },
      }

      expect(subject.hole_9 data).to eq cost: 185, revenue: 630, staff: 17
    end

    it "handles arbitrary keys" do
      top_trumps = {
        "Buffy the Vampire Slayer" => {
          "Buffy Summers" => {combat_day: 10, combat_night: 10, fright_factor: 1, killer_rating: 100, intelligence: 75},
          "Willow Rosenberg" => {combat_day: 3, combat_night: 2, fright_factor: 1, killer_rating: 25, intelligence: 99},
          "Spike" => {combat_day: 3, combat_night: 9, fright_factor: 9, killer_rating: 60, intelligence: 75},
        },
        "Angel" =>  {
          "Angel" => {combat_day: 5, combat_night: 10, fright_factor: 7, killer_rating: 100, intelligence: 95},
          "Angelus" => {combat_day: 4, combat_night: 10, fright_factor: 9, killer_rating: 100, intelligence: 90},
          "Doyle" => {combat_day: 3, combat_night: 4, fright_factor: 1, killer_rating: 40, intelligence: 74},
        },
      }

      expect(subject.hole_9 top_trumps).to eq combat_day: 28, combat_night: 45, fright_factor: 28, killer_rating: 425, intelligence: 508
    end
  end

  describe "#hole_8" do
    it "Prints a letter frequency count" do
      expect(subject.hole_8 "This is the penultimate hole. Nearly there! Who's winning so far?").to eq <<-EOF.chomp
A: 3
B: 0
C: 0
D: 0
E: 7
F: 1
G: 1
H: 5
I: 5
J: 0
K: 0
L: 3
M: 1
N: 5
O: 3
P: 1
Q: 0
R: 3
S: 4
T: 5
U: 1
V: 0
W: 2
X: 0
Y: 1
Z: 0
      EOF
    end
  end

  describe "#hole_7" do
    it "encrpypts using a caesar cypher (each letter moved n characters on in the alphabet, then grouped into fives)" do
      expect(subject.hole_7 "Only two more holes to go after this", 10).to eq "YXVID GYWYB ORYVO CDYQY KPDOB DRSC"
    end

    it "ignores non-alphabetic characters" do
      expect(subject.hole_7 "Time for another pint? :-)", -3).to eq "QFJBC LOXKL QEBOM FKQ"
    end
  end

  describe "#hole_6" do
    it "Sings 'happy birthday'" do
      expect(subject.hole_6 "IPRUG").to eq <<-EOF.chomp
Happy birthday to you
Happy birthday to you
Happy birthday dear IPRUG
Happy birthday to you
      EOF
    end
  end

  describe "#hole_5" do
    it "determines whether two words are anagrams" do
      expect(subject.hole_5 "santa", "satan").to be_truthy
      expect(subject.hole_5 "bury", "ruby").to be_truthy
      expect(subject.hole_5 "ants", "satan").to be_falsy
      expect(subject.hole_5 "rub", "ruby").to be_falsy
    end

    it "ignores case, spaces and punctuation" do
      expect(subject.hole_5 "Ipswich ruby user group", "Syrup usurer (wig-phobic!)").to be_truthy
    end
  end

  describe "#hole_4" do
    it "outlines a rectangle of the supplied size" do
      expect(subject.hole_4 4, 2).to eq <<-EOF.chomp
+----+
|    |
|    |
+----+
      EOF
    end

    it "can handle zero sizes" do
      expect(subject.hole_4 0, 0).to eq <<-EOF.chomp
++
++
      EOF
    end
  end

  describe "#hole_3" do
    it "returns all integer factors of its input" do
      expect(subject.hole_3 12).to match_array [1, 2, 3, 4, 6, 12]
      expect(subject.hole_3 25).to match_array [1, 5, 25]
    end
  end

  describe "#hole_2" do
    it "sorts words by number of consonants" do
      expect(subject.hole_2 "Welcome to IPRUG").to eq "to IPRUG Welcome"
    end

    it "sorts words with the same number of consonants by number of vowels" do
      expect(subject.hole_2 "April ruby meetup").to eq "ruby April meetup"
    end

    it "sorts words with the same number of consonents and vowels alphabetically (ignoring case)" do
      expect(subject.hole_2 "Play ruby golf").to eq "golf Play ruby"
    end
  end

  describe "#hole_1" do
    it "draws a triangle up to the supplied letter" do
      expect(subject.hole_1 "E").to eq <<-EOF.chomp
A
BB
CCC
DDDD
EEEEE
      EOF
    end

    it "also works for lower case characters" do
      expect(subject.hole_1 "c").to eq <<-EOF.chomp
a
bb
ccc
      EOF
    end
  end
end
