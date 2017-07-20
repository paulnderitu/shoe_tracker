class Distributor <ActiveRecord::Base
  validates(:name, :presence => true)
  vlidates(:tel, :length => { :maximum => 10})
end
