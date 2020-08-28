class UserRegistrationForm
  include ActiveModel::Model #バリデーション機能やform_withに渡せる機能などを足す

  # UserRegistrationForm.new({name: "foo", email: "bar, ...}) とかするため
  include ActiveModel::Attributes
  attribute :name, :string
  attribute :email, :string
  attribute :terms_of_service, :boolean # このattributeはDB保存しない

  # このFormObject用のバリデーション（なのでUserモデルと違って良い）
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # URI::MailTo::EMAIL_REGEXPはRubyに定義されてるemail判定正規表現
  validates :terms_of_service, acceptance: { allow_nil: false }
  # acceptanceはチェックボックス確認用 https://railsguides.jp/active_record_validations.html#acceptance

  # saveメソッドを生やしておくとモデルと同じ使い心地に
  def save
    return false if invalid?
    user.save
  end

  # redirect_to @user のときにUserオブジェクト取りたいので取れるようにする
  # edit/updateのことを考えるとuser=メソッドも生やした方がいいかも
  def user
    @user ||= User.new(name: name, email: email)
  end
end
