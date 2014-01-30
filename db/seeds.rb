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
    VisaType.create(:country => '', :name => 'B1')
    VisaType.create(:country => '', :name => 'L1A')
    VisaType.create(:country => '', :name => 'L1B')
    VisaType.create(:country => 'UK', :name => 'UK Work Visa')
    VisaType.create(:country => 'UK', :name => 'UK Business Visa')
    VisaType.create(:country => 'China', :name => 'Shengan Visa')
    VisaType.create(:country => 'Australia', :name=> 'Oz Business Visa')
    VisaType.create(:country => 'Australia', :name => 'Oz Work Permit')
    VisaType.create(:country => 'Canada', :name => 'Canadian Work Permit')
    VisaType.create(:country => 'Canada', :name => 'Canadian Work Visa')
    VisaType.create(:country => 'Brazil', :name => 'Brazil Work Permit')
    VisaType.create(:country => 'Brazil', :name => 'Brazil Business Visa')
    VisaType.create(:country => 'China', :name => 'Chinese Visa')
    VisaType.create(:country => 'Singapore', :name => 'Singapore Visa')
    VisaType.create(:country => 'Singapore', :name => 'Singapore Work Visa')
    VisaType.create(:country => 'Uganda', :name => 'Uganda Special Pass')
    VisaType.create(:country => 'India', :name => 'India Employment Visa')
    VisaType.create(:country => 'Zimbabwe', :name => 'ZA Business Visa')
    VisaType.create(:country => 'Zimbabwe', :name => 'ZA Work Visa')
  end
end

class EmployeeSeeder

  def self.getExcelSheet(sheetName)
    data=Roo::Excelx.new(sheetName)
    data.default_sheet= data.sheets.first
    puts "FOUND SPREADSHEET"
    puts "#{data.info}"
    data
  end

  def self.getVisaTypeConfig(seedSheet,visaStartPosition)
    [3,3,3,6,3,4,4,4,4,4,4,4,4,4,3,3,4,3,3]
  end

  def self.readVisas(seedSheet,rowNumber, visaStartColumn, visaTypeConfig,visaTypeList)
    currentVisaPosition=visaStartColumn
    visas=Array.new
    for visaTypeCount in 0...visaTypeConfig.size
      status=seedSheet.cell(rowNumber, currentVisaPosition)
      visaFieldCount = visaTypeConfig[visaTypeCount]
      if status!=nil && status!= ""
        visaFieldOffet= visaFieldCount==3? 0:1
        issue_date=seedSheet.cell(rowNumber,currentVisaPosition+1+visaFieldOffet)
        expiry_date=seedSheet.cell(rowNumber,currentVisaPosition+2+visaFieldOffet)
        visa = Visa.new(:status => status)
        visa.visa_type = visaTypeList[visaTypeCount]
        if issue_date.is_a?Date
          visa.issue_date=issue_date
        else
          puts "Failed seed with ISSDTE=#{issue_date} for #{visa.visa_type_name} on Row #{rowNumber}"
        end
        if expiry_date.is_a?Date
          visa.expiry_date=expiry_date
        else
          puts "Failed seed with EXPDTE=#{expiry_date} for #{visa.visa_type_name} on Row #{rowNumber}"
        end
        visas<<visa
      end
      currentVisaPosition=currentVisaPosition+visaFieldCount
    end
    visas
  end

  def self.readPassport(seedSheet,rowNumber)
    Passport.new({:number => seedSheet.cell(rowNumber, 10).to_s, :citizenship => seedSheet.cell(rowNumber, 13), :expiry_date => seedSheet.cell(rowNumber, 9)})
  end

  def self.readEmployee(rowNumber, seedSheet)
    employee=Employee.new({:number => "#{seedSheet.cell(rowNumber, 4).to_i}", :name => seedSheet.cell(rowNumber, 5), :position => seedSheet.cell(rowNumber, 6), :category => seedSheet.cell(rowNumber, 7), :joining_date => seedSheet.cell(rowNumber, 8), :exit_date => seedSheet.cell(rowNumber, 11), :location => seedSheet.cell(rowNumber, 12)})
    passportNumber = seedSheet.cell(rowNumber, 10)
    return employee,passportNumber
  end

  def self.seed(seedSheet,dataStartRow,visaStartColumn)
    visaTypeConfig=getVisaTypeConfig(seedSheet, visaStartColumn)
    visaTypeList=VisaType.all
    for rowNumber in dataStartRow...seedSheet.last_row
      currentEmployee,passportNumber=readEmployee(rowNumber, seedSheet)
      if currentEmployee.save!
        puts "Just put #{currentEmployee.name}"
        if passportNumber!=nil && passportNumber!=""
          currentEmployee.passport=readPassport(seedSheet,rowNumber)
          currentEmployee.passport.visas=readVisas(seedSheet, rowNumber, visaStartColumn, visaTypeConfig,visaTypeList )
          currentEmployee.passport.save!
        end
      end
    end
  end

  def self.start(sheetName,dataStartRow,visaStartColumn)
    seedSheet=getExcelSheet(sheetName)
    seed(seedSheet,dataStartRow,visaStartColumn)
    #Next Line needs better implementation
  end
end

VisaTypeSeeder.seed
EmployeeSeeder.start("db/content.xlsx",3,14)






