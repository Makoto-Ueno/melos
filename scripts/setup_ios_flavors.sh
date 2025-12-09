#!/bin/bash

# iOS Flavor設定用スクリプト
# 手動でXcodeを開いて以下の手順を実行してください:
#
# 1. Xcodeでiosフォルダを開く
# 2. PROJECT > Runner > Info タブを開く
# 3. Configurations セクションで + をクリックして以下を追加:
#    - Debug-dev (Duplicate "Debug")
#    - Debug-stg (Duplicate "Debug")
#    - Debug-prd (Duplicate "Debug")
#    - Release-dev (Duplicate "Release")
#    - Release-stg (Duplicate "Release")
#    - Release-prd (Duplicate "Release")
#
# 4. TARGETS > Runner > Build Settings を開く
# 5. + > Add User-Defined Setting で以下を追加:
#    FLUTTER_FLAVOR
#    - Debug-dev, Release-dev: dev
#    - Debug-stg, Release-stg: stg
#    - Debug-prd, Release-prd: prd
#
# 6. Product Bundle Identifier を各Configurationで設定:
#    - dev: com.example.counter-app.dev
#    - stg: com.example.counter-app.stg
#    - prd: com.example.counter-app
#
# 7. Product > Scheme > Manage Schemes で Scheme を作成:
#    - counter_app-dev (Run: Debug-dev, Archive: Release-dev)
#    - counter_app-stg (Run: Debug-stg, Archive: Release-stg)
#    - counter_app-prd (Run: Debug-prd, Archive: Release-prd)

echo "iOS Flavorの設定にはXcodeでの手動作業が必要です"
echo "詳細は上記のコメントを参照してください"
