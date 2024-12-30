class ChangeSalaryTypeInPositions < ActiveRecord::Migration[7.1]
  def up
    # Önce geçici bir kolon oluştur
    add_column :positions, :salary_temp, :decimal, precision: 10, scale: 2

    # Mevcut verileri dönüştür
    Position.reset_column_information
    Position.find_each do |position|
      if position.salary == "true"
        position.update_column(:salary_temp, 0)
      else
        # Eğer sayısal bir değer varsa onu kullan
        begin
          position.update_column(:salary_temp, position.salary.to_f)
        rescue
          position.update_column(:salary_temp, 0)
        end
      end
    end

    # Eski kolonu sil
    remove_column :positions, :salary

    # Yeni kolonu doğru isimle yeniden oluştur
    rename_column :positions, :salary_temp, :salary
  end

  def down
    change_column :positions, :salary, :string
  end
end
