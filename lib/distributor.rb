class Distribution <ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, :presence => true)
  validates(:tel, :length => { :maximum => 11})
  before_save(:titlecase_name)

  private

  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
