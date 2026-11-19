# montahd-migration

monta HD 站点迁移公告页 —— 静态单页，用于 Cloudflare Pages。

## 结构

```
dist/
├── index.html     迁移公告（主页面）
├── 404.html       品牌化 404
├── _headers       CF Pages 响应头（安全头 + 缓存策略）
├── _redirects     /index.html、/index、/home → /
└── robots.txt
wrangler.toml      pages_build_output_dir = "dist"
deploy.sh          手动直传脚本（可选）
```

## Cloudflare Pages 设置

| 项 | 值 |
|---|---|
| Framework preset | None |
| Build command | 留空 |
| Build output directory | `dist` |
| Root directory | `/` |

绑自定义域：Workers & Pages → 本项目 → Custom domains。注意 `montahd.com` 目前指向 VPS 上的站点，绑定会顶掉它。

## 本地预览

```sh
cd dist && python3 -m http.server 8080
```

## 手动直传（不用 Git 集成时）

```sh
export CLOUDFLARE_API_TOKEN=...   # Pages:Edit
export CLOUDFLARE_ACCOUNT_ID=...
./deploy.sh
```

## 事实来源

- 新站：https://montahd.com
- 交流群：https://t.me/MontaHD1
- 支持邮箱：xon@montahd.com

2026 monta HD.
