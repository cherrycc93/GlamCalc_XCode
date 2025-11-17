# Branch Organization Strategy for GlamCalc

## Current Branch Structure

### Active Branches
- `main` - Primary development branch (protected)
- `claude/organize-branches-01MZrV35QkyXHkmANXx7jHP7` - Temporary branch (to be removed)

## Branch Organization Plan

### 1. Branch Naming Conventions

#### Main Branches
- `main` - Primary branch for production-ready code
- `develop` (optional) - Integration branch for features (if needed in future)

#### Feature Branches
- `feature/<feature-name>` - For new features
- Example: `feature/advanced-calculator`

#### Bug Fix Branches
- `fix/<bug-description>` - For bug fixes
- Example: `fix/division-by-zero`

#### Claude AI Branches
- `claude/<task-description-sessionid>` - Temporary branches created by Claude
- These should be merged to main and deleted after completion
- Example: `claude/organize-branches-01MZrV35QkyXHkmANXx7jHP7`

#### Other Branch Types
- `refactor/<description>` - For code refactoring
- `docs/<description>` - For documentation updates
- `test/<description>` - For test additions/improvements

### 2. Branch Lifecycle

1. **Creation** - Create branch from main
2. **Development** - Make commits with clear messages
3. **Review** - (Optional) Create pull request for review
4. **Merge** - Merge into main when complete
5. **Cleanup** - Delete branch after successful merge

### 3. Current Cleanup Actions

The following branches will be cleaned up:
- `claude/organize-branches-01MZrV35QkyXHkmANXx7jHP7` - Already synced with main, will be removed

## Best Practices

1. **Keep main stable** - Only merge tested, working code
2. **Delete merged branches** - Clean up branches after merging to avoid clutter
3. **Use descriptive names** - Branch names should clearly indicate their purpose
4. **Regular sync** - Keep feature branches updated with main
5. **Small, focused branches** - Each branch should address one feature/fix
6. **Clear commit messages** - Use conventional commit format when possible

## Maintenance

### Weekly Review
- Check for stale branches (>30 days old)
- Remove merged branches
- Update this document as needed

### Commands for Branch Maintenance

```bash
# List all branches sorted by last commit
git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)|%(committerdate:relative)'

# Delete local branch
git branch -d <branch-name>

# Delete remote branch
git push origin --delete <branch-name>

# Prune deleted remote branches
git remote prune origin
```

## Status

Last updated: 2025-11-17
Current status: Initial organization complete
