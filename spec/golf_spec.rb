require_relative "../lib/golf"

# NOTE:
#
# Specs are in reverse hole order, to save you having to scroll up in the shell
# to read the failures from the first incomplete hole. Start implementing from
# the bottom of this file!

describe Golf do
  describe ".hole_9" do
    it "returns the longest common substring of two strings" do
      expect(Golf.hole_9 "This is a string", "Bring a bottle").to eq "ring"
    end

    it "returns an empty string if there is no match" do
      expect(Golf.hole_9 "ruby", "java").to eq ""
    end

    it "returns the first if there are multiple same-length matches" do
      expect(Golf.hole_9 "string", "straight thing").to eq "str"
    end
  end

  describe ".hole_8" do
    it "converts blank-line-separated paragraphs into HTML" do
      text = <<-EOF
This is a paragraph.
This is part of the same paragraph.

But this is a new paragraph.
      EOF
      expect(Golf.hole_8 text).to eq <<-EOF
<p>
This is a paragraph.
This is part of the same paragraph.
</p>
<p>
But this is a new paragraph.
</p>
      EOF
    end

    it "allows any number of blank lines as a paragraph separator" do
      expect(Golf.hole_8 "Para 1\n\n\n\nPara 2").
        to eq "<p>\nPara 1\n</p>\n<p>\nPara 2\n</p>\n"
    end

    it "ignores leading and trailing blank lines" do
      expect(Golf.hole_8 "\n\nFoo\n\n").to eq "<p>\nFoo\n</p>\n"
    end
  end

  describe ".hole_7" do
    it "sings 'ten green bottles'" do
      expect(Golf.hole_7).to eq <<-EOF
Ten green bottles hanging on the wall
Ten green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be nine green bottles hanging on the wall

Nine green bottles hanging on the wall
Nine green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be eight green bottles hanging on the wall

Eight green bottles hanging on the wall
Eight green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be seven green bottles hanging on the wall

Seven green bottles hanging on the wall
Seven green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be six green bottles hanging on the wall

Six green bottles hanging on the wall
Six green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be five green bottles hanging on the wall

Five green bottles hanging on the wall
Five green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be four green bottles hanging on the wall

Four green bottles hanging on the wall
Four green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be three green bottles hanging on the wall

Three green bottles hanging on the wall
Three green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be two green bottles hanging on the wall

Two green bottles hanging on the wall
Two green bottles hanging on the wall
And if one green bottle should accidentally fall
There'd be one green bottle hanging on the wall

One green bottle hanging on the wall
One green bottle hanging on the wall
And if one green bottle should accidentally fall
There'd be no green bottles hanging on the wall
      EOF
    end
  end

  describe ".hole_6" do
    it "generates the first n fibonnaci numbers" do
      expect(Golf.hole_6 5).to eq [1, 1, 2, 3, 5]
    end

    it "works for reasonably large values of n" do
      expect(Golf.hole_6(100).last).to eq 354224848179261915075
    end
  end

  describe ".hole_5" do
    it "returns an ordered list of letters in a string" do
      expect(Golf.hole_5 "rubygolf").to eq "b, f, g, l, o, r, u, y"
    end

    it "treats upper and lower case as the same letter" do
      expect(Golf.hole_5 "Ruby").to eq "b, r, u, y"
    end

    it "compresses three or more consecutive letters into a range" do
      expect(Golf.hole_5 "lemon").to eq "e, l-o"
    end

    it "ignores duplicate letters" do
      expect(Golf.hole_5 "Javascript").to eq "a, c, i, j, p, r-t, v"
    end

    it "ignores spaces and punctuation" do
      expect(Golf.hole_5 "It's all Ruby (also HTML, Javascript [or Coffeescript] & CSS)!").
        to eq "a-c, e, f, h-j, l, m, o, p, r-v, y"
    end
  end

  describe ".hole_4" do
    it "converts numbers 1 to 10 into words" do
      expect(Golf.hole_4 "1 2 3 4 5 6 7 8 9 10").
        to eq "one two three four five six seven eight nine ten"
    end

    it "ignores numbers over ten" do
      expect(Golf.hole_4 "5 20 10 and 500").to eq "five 20 ten and 500"
    end
  end

  describe ".hole_3" do
    it "censors words from a list" do
      expect(Golf.hole_3 "We like Ruby more than Java, Python or Perl", %w{Java Python Perl}).
        to eq "We like Ruby more than J***, P***** or P***"
    end

    it "does not suffer from the Scunthorpe effect" do
      expect(Golf.hole_3 "Languages include Java, Javascript and Ruby", %w{Java script ava}).
        to eq "Languages include J***, Javascript and Ruby"
    end
  end

  describe ".hole_2" do
    it "calculates the sum of squares of a list of numbers" do
      expect(Golf.hole_2 [2, 4, 10]).to eq 120
    end

    it "returns zero for an empty array" do
      expect(Golf.hole_2 []).to be_zero
    end
    it "can handle a single number (not in an array)" do
      expect(Golf.hole_2 5).to eq 25
    end
  end

  describe ".hole_1" do
    it "sorts words in ascending order of how many vowels they contain" do
      expect(Golf.hole_1 %w{orange grapefruit apple fig}).to eq %w{fig apple orange grapefruit}
    end

    it "recognises upper and lower case vowels" do
      expect(Golf.hole_1 %w{JAVASCRIPT ruby java}).to eq %w{ruby java JAVASCRIPT}
    end

    it "doesn't count Y as a vowel" do
      expect(Golf.hole_1 %w{road byway}).to eq %w{byway road}
    end
  end
end
