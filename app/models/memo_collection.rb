class MemoCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  MEMO_NUM = 3  # 同時にユーザーを作成する数
  attr_accessor :collection

  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|

        Memo.new(
          memo: value['memo'],
          user_id: value['user_id'],
          id: value['id']
        )
        
      end
      p self.collection
    else
      self.collection = MEMO_NUM.times.map{ Memo.new }
    end
  end

  # レコードが存在するか確認するメソッド
  def persisted?
    false
  end

  # コレクションをDBに保存するメソッド
  def save
    is_success = true
    ActiveRecord::Base.transaction do
      collection.each do |result|
        # バリデーションを全てかけたいからsave!ではなくsaveを使用
        is_success = false unless result.save
      end
      # バリデーションエラーがあった時は例外を発生させてロールバックさせる
      raise ActiveRecord::RecordInvalid unless is_success
    end
    rescue
      p 'エラー'
    ensure
      return is_success
  end
end