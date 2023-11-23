require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

while true
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
    memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

    if memo_type == 1 || memo_type == 2
        break
    else 
        puts "[エラー]1か2を入力してください"
    end
end
    # if文を使用して続きを作成していきましょう。
    # 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
    puts "メモしたい内容を記入してください"
    puts "完了したら Ctrl + D を押します"
    input_content = readlines
    CSV.open("#{file_name}.csv", "w") do |csvmemo|
        csvmemo << input_content
    end
elsif memo_type == 2
    while true
        puts "編集したいファイル名を拡張子を除いて入力してください"
        file_name = gets.chomp
            begin
                puts CSV.read("#{file_name}.csv")
                break
            rescue
                puts "[エラー]ファイルが見つかりません"
            end      
    end

    puts "追記したい内容を記入してください"
    puts "完了したら Ctrl + D を押します"
    input_content = readlines
    CSV.open("#{file_name}.csv", "a") do |csvmemo|
        csvmemo << input_content
    end
end