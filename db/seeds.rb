require 'rubygems'
require 'roo'


#Sl.No
#ExpiryReminder?
#Current Employee?
#ID
#Name
#Position
#Category
#DOJ
#Passport Expiry Date
#Passport Number
#Seperation date
#Location
#Citizenship

#B-1 Status
#B-1 Issue Date
#B-1 Expiry Date

#L1A Status
#L1A Issue Date
#L1A Expiry Date

#L1B Status
#L1B Issue Date
#L1B Expiry Date


#UK Work Visa Status
#UK Work Visa Type
#UK Work Visa Issued On
#UK Work Visa Expiry Date
#Date of Return
#Travel By

#UK Business Visa Status
#UK Business Visa Issued On
#UK Business Visa Expiry Date


#Shengan Visa Status
#Shengan Visa Country
#Shengan Visa Issue Date
#Shengan Visa Expiry Date


#Oz Business Visa Status
#Oz Business Visa Type
#Oz Business Visa Issue Date
#Oz Business Visa Expiry Date


#Oz Work Permit Status
#Oz Work Permit Type
#Oz Work Permit Issue Date
#Oz Work Permit Expiry Date


#Canadian Work Permit Status
#Canadian Work Permit Reason
#Canadian Work Permit Issue Date
#Canadian Work Permit Expiry Date


#Canadian Business Visa Status
#Canadian Business Visa Reason
#Canadian Business Visa Issue Date
#Canadian Business Visa Expiry Date


#Brazil Work Permit Status
#Brazil Work Permit Reason
#Brazil Work Permit Issue Date
#Brazil Work Permit Expiry Date



#Brazil Business Visa Status
#Brazil Business Visa Reason
#Brazil Business Visa Issue Date
#Brazil Business Visa Expiry Date

#Chineese Visa Status
#Chineese Visa Reason / Category
#Chineese Visa Issue Date
#Chineese Visa Expiry Date

#Singapore Visa Status
#Singapore Visa Reason
#Singapore Visa Issue Date
#Singapore Visa Expiry Date

#Singapore Work visa status
#Singapore Visa Issue Date2
#Singapore visa Expiry Date2

#Uganda Special Pass
#Uganda Special pass Issue Date
#Uganda Special Pass Expiry Date

#India Employment Visa Status
#India Employment Visa Reason
#India Employment Visa Issue Date
#India Employment Visa Expiry Date

#ZA Business Visa Status
#ZA Business Visa Issued On
#ZA Business Visa Expiry Date


#ZA Work Visa Status
#ZA Work Visa Issued On
#ZA Work Visa Expiry Date


class VisaTypeSeeder
  def VisaTypeSeeder.seed
    VisaType.create(:country => '', :visa_type => 'B1')
    VisaType.create(:country => '', :visa_type => 'L1A')
    VisaType.create(:country => '', :visa_type => 'L1B')
    VisaType.create(:country => 'UK', :visa_type => 'UK Work Visa')
    VisaType.create(:country => 'UK', :visa_type => 'UK Business Visa')
    VisaType.create(:country => 'China', :visa_type => 'Shengan Visa')
    VisaType.create(:country => 'Australia', :visa_type => 'Oz Business Visa')
    VisaType.create(:country => 'Australia', :visa_type => 'Oz Work Permit')
    VisaType.create(:country => 'Canada', :visa_type => 'Canadian Work Permit')
    VisaType.create(:country => 'Canada', :visa_type => 'Canadian Work Visa')
    VisaType.create(:country => 'Brazil', :visa_type => 'Brazil Work Permit')
    VisaType.create(:country => 'Brazil', :visa_type => 'Brazil Business Visa')
    VisaType.create(:country => 'China', :visa_type => 'Chinese Visa')
    VisaType.create(:country => 'Singapore', :visa_type => 'Singapore Visa')
    VisaType.create(:country => 'Singapore', :visa_type => 'Singapore Work Visa')
    VisaType.create(:country => 'Uganda', :visa_type => 'Uganda Special Pass')
    VisaType.create(:country => 'India', :visa_type => 'India Employment Visa')
    VisaType.create(:country => 'Zimbabwe', :visa_type => 'ZA Business Visa')
    VisaType.create(:country => 'Zimbabwe', :visa_type => 'ZA Work Visa')
  end
end

class EmployeeSeeder
  def EmployeeSeeder.seed
    data=Roo::Excelx.new('db/content.xlsx')
    data.default_sheet= data.sheets.first
    puts "FOUND SPREADSHEET"
    puts "#{data.info}"
    visaTypeConfig = [3,3,3,6,3,4,4,4,4,4,4,4,4,4,3,3,4,3,3]
    visaTypeList = VisaType.all(:order => 'created_at')
    if visaTypeConfig.size == visaTypeList.size
      for row in 3..data.last_row
        id= data.cell(row,4)
        name= data.cell(row,5)
        position= data.cell(row,6)
        category= data.cell(row,7)
        date_of_joining= data.cell(row,8)
        date_of_expiry= data.cell(row,9)
        passport_number= data.cell(row,10)
        exit_date=data.cell(row,11)
        location= data.cell(row,12)
        citizenship= data.cell(row,13)
        currentEmp = Employee.new({:employee_id => id,:name => name, :position => position, :category => category, :date_of_joining => date_of_joining, :exit_date => exit_date, :location => location} )
        currentEmp.passport= Passport.new({:passport_number => passport_number, :citizenship => citizenship,:date_of_expiry => date_of_expiry}) if passport_number!=nil
        currentPos=14
        for visaTypeCount in 0...visaTypeList.size
          status=data.cell(row,currentPos)
          if status!=nil && status!= "" && currentEmp.passport!=nil
            visa = Visa.new(:status => status)
            visa.visa_type = visaTypeList[visaTypeCount]
            #currentEmp.passport.visas << visa
          end
          currentPos+=visaTypeConfig[visaTypeCount]
        end
        currentEmp.save
        puts "JUST PUT #{currentEmp}"
      end
    else
      puts "ISSUE WITH SEEDING. CHECK SEED CONFIGURATION"
    end
  end
end

VisaTypeSeeder.seed
EmployeeSeeder.seed






