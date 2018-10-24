require 'sinatra/base'

class DailyDiary < Sinatra::Base


  get '/diary_entries' do
    @titles = DiaryEntry.all_titles
    erb(:homepage)
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
