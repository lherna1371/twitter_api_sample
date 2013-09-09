class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitter_user
      t.string :tweet
      t.datetime :created_at
      t.timestamps
    end
  end
end
