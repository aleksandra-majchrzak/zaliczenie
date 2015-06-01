require 'rails_helper'

describe Ticket do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :priority }
  it 'has got attachment of certain type'
  it 'has got attachment of certain name'
  it 'has got attachment of certain size'
end