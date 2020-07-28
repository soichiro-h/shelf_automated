require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'tag validation' do
    subject(:tag) { Tag.new(tag_title: 'a' * 20) }

    it 'valid tag' do
      expect(tag).to be_valid
    end

    it 'invalid tag_title (blank)' do
      tag.tag_title = ' '
      expect(tag).not_to be_valid
    end

    it 'invalid tag_title (more than 21 ltrs)' do
      tag.tag_title = 'a' * 21
      expect(tag).not_to be_valid
    end

    it 'invalid tag_title (duplicated)' do
      tag.save
      another_tag = Tag.new(tag_title: tag.tag_title)
      expect(another_tag).not_to be_valid
    end
    
    it 'another user can save same tag_title as other users' do
      tag.save
      another_user_id = 2
      same_title_tag = Tag.new(tag_title: tag.tag_title, user_id: another_user_id )
      expect(same_title_tag).to be_valid
    end
    
  end
end
