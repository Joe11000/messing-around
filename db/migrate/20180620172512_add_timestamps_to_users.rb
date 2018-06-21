class AddTimestampsToUsers < ActiveRecord::Migration[5.2]
  def change

    reversible do |dir|
      dir.up do
        # execute <<~SQL
        #   UPDATE users
        #   SET created_at = "#{Date.today}"::date
        #   WHERE (created_at IS NULL) OR (updated_at IS NULL)
        # SQL
      end
    end
  end
end
