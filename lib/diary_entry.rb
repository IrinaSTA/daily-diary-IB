require 'pg'
require 'pry'

class DiaryEntry

  attr_reader :date, :title, :body, :id

  def initialize(date, title, body, id)
    @date = date
    @title = title
    @body = body
    @id = id
  end

  def self.create(title, body)
    conn = db_connect
    result = conn.exec("INSERT INTO diary_entries (date, title, body) VALUES ('#{Time.now}', '#{title}', '#{body}') RETURNING date, title, body, id;")[0]
    self.new(result['date'], result['title'], result['body'], result['id'])
  end

  def self.all
    conn = db_connect
    result = conn.exec('SELECT * FROM diary_entries;')
    result.map { |entry| DiaryEntry.new(entry['date'], entry['title'], entry['body'], entry['id']) }
  end

  def self.all_titles
    entries = self.all
    entries.map { |entry| entry.title }
  end

  def self.find_by_id(id)
    conn = db_connect
    result = conn.exec("SELECT FROM diary_entries WHERE id = #{id};")
  end

  def self.db_connect
    db = ENV['RACK_ENV'] == 'test' ? 'daily_diary_test' : 'daily_diary'
    PG.connect(dbname: db)
  end

end
