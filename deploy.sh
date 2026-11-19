#!/bin/sh
# 部署到 Cloudflare Pages（直接上传）
# 需要两个环境变量：CLOUDFLARE_API_TOKEN（Pages:Edit 权限）、CLOUDFLARE_ACCOUNT_ID
set -e
cd "$(dirname "$0")"

: "${CLOUDFLARE_API_TOKEN:?缺少 CLOUDFLARE_API_TOKEN}"
: "${CLOUDFLARE_ACCOUNT_ID:?缺少 CLOUDFLARE_ACCOUNT_ID}"

PROJECT="${PROJECT:-montahd-migration}"
BRANCH="${BRANCH:-main}"

echo "→ 项目：$PROJECT  分支：$BRANCH"
echo "→ 目录：$(pwd)/dist"
[ -f dist/index.html ] || { echo "dist/index.html 不存在"; exit 1; }

npx -y wrangler@latest pages deploy dist \
  --project-name "$PROJECT" \
  --branch "$BRANCH" \
  --commit-dirty=true

echo "→ 完成：https://${PROJECT}.pages.dev"
