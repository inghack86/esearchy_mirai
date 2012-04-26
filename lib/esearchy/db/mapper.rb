class Project
  include MongoMapper::Document

  key :name, String
  key :domain, String
  key :url, String
  key :company, String

  many :emails 
  many :persons
end

class Person
  include MongoMapper::Document

  key :name,  String
  key :middle,  String
  key :last,  String
  key :created_at, Time
  key :friend_ids, Array
  key :found_at, Array
  key :found_by, Array
  
  many :emails
  many :networks
  many :persons, :in => :friends_ids
  belongs_to :project
end

class Network
  include MongoMapper::EmbeddedDocument

  key :name,  String
  key :url, String
  key :nickname, String
  key :found_by, Array
  key :info, Hash
  
  belongs_to :person
end

class Email
  include MongoMapper::EmbeddedDocument

  key :email, String
  key :url, String
  key :found_by, Array

  belongs_to :project
  belongs_to :person
end

class Document
  include MongoMapper::Document

  key :name, String
  key :format, String
  key :url, String
  key :found_by, Array

end