require 'sinatra/base'
require_relative './lib/diary_entry'
require 'pg'

class DailyDiary < Sinatra::Base


  get '/diary_entries' do
    # @titles = DiaryEntry.all_titles
    @entries = DiaryEntry.all
    erb(:homepage)
  end

  # get '/diary_entries/:id' do
  #   @entry = DiaryEntry.find_by_id(params[:id])
  #   erb(:view_entry)
  # end

  get '/diary_entries/new' do
    erb(:add_entry)
  end

  post '/save_entry' do
    DiaryEntry.create(params[:title], params[:body])
    redirect('/diary_entries')
  end

  run! if app_file == $0

end
