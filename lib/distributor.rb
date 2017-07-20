class Distributor <ActiveRecord::Base
  validates(:distributor_name, :presence => true)
  validates(:tel, :length => { :maximum => 11})
  before_save(:titlecase_distributor_name)

  private

  define_method(:titlecase_distributor_name) do
    self.distributor_name=(distributor_name().titlecase())
  end
end
