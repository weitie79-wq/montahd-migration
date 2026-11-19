# montahd-migration

monta HD 站点迁移公告页 —— 纯静态单页，部署在 Cloudflare Workers 静态资源（Static Assets）。

## 结构

```
dist/
├── index.html     迁移公告（主页面）
├── 404.html       品牌化 404（not_found_handling = "404-page"）
├── _headers       安全头 + 缓存策略（Workers 静态资源原生支持）
├── _redirects     /index.html、/index、/home → /
└── robots.txt
wrangler.toml      [assets] directory = "./dist"
deploy.sh          本地手动直传脚本（可选）
```

## Cloudflare 构建设置

| 项 | 值 |
|---|---|
| Build command | 留空 |
| Deploy command | `npx wrangler deploy`（默认） |
| 静态目录 | 由 `wrangler.toml` 的 `[assets]` 指定为 `./dist` |
| 生产分支 | `main` |

推送到 `main` 即自动重新构建部署。地址形如 `https://montahd-migration.<account>.workers.dev`。

自定义域：Workers & Pages → 本项目 → Settings → Domains & Routes → Add custom domain。
注意 `montahd.com` 目前指向 VPS 上的站点，绑定会顶掉它。

> 若项目在面板里显示为 **Pages** 类型，则把 Deploy command 改成 `npx wrangler pages deploy dist`，
> 并删除 `wrangler.toml` 里的 `[assets]` 段（两种模式不共存）。

## 本地预览

```sh
cd dist && python3 -m http.server 8080
```

## 手动直传（不用 Git 集成时）

```sh
export CLOUDFLARE_API_TOKEN=...   # Workers Scripts:Edit
export CLOUDFLARE_ACCOUNT_ID=...
npx wrangler deploy
```

## 事实来源

- 新站：https://montahd.com
- 交流群：https://t.me/MontaHD1
- 支持邮箱：xon@montahd.com

2026 monta HD.
