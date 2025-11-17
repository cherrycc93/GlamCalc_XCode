# Branch Protection Guidelines

## Protected Branches

### Main Branch Protection
The `main` branch should be protected with the following settings:

#### Recommended Settings (if using GitHub/GitLab)

1. **Require pull request reviews before merging**
   - Number of required approvals: 1 (for team projects)
   - Dismiss stale reviews when new commits are pushed

2. **Require status checks to pass**
   - Add CI/CD checks when available
   - Require branches to be up to date before merging

3. **Require conversation resolution before merging**
   - All comments must be resolved

4. **Do not allow force pushes**
   - Prevents history rewriting on main

5. **Do not allow deletions**
   - Prevents accidental deletion of main branch

## Branch Permissions

### Who Can Push to Main?
- **Direct pushes**: Repository administrators only
- **All other contributors**: Must use pull requests

### Who Can Delete Branches?
- **Main**: No one (protected)
- **Feature/Claude branches**: Original author or administrators after merge

## Setting Up Protection (GitHub)

To set up branch protection on GitHub:

1. Go to repository Settings
2. Click on "Branches" in the left sidebar
3. Click "Add rule" under Branch protection rules
4. Enter `main` as the branch name pattern
5. Enable the protections listed above
6. Click "Create" or "Save changes"

## Setting Up Protection (GitLab)

To set up branch protection on GitLab:

1. Go to Settings → Repository
2. Expand "Protected Branches"
3. Select `main` from the dropdown
4. Set "Allowed to merge" (Developers or Maintainers)
5. Set "Allowed to push" (No one or Maintainers only)
6. Click "Protect"

## Local Enforcement

While branch protection is typically handled by the remote repository, you can add local git hooks to remind developers:

```bash
# .git/hooks/pre-push
#!/bin/bash

branch=$(git rev-parse --abbrev-ref HEAD)
remote_branch=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null | sed 's/.*\///')

if [ "$branch" = "main" ] && [ "$remote_branch" = "main" ]; then
    echo "⚠️  Warning: You are about to push directly to main!"
    echo "Consider creating a feature branch instead."
    read -p "Are you sure you want to continue? (yes/no) " -n 3 -r
    echo
    if [[ ! $REPLY =~ ^yes$ ]]; then
        echo "Push aborted."
        exit 1
    fi
fi
```

## Review Process

### For Feature Branches
1. Create branch from main: `git checkout -b feature/my-feature main`
2. Make changes and commit
3. Push to remote: `git push -u origin feature/my-feature`
4. Create pull request
5. Request review
6. Address feedback
7. Merge when approved
8. Delete feature branch

### For Hotfixes
1. Create fix branch from main: `git checkout -b fix/critical-bug main`
2. Fix the issue
3. Test thoroughly
4. Create pull request with "hotfix" label
5. Get expedited review
6. Merge to main
7. Delete fix branch

## Emergency Procedures

In case of critical production issues:

1. Create hotfix branch immediately
2. Fix the issue
3. If time-critical: Administrator can merge with fewer reviews
4. Post-merge: Create incident report
5. Schedule retrospective to prevent similar issues

Last updated: 2025-11-17
