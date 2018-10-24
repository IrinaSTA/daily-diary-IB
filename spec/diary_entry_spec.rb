require 'diary_entry'

describe DiaryEntry do
  describe "#new" do
    it 'creates a new entry with a title' do
      entry1 = DiaryEntry.create("Week 1 at Makers", "OOD")
      expect(entry1.title).to eq("Week 1 at Makers")
    end
  end

  describe '#all_titles' do
    it 'returns a list of titles' do
      entry1 = DiaryEntry.create("Week 1 at Makers", "OOD")
      entry2 = DiaryEntry.create("Week 2 at Makers", "TDD")
      expect(DiaryEntry.all_titles).to eq(["Week 1 at Makers", "Week 2 at Makers"])
    end
  end
end
