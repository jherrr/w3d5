class CreateSchema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname, presence: true
      t.string :lname, presence: true
      t.timestamps
    end

    add_index(:users, [:fname, :lname], unique: true)

    create_table :polls do |t|
      t.string :title, presence: true
      t.integer :author_id, presence: true
      t.timestamps
    end

    add_index(:polls, :author_id)

    create_table :questions do |t|
      t.integer :poll_id, presence: true
      t.text :body, presence: true
      t.timestamps
    end

    add_index(:questions, :poll_id)

    create_table :answer_choices do |t|
      t.integer :question_id, presence: true
      t.text :body, presence: true
      t.timestamps
    end

    add_index(:answer_choices, :question_id)

    create_table :responses do |t|
      t.integer :respondent_id, presence: true
      t.integer :answer_choice_id, presence: true
      t.timestamps
    end

    add_index(:responses, :respondent_id)
    add_index(:responses, :answer_choice_id)

  end
end
