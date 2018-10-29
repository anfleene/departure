class DataMigrationWithNamedBinds < ActiveRecord::Migration[5.1]
  class Comment < ActiveRecord::Base; end

  def up
    unread_comments = Comment.where('`read` = :read', read: false)
    unread_comments.update_all(read: true)
  end

  def down; end
end