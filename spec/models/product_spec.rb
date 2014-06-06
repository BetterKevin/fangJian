require 'spec_helper'

describe Product do
  before { @product = Product.new(name: "鸡腿", price: 5, category_id: 1) }
  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe "when name is not present" do
    before { @product.name = ''}
    it { should_not be_valid }
  end

  describe "when name is not unique" do
    before do
      product_with_same_name = @product.dup
      product_with_same_name.save
    end
    it { should_not be_valid }

  end
end
