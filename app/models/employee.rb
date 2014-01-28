class EmployeeValidator < ActiveModel::Validator
  def validate(record)
    #Date Validations
    record.errors[:joining_date]<<": Joining Date should be after 1989" unless record.joining_date.year>=1989  if record.joining_date!=nil
    record.errors[:joining_date]<<": Exit Date comes before Joining Date" unless record.joining_date<=record.exit_date if record.joining_date!=nil && record.exit_date!=nil

  end
end

class Employee < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :category, :joining_date, :number, :exit_date, :name, :location, :position
  self.primary_key = 'number'

  #ASSOCIATIONS
  has_many :passports, :foreign_key => "employee_number", :autosave => true, :dependent => :destroy
  has_many :visas, :through => :passport, :autosave => true
  has_one :passport, :class_name => 'Passport', :foreign_key => 'employee_number', :conditions => { :isDeleted=>0 }
  accepts_nested_attributes_for :passport, :visas

  #VALIDATIONS
  include ActiveModel::Validations
  validates_presence_of :joining_date, :number, :name
  validates_uniqueness_of :number
  validates_with EmployeeValidator

  #METHODS

  def current_passport
    employee.passports.each do |employee|

    end
  end
  def location=(location)
    if location==nil
      write_attribute(:location,"Unknown")
    elsif location.downcase=="blr"
      write_attribute(:location,"Bangalore".upcase)
    else
      write_attribute(:location,location.upcase)
    end
  end

  def delete!
    self.passport.delete if self.passport!=nil
    self[:isDeleted]=1
    self.save!
  end

  def isDeleted?
    self[:isDeleted]==1
  end

  def self.passports_about_to_expire(years_in_number)
    days = years_in_number*365
    Employee.joins(:passports).find(:all, :conditions => ['expiry_date > ? AND expiry_date < ?', Date.today, Date.today+ days])
  end

  def self.search(params, page_count)
    if params.size>5
      visa_type=params[:visa_type]
      location=params[:location]
      min_expiry_date=params[:min_expiry_date].empty? ? Date.today-30.years : params[:min_expiry_date]
      max_expiry_date=params[:max_expiry_date].empty? ? Date.today+30.years : params[:max_expiry_date]
      Employee.joins { passports.visas }.where { (visas.visa_type_name.like "%#{visa_type}%")& (employees.location.like "%#{location}%")&(visas.expiry_date>>("#{min_expiry_date}".."#{max_expiry_date}")) }.paginate(:page => params[:page], :per_page => page_count)
    else
      Employee.paginate(:page => params[:page], :per_page => 30)
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end

