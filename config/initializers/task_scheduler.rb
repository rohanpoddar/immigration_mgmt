require 'rubygems'
require 'rake'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new
scheduler.every '1d' do
  system 'bundle exec rake reminder:reminder_mailer'
end