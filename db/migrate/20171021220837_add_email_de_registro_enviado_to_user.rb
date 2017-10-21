class AddEmailDeRegistroEnviadoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email_de_registro_enviado, :boolean, :default => false
  end
end
