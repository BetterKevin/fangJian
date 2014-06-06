require 'spec_helper'

describe Category do
  before { @category = Category.new(name: "饮料") }
  subject { @category }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @category.name = ''}
    it { should_not be_valid }
  end

  describe "when name is not unique" do
    before do
      category_with_same_name = @category.dup
      category_with_same_name.save
    end
    it { should_not be_valid }
  end

end
