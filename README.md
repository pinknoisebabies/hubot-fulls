# hubot-fulls

#### インストール手順とか ####
node.js の動くホストにデプロイしたらよい

#### 環境変数メモ ####
- DOCOMO_API_KEY
  - DOCOMO雑談対話APIのAPI KEY
- HUBOT_GOOGLE_CSE_ID
- HUBOT_GOOGLE_CSE_KEY
  - イメージ検索用に使うGoogleカスタム検索のIDとKEY
- HUBOT_SLACK_TOKEN
  - SLACK側で発行したHUBOT用のTOKEN

#### redis について ####
デフォルトで `localhost:6379` に繋ぎにいくけど、  
指定したいなら `export REDIS_URL=redis://passwd@host:port/prefix`  
詳しくは [hubot-redis-brainのREADME](https://github.com/hubot-scripts/hubot-redis-brain) 参照
