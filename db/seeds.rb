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
# Task.delete_all
# TeamUser.delete_all
# User.delete_all
# Team.delete_all

# チームの作成
team1 = Team.find_or_create_by!(name: "開発チーム")
team2 = Team.find_or_create_by!(name: "デザインチーム")

# ユーザーの作成
user1 = User.find_or_create_by!(email: "user1@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.nickname = "ユーザー1"
end

user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.nickname = "ユーザー2"
end

# チームとユーザーの関連付け
TeamUser.find_or_create_by!(
  team: team1,
  user: user1
)

TeamUser.find_or_create_by!(
  team: team1,
  user: user2
)

TeamUser.find_or_create_by!(
  team: team2,
  user: user1
)

# タスクの作成
Task.find_or_create_by!(
  name: "フロントエンド開発",
  status: :in_progress,
  team: team1,
  created_user: user1.nickname,
  update_user: user1.nickname
)

Task.find_or_create_by!(
  name: "バックエンド開発",
  status: :not_started,
  team: team1,
  created_user: user2.nickname,
  update_user: user2.nickname
)

Task.find_or_create_by!(
  name: "UIデザイン",
  status: :completed,
  team: team2,
  created_user: user1.nickname,
  update_user: user1.nickname
)