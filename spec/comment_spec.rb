require 'comment'

RSpec.describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      link = Link.create(url: 'https://gitmoji.carloscuesta.me/')
      comment = Comment.create(link_id: link.id, text: 'Test comment')
      expect(comment.id).not_to be_nil
    end
  end
end
