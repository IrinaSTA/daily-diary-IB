require 'sinatra/base'
require_relative './lib/diary_entry'
require 'pg'

class DailyDiary < Sinatra::Base


  get '/diary_entries' do
    @entries = DiaryEntry.all
    erb(:homepage)
  end

# I could not get '/diary_entries/:id' to work - it got mixed up with '/diary_entries/new'
  get '/diary_entries/show/:id' do
    @entry = DiaryEntry.find_by_id(params[:id])
    erb(:view_entry)
  end

  get '/diary_entries/new' do
    erb(:add_entry)
  end

  post '/save_entry' do
    DiaryEntry.create(params[:title], params[:body])
    redirect('/diary_entries')
  end

  run! if app_file == $0

end
