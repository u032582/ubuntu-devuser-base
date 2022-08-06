# ubuntu-devuser-base
よく使うコンテナイメージの雛形です。
[toc]

1. 一般ユーザー化（UID:1001、GID：1001）
1. `sudoers`
1. 日本語環境
1. 基本ライブラリ
1. `.bashrc`と`.vimrc`
2. X11

# トラブルシュート 
### X11アプリで "No protocol specified" がでたら
`xhost +` をホスト側で実行するべし