require 'comment'

RSpec.describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      link = Link.create(url: 'https://gitmoji.carloscuesta.me/')
      comment = Comment.create(text: 'Test comment', link_id: link.id)
      expect(comment.id).not_to be_nil
    end
  end
end
