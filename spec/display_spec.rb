require 'spec_helper'

describe Display do
  let(:display) { Display.new }
  let(:rows) { rows = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }
  let(:cols) { cols = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }

  it "calculates the maximum character size for all cells" do
    display.max_cell_size(rows, cols).should == 3
  end

  it "should generate 'r1c1' string for cell(1,1)" do
    max_chars = display.max_cell_size(rows, cols)
    display.r1c1(max_chars).should == "   "
  end

  it "should generate 'dashes' string" do
    max_chars = display.max_cell_size(rows, cols)
    display.dashes(max_chars).should == "-----"
  end

  it "should generate 'underline' string" do
    max_chars = display.max_cell_size(rows, cols)
    dashes = display.dashes(max_chars)
    display.underline(rows, dashes).should == "-----+-----+-----+-----+-----+-----+-----+-----+-----+-----"
  end

  it "generates row right justified cell" do
    max_chars = display.max_cell_size(rows, cols)
    cell = display.cell_right_justified(1, max_chars)
    cell.should == "  1"
  end
end