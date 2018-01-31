class AddSkillToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :skill, :string
  end
end
