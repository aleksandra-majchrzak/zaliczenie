require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  
  it { should have_many :tickets }
  it { should belong_to :owner }
  it { should have_and_belong_to_many :members }
  it { should accept_nested_attributes_for :members }
  
end