require 'mail'
load 'credentials.txt'

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
       to 'charitakis.ioannis@gmail.com'
     from '"ο Server του ΕΠΑΛ Μοιρων" <1epalmoironmailer@gmail.com>'
  subject 'Αναφορά του server'
     body 'Παρακαλώ δείτε τα συννημμένα'
     add_file ARGV[0]
end
