# git-branching-model

https://nvie.com/posts/a-successful-git-branching-model/

## 主要分支

`main`：主分支，始终保持生产环境的稳定版本。

`develop`：开发分支，包含即将发布的最新开发变更。

## 辅助分支

### 功能分支（Feature branches）

- 用途：开发新功能。
- 源分支：`develop`
- 目标分支：`develop`
- 命名：任意（除`main`、`develop`、`release-*`、`hotfix-*`）

### 发布分支（Release branches）

- 用途：准备新版本发布。
- 源分支：`develop`
- 目标分支：`main`和`develop`
- 命名：`release-*`

### 热修复分支（Hotfix branches）

- 用途：修复生产环境的紧急问题。
- 源分支：`main`
- 目标分支：`main`和`develop`
- 命名：`hotfix-*`

## 分支操作

初始化开发分支：

```bash
git checkout -b develop main
```

创建功能分支：

```bash
git checkout -b develop-greet  develop
```

合并功能分支：

```bash
git checkout develop
git merge --no-ff develop-greet
git branch -d develop-greet
git push origin develop
```

创建发布分支：

```bash
git checkout -b release-0.1.0 develop
./bump-version.sh 0.1.0
git commit -a -m "Bumped version number to 0.1.0"
```

完成发布分支：

```bash
git checkout main
git merge --no-ff release-0.1.0
git tag -a 0.1.0
git checkout develop
git merge --no-ff release-0.1.0
git branch -d release-0.1.0
```

创建热修复分支：

```bash
git checkout -b hotfix-0.1.1 main
./bump-version.sh 0.1.1
git commit -a -m "Bumped version number to 0.1.1"
```

完成热修复分支：

```bash
git checkout main
git merge --no-ff hotfix-0.1.1
git tag -a 0.1.1
git checkout develop
git merge --no-ff hotfix-0.1.1
git branch -d hotfix-0.1.1
```
