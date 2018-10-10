# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

def insert_tlds
  Tld.delete_all
  csv_text = File.read("#{File.expand_path('../..', __FILE__)}/lib/seeds/tlds_db.csv")
  csv      = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each_with_index do |row, index|
    t      = Tld.new
    t.name = row['name']
    t.typ  = row['typ']
    t.save
    puts "#{index}: #{t.name}, #{t.typ} saved"
  end
  puts "There are now #{Tld.count} rows in the tlds table"
end

def insert_words
  Word.delete_all
  csv_text = File.read("#{File.expand_path('../..', __FILE__)}/lib/seeds/words_db.csv")
  csv      = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each_with_index do |row, index|
    t        = Word.new
    t.typ    = row['typ']
    t.spacer = row['spacer']
    t.word   = row['word']
    t.save
    puts "#{index}: #{t.typ}, #{t.spacer}, #{t.word} saved"
  end
  puts "There are now #{Word.count} rows in the words table"
end

def insert_domains
  Domain.delete_all
  csv_text = File.read("#{File.expand_path('../..', __FILE__)}/lib/seeds/domains_db.csv")
  csv      = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each_with_index do |row, index|
    t            = Domain.new
    t.available  = row['available']
    t.currency   = row['currency']
    t.definitive = row['definitive']
    t.domain     = row['domain']
    t.period     = row['period']
    t.price      = row['price']
    t.score      = row['score']
    t.spacer     = row['spacer']
    t.tld        = row['tld']
    t.typ        = row['typ']
    t.save
    puts "#{index}: #{t.available}, #{t.currency}, #{t.definitive}, #{t.domain}, #{t.period}, #{t.price}, #{t.score}, #{t.spacer}, #{t.tld}, #{t.spacer} saved"
  end
  puts "There are now #{Domain.count} rows in the domains table"
end

insert_tlds
insert_words
insert_domains