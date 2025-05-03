# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# すべてのテーブルのデータを削除
Task.delete_all
TeamUser.delete_all
User.delete_all
Team.delete_all

# Teamデータの作成
Team.create([
    { name: "チーム1", created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { name: "チーム2", created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { name: "チーム3", created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" }
])

# Userデータの作成
User.create([
    { nickname: "ユーザー1", email: "user1@example.com", password: "password123", deleted_at: nil, created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { nickname: "ユーザー2", email: "user2@example.com", password: "password123", deleted_at: nil, created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { nickname: "ユーザー3", email: "user3@example.com", password: "password123", deleted_at: nil, created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" }
])

# TeamUserデータの作成
TeamUser.create([
    { team_id: 1, user_id: 1, created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { team_id: 1, user_id: 2, created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { team_id: 1, user_id: 3, created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" }
])

# Taskデータの作成
Task.create([
    { name: "タスク1", status: :not_started, created_user: "ユーザー1", update_user: "ユーザー1", created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { name: "タスク2", status: :in_progress, created_user: "ユーザー2", update_user: "ユーザー2", created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" },
    { name: "タスク3", status: :completed, created_user: "ユーザー3", update_user: "ユーザー3", created_at: "2025-01-01 00:00:00", updated_at: "2025-01-01 00:00:00" }
])