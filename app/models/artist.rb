require 'pry'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(sg)
    all.find {|x| x if sg == x.slug}
  end

end