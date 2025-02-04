# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.2]
  def change
    
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true



    create_table :users do |t|
      ## Required for Devise Token Auth
      t.string :provider, default: 'email', null: false
      t.string :uid, default: '', null: false

      ## Database authenticatable for Devise
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable for Devise
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable for Devise
      t.datetime :remember_created_at

      ## Confirmable for Devise (optional, can be uncommented)
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if reconfirmable

      ## Lockable for Devise (optional, can be uncommented)
      # t.integer :failed_attempts, default: 0, null: false
      # t.string :unlock_token
      # t.datetime :locked_at

      ## User Info (additional fields from `Devise Token Auth`)
      t.string :name
      t.string :nickname
      t.string :image

      ## Allow password change (for Devise Token Auth)
      t.boolean :allow_password_change, default: false

      ## Tokens for Devise Token Auth
      t.text :tokens

      t.timestamps null: false
    end

    # Add indexes
    add_index :users, :email, unique: true
    add_index :users, [:uid, :provider], unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
    # add_index :users, :unlock_token, unique: true (uncomment if using Lockable)
  




















  end
end
