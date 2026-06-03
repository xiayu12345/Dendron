# GitHub Pages

| 项目 | 地址 |
|------|------|
| **公网站点** | https://xiayu12345.github.io/Dendron/ |
| **GitHub 仓库** | https://github.com/xiayu12345/Dendron |

## 发布（生成 `docs/`）

```bash
export PATH="/home/belon/.local/node/bin:$PATH"
cd /home/belon/Dendron
npm run publish:site
```

## 首次推送到 GitHub

1. 在 https://github.com/new 创建仓库 **`Dendron`**（与用户名 `xiayu12345` 对应）。
2. 终端执行：

```bash
export PATH="/home/belon/.local/node/bin:$PATH"
cd /home/belon/Dendron

git init
git branch -M main
git add dendron.yml dendron.code-workspace .gitignore notes docs package.json package-lock.json scripts GITHUB_PAGES.md
git commit -m "Publish BK7252N docs to GitHub Pages"

git remote add origin https://github.com/xiayu12345/Dendron.git
git push -u origin main
```

3. 仓库 **Settings → Pages** → Source: **Deploy from branch** → Branch **`main`**，Folder **`/docs`**。

## 常见问题

| 现象 | 原因 | 处理 |
|------|------|------|
| 页面无样式、链接 404 | 站点在 `/Dendron/` 子路径，旧构建未带前缀 | 确认 `dendron.yml` 中 `assetsPrefix: /Dendron`，重新 `publish:site` 并 **push** |
| 中文乱码 | 笔记非 UTF-8 保存 | 用 UTF-8 保存 `.md`；发布脚本已设置 `LANG=C.UTF-8` |

推送若 `Broken pipe`，可换网络后重试，或用 HTTPS：`git remote set-url origin https://github.com/xiayu12345/Dendron.git`

## 日常更新

改 `notes/*.md` 后：

```bash
npm run publish:site
git add notes docs dendron.yml && git commit -m "Update notes" && git push origin main
```

推送后等 GitHub Pages 重建（约 1–2 分钟），浏览器 **Ctrl+F5** 强刷。
