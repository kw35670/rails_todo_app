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

# チームの作成
team1 = Team.create!(name: "開発チーム")
team2 = Team.create!(name: "デザインチーム")

# ユーザーの作成
user1 = User.create!(
  email: "user1@example.com",
  password: "password",
  password_confirmation: "password",
  nickname: "ユーザー1"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password",
  password_confirmation: "password",
  nickname: "ユーザー2"
)

# チームとユーザーの関連付け
TeamUser.create!(
  team: team1,
  user: user1
)

TeamUser.create!(
  team: team1,
  user: user2
)

TeamUser.create!(
  team: team2,
  user: user1
)

# タスクの作成
Task.create!(
  name: "フロントエンド開発",
  status: :in_progress,
  team: team1,
  created_user: user1.nickname,
  update_user: user1.nickname
)

Task.create!(
  name: "バックエンド開発",
  status: :not_started,
  team: team1,
  created_user: user2.nickname,
  update_user: user2.nickname
)

Task.create!(
  name: "UIデザイン",
  status: :completed,
  team: team2,
  created_user: user1.nickname,
  update_user: user1.nickname
)