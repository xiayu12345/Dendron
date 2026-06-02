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

## 日常更新

改 `notes/*.md` 后：

```bash
npm run publish:site
git add notes docs && git commit -m "Update notes" && git push
```
