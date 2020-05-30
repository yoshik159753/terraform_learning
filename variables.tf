# 変数定義

# variable で定義した変数には default をつけるか、いづれかの方法で値を定義する。
# - tfvars ファイル
# - コマンドラインにて -var aaa=xxx と設定
# - 環境変数にて TF_VAR_aaa と設定

variable "region" {
  # default で default を定義できる
  # default = "us-east-1"
}

variable "amis" {
  type = map
  # default = {
  #   "us-east-1" = "ami-b374d5a5"
  #   "us-west-2" = "ami-003634241a8fcdec0"
  # }
}
