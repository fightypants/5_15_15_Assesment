class Venue < ActiveRecord::Base
  validates_presence_of(:name)
  before_save(:capitalize_name)

  private

  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end
end
