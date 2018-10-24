require 'sinatra/base'

class DailyDiary < Sinatra::Base

  get '/' do
    @titles = DiaryEntry.all_titles
    erb(:homepage)
  end

  get '/add_entry' do
    erb(:add_entry)
  end

  post '/save_entry' do
    DiaryEntry.create(params[:title], params[:body])
    redirect('/')
  end

  run! if app_file == $0

end
