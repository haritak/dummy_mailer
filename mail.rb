require 'mail'
load '/home/administrator/scripts/dummy_mailer/credentials.txt'

raise "Required file missing" if ARGV.size<1
raise "Paramereter not a file" if not File.exists?(ARGV[0])

#source : http://stackoverflow.com/questions/12884711/how-to-send-email-via-smtp-with-rubys-mail-gem
#Προσοχή, χρειάζεται απο τον αντίστοιχο λογαριασμό email να έχει κανείς ενεργοποιήσει την πρόσβαση ΜΗ ασφαλών εφαρμογων.

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'gmail.com',
            :user_name            => USERNAME,
            :password             => PASSWORD,
            :authentication       => 'plain',
            :enable_starttls_auto => true  }



Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
       to TO
     from FROM
  subject SUBJECT
     body BODY

     ARGV.each do |filename|
       add_file filename
     end
end
