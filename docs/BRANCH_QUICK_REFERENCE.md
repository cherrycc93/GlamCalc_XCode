# Git Branch Quick Reference

A quick guide for common branch operations in GlamCalc.

## Creating Branches

### New Feature
```bash
git checkout main
git pull origin main
git checkout -b feature/my-new-feature
```

### Bug Fix
```bash
git checkout main
git pull origin main
git checkout -b fix/bug-description
```

### Documentation
```bash
git checkout main
git pull origin main
git checkout -b docs/update-readme
```

## Working with Branches

### Check Current Branch
```bash
git branch
# or
git status
```

### List All Branches
```bash
# Local branches
git branch

# Remote branches
git branch -r

# All branches
git branch -a
```

### Switch Between Branches
```bash
git checkout branch-name
# or (Git 2.23+)
git switch branch-name
```

### View Branch Details
```bash
# See last commit on each branch
git branch -v

# See tracking branches
git branch -vv

# See branches sorted by last commit
git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)|%(committerdate:relative)'
```

## Syncing Branches

### Update Your Feature Branch with Main
```bash
git checkout feature/my-feature
git fetch origin main
git rebase origin/main
# or
git merge origin/main
```

### Push Your Branch
```bash
# First time
git push -u origin feature/my-feature

# Subsequent pushes
git push
```

### Pull Latest Changes
```bash
git pull origin feature/my-feature
```

## Merging and Cleanup

### Merge Feature to Main (via PR)
1. Push your feature branch
2. Create Pull Request on GitHub
3. Get review and approval
4. Merge via GitHub interface
5. Delete branch after merge

### Local Merge (if needed)
```bash
git checkout main
git pull origin main
git merge feature/my-feature
git push origin main
```

### Delete Merged Branch
```bash
# Delete local branch
git branch -d feature/my-feature

# Delete remote branch
git push origin --delete feature/my-feature

# Force delete (if not merged)
git branch -D feature/my-feature
```

## Troubleshooting

### Undo Last Commit (keep changes)
```bash
git reset --soft HEAD~1
```

### Discard All Local Changes
```bash
git reset --hard HEAD
git clean -fd
```

### Rename Current Branch
```bash
git branch -m new-branch-name
```

### Rename Another Branch
```bash
git branch -m old-name new-name
```

### View Branch History
```bash
git log --oneline --graph --decorate --all
```

### See What Changed Between Branches
```bash
git diff main..feature/my-feature
```

### Check if Branch is Merged
```bash
# Check if feature-branch is merged into main
git checkout main
git branch --merged | grep feature-branch
```

## Maintenance Commands

### Update Remote Branch List
```bash
git fetch --all --prune
# or
git remote prune origin
```

### Find Stale Branches
```bash
# Branches not updated in 30+ days
git for-each-ref --sort=-committerdate refs/heads/ \
  --format='%(refname:short)|%(committerdate:relative)' | \
  grep -v 'main\|develop'
```

### Clean Up Merged Branches
```bash
# List merged branches (excluding main)
git branch --merged main | grep -v "main"

# Delete them (review list first!)
git branch --merged main | grep -v "main" | xargs git branch -d
```

## Best Practices

### ✅ Do
- Pull latest changes before creating new branch
- Use descriptive branch names
- Keep branches focused and small
- Delete branches after merging
- Commit frequently with clear messages
- Push regularly to back up work

### ❌ Don't
- Push directly to main (use PRs)
- Leave branches stale for weeks
- Use vague names like "fix1" or "temp"
- Force push to shared branches
- Keep large uncommitted changes
- Mix multiple features in one branch

## Emergency Scenarios

### "I committed to the wrong branch!"
```bash
# If you haven't pushed yet
git reset --soft HEAD~1  # Undo commit, keep changes
git stash                # Save changes
git checkout correct-branch
git stash pop            # Apply changes
git commit              # Commit to correct branch
```

### "I need to undo my last push!"
```bash
# ⚠️ Only if you're the only one using this branch!
git reset --hard HEAD~1
git push --force-with-lease
```

### "I accidentally deleted my branch!"
```bash
# Find the commit SHA
git reflog

# Recreate the branch
git checkout -b branch-name <commit-sha>
```

### "My branch diverged from origin!"
```bash
# See the difference
git status

# Option 1: Rebase (rewrite history)
git pull --rebase

# Option 2: Merge (keep all history)
git pull --no-rebase
```

## Visual Branch Graph

To see a nice visual representation of your branches:

```bash
git log --all --decorate --oneline --graph
```

Or create an alias:
```bash
git config --global alias.lg "log --all --decorate --oneline --graph"
# Then use: git lg
```

---

**Quick Help**: For more details, see [BRANCH_STRATEGY.md](../BRANCH_STRATEGY.md) or run `git help <command>`
