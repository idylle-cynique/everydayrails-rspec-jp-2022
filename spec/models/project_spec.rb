require "rails_helper"

RSpec.describe Project, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @user = User.create(
      first_name: "Joe",
      last_name: "Tester",
      email: "joetester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
  end

  # 同一ユーザによる同名のプロジェクトの登録処理を許可しないこと
  it "does not allow duplicate project names per user" do
    @user.projects.create(name: "Test Project")

    new_project = @user.projects.build(name: "Test Project")

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  # 別個のユーザが同じプロジェクト名を使用することは許可すること
  it "allows two users to share project name" do
    @user.projects.create(name: "Test Project")

    other_user =
      User.create(
        first_name: "Jane",
        last_name: "Tester",
        email: "janetester@example.com",
        password: "dottle-nouveau-pavilion-tights-furze"
      )

    other_project = other_user.projects.build(name: "Test Project")

    expect(other_project).to be_valid
  end


  # 3章演習問題「Projectモデルのバリデーションテストを行いなさい」
  it "is valid with a username" do
    new_project = @user.projects.build(name: nil)

    new_project.valid?
    expect(new_project.errors[:name]).to include("can't be blank")
  end
end
