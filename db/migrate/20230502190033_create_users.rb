class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, defaut: 'https://c.files.bbci.co.uk/C870/production/_112921315_gettyimages-876284806.jpg'
      t.text :bio, default: 'I am a slutty model from Bahamas. Adding values to brands with my personality and cult-like following. Brand marketing has changed dynamically since i arrived the art. It was made for me.'
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
