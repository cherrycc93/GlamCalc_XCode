# Branch Organization Strategy for GlamCalc

## Overview

This document outlines the git branching strategy for the GlamCalc project. It's designed to maintain a clean, organized workflow while supporting ongoing development, bug fixes, and feature additions.

## Branch Structure

### Main Branches

#### `main`
- **Purpose**: Production-ready code
- **Protection**: Protected branch, requires pull request reviews
- **Deployment**: Represents the App Store release version
- **Merges From**: `release/*`, `hotfix/*`
- **Naming Convention**: Always `main`

#### `develop`
- **Purpose**: Integration branch for ongoing development
- **Protection**: Protected, requires PR reviews
- **Status**: Should always be stable enough to build and run
- **Merges From**: `feature/*`, `bugfix/*`
- **Merges To**: `release/*`
- **Naming Convention**: Always `develop`

### Supporting Branches

#### Feature Branches (`feature/*`)
- **Purpose**: Development of new features
- **Branches From**: `develop`
- **Merges To**: `develop`
- **Naming Convention**: `feature/feature-name`
- **Lifetime**: Temporary, deleted after merge
- **Examples**:
  - `feature/scientific-calculator`
  - `feature/memory-functions`
  - `feature/landscape-mode`
  - `feature/custom-theme-creator`
  - `feature/widget-support`
  - `feature/ipad-optimization`
  - `feature/export-history`

#### Theme Branches (`theme/*`)
- **Purpose**: Adding new themes or theme system improvements
- **Branches From**: `develop`
- **Merges To**: `develop`
- **Naming Convention**: `theme/theme-name`
- **Examples**:
  - `theme/ocean-breeze`
  - `theme/sunset-glow`
  - `theme/system-improvements`
  - `theme/dynamic-colors`

#### UI Enhancement Branches (`ui/*`)
- **Purpose**: Visual improvements and design refinements
- **Branches From**: `develop`
- **Merges To**: `develop`
- **Naming Convention**: `ui/improvement-description`
- **Examples**:
  - `ui/button-animations`
  - `ui/accessibility-improvements`
  - `ui/dark-mode-refinements`
  - `ui/gradient-updates`

#### Bug Fix Branches (`bugfix/*`)
- **Purpose**: Fixing bugs found during development
- **Branches From**: `develop`
- **Merges To**: `develop`
- **Naming Convention**: `bugfix/issue-description`
- **Examples**:
  - `bugfix/decimal-input-crash`
  - `bugfix/history-display-overflow`
  - `bugfix/theme-persistence`
  - `bugfix/calculation-rounding`

#### Release Branches (`release/*`)
- **Purpose**: Preparing for a new production release
- **Branches From**: `develop`
- **Merges To**: `main` and `develop`
- **Naming Convention**: `release/version-number`
- **Activities**: Version bumping, final testing, minor bug fixes
- **Examples**:
  - `release/1.0.0`
  - `release/1.1.0`
  - `release/2.0.0`

#### Hotfix Branches (`hotfix/*`)
- **Purpose**: Emergency fixes for production issues
- **Branches From**: `main`
- **Merges To**: `main` and `develop`
- **Naming Convention**: `hotfix/issue-description`
- **Priority**: Critical, fast-tracked
- **Examples**:
  - `hotfix/critical-crash`
  - `hotfix/data-loss-bug`
  - `hotfix/calculation-error`

#### Experimental Branches (`experiment/*`)
- **Purpose**: Testing new ideas without commitment
- **Branches From**: `develop`
- **Merges To**: May not merge; can be abandoned
- **Naming Convention**: `experiment/concept-name`
- **Examples**:
  - `experiment/3d-button-effects`
  - `experiment/gesture-controls`
  - `experiment/voice-input`

## Workflow

### Standard Feature Development

1. Create feature branch from `develop`
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/new-feature
   ```

2. Develop and commit changes
   ```bash
   git add .
   git commit -m "Add new feature functionality"
   ```

3. Keep feature branch updated with `develop`
   ```bash
   git checkout develop
   git pull origin develop
   git checkout feature/new-feature
   git merge develop
   ```

4. Create pull request to merge into `develop`

5. After merge, delete feature branch
   ```bash
   git branch -d feature/new-feature
   git push origin --delete feature/new-feature
   ```

### Release Process

1. Create release branch from `develop`
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b release/1.1.0
   ```

2. Update version numbers in project
   - Update Info.plist version
   - Update README if needed
   - Final testing and bug fixes

3. Merge to `main`
   ```bash
   git checkout main
   git pull origin main
   git merge release/1.1.0
   git tag -a v1.1.0 -m "Release version 1.1.0"
   git push origin main --tags
   ```

4. Merge back to `develop`
   ```bash
   git checkout develop
   git merge release/1.1.0
   git push origin develop
   ```

5. Delete release branch
   ```bash
   git branch -d release/1.1.0
   git push origin --delete release/1.1.0
   ```

### Hotfix Process

1. Create hotfix branch from `main`
   ```bash
   git checkout main
   git pull origin main
   git checkout -b hotfix/critical-fix
   ```

2. Fix the issue and test thoroughly

3. Merge to `main`
   ```bash
   git checkout main
   git merge hotfix/critical-fix
   git tag -a v1.0.1 -m "Hotfix for critical issue"
   git push origin main --tags
   ```

4. Merge to `develop`
   ```bash
   git checkout develop
   git merge hotfix/critical-fix
   git push origin develop
   ```

5. Delete hotfix branch

## Commit Message Guidelines

### Format
```
<type>: <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `ui`: UI/UX improvements

### Examples
```
feat: Add ocean breeze theme

- Created new theme with blue-green gradient
- Added theme preview in selector
- Updated theme enum and color definitions

Closes #45
```

```
fix: Resolve decimal point duplication bug

Fixed issue where multiple decimal points could be entered
in a single number, causing calculation errors.

Fixes #78
```

```
ui: Improve button shadow effects

Enhanced shadow rendering for better depth perception
on all calculator buttons across all themes.
```

## Pull Request Guidelines

### PR Title Format
`[Type] Brief description`

Examples:
- `[Feature] Add scientific calculator functions`
- `[Bug Fix] Fix history persistence issue`
- `[UI] Enhance button animations`

### PR Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] New feature
- [ ] Bug fix
- [ ] UI enhancement
- [ ] Documentation update
- [ ] Refactoring

## Testing
- [ ] Tested on iPhone (iOS 15+)
- [ ] Tested on iPad
- [ ] All themes verified
- [ ] Settings persistence verified
- [ ] Calculation accuracy verified

## Screenshots (if applicable)
Add screenshots for UI changes

## Related Issues
Closes #issue_number
```

### Review Requirements
- At least 1 approval required
- All conversations resolved
- CI checks passing (if configured)
- No merge conflicts

## Best Practices

### Do's ✅
- Keep feature branches small and focused
- Commit early and often
- Write descriptive commit messages
- Keep `develop` and `main` stable
- Delete merged branches
- Tag releases on `main`
- Update documentation with code changes
- Test thoroughly before creating PR

### Don'ts ❌
- Don't commit directly to `main` or `develop`
- Don't merge without review
- Don't leave stale branches
- Don't mix multiple features in one branch
- Don't commit sensitive data or API keys
- Don't force push to shared branches
- Don't merge broken code

## Branch Protection Rules

### `main` Branch
- Require pull request reviews (1 approval minimum)
- Require status checks to pass
- Require branches to be up to date
- Restrict who can push (maintainers only)
- Require signed commits (optional)

### `develop` Branch
- Require pull request reviews (1 approval)
- Require status checks to pass
- Allow force pushes from maintainers only

## Version Numbering

Follow Semantic Versioning (SemVer): `MAJOR.MINOR.PATCH`

- **MAJOR**: Breaking changes or major rewrites (e.g., 2.0.0)
- **MINOR**: New features, backwards compatible (e.g., 1.1.0)
- **PATCH**: Bug fixes, backwards compatible (e.g., 1.0.1)

### Current Version Roadmap

- **v1.0.x**: Current stable release
- **v1.1.0**: Planned features (scientific functions, memory buttons)
- **v1.2.0**: Planned features (landscape mode, export history)
- **v2.0.0**: Major redesign with custom theme creator

## Maintenance

### Regular Tasks
- Review and close stale PRs (weekly)
- Delete merged branches (after each merge)
- Update this document as strategy evolves (as needed)
- Review branch protection rules (quarterly)
- Clean up old tags (yearly)

## Questions or Issues?

If you have questions about this branching strategy or encounter issues:
1. Check this document first
2. Discuss with the team
3. Propose changes via PR to this document

---

Last Updated: November 17, 2025
Document Version: 1.0
