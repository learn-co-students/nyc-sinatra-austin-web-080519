class CreateLandmarks < ActiveRecord::Migration
  # raise 'Write CreateLandmarks migration here'
  def change
    create_table :figures do |f|
      f.string :name
    end

    create_table :landmarks do |l|
      l.string :name
      l.integer :figure_id
      l.integer :year_completed
    end

    create_table :titles do |t|
      t.string :name 
    end

    create_table :figure_titles do |ft|
      ft.integer :figure_id
      ft.integer :title_id
    end
  end
end
