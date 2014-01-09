class Employee < ActiveRecord::Base
  attr_accessible :category, :date_of_joining, :employee_id, :exit_date, :name, :location, :position
  self.primary_key = 'employee_id'
  has_one :passport, :autosave => true, :dependent => :destroy
  has_many :visas, :autosave => true, :through => :passport
  validates_uniqueness_of :employee_id

  def location=(location)
    if location==nil
      write_attribute(:location,"Unknown")
    elsif location.downcase=="blr"
      write_attribute(:location,"Bangalore".upcase)
    else
      write_attribute(:location,location.upcase)
    end
  end

  def self.search(search)
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  end

end
