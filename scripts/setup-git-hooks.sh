#!/bin/bash
# Setup Git Hooks for Branch Management
# This script installs local git hooks to help with branch organization

set -e

HOOKS_DIR=".git/hooks"
REPO_ROOT="$(git rev-parse --show-toplevel)"

echo "Setting up Git hooks for GlamCalc..."

# Create hooks directory if it doesn't exist
mkdir -p "$REPO_ROOT/$HOOKS_DIR"

# Pre-push hook to warn about pushing to main
cat > "$REPO_ROOT/$HOOKS_DIR/pre-push" << 'EOF'
#!/bin/bash
# Pre-push hook to warn about direct pushes to main

branch=$(git rev-parse --abbrev-ref HEAD)
remote_branch=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null | sed 's/.*\///' || echo "")

if [ "$branch" = "main" ]; then
    echo ""
    echo "⚠️  WARNING: You are about to push directly to the 'main' branch!"
    echo ""
    echo "Best practice is to:"
    echo "  1. Create a feature branch: git checkout -b feature/my-feature"
    echo "  2. Make your changes"
    echo "  3. Push the feature branch"
    echo "  4. Create a pull request"
    echo ""
    read -p "Do you really want to push to main? (type 'yes' to confirm): " -r
    echo
    if [[ ! $REPLY = "yes" ]]; then
        echo "❌ Push aborted."
        exit 1
    fi
    echo "✓ Proceeding with push to main..."
fi
EOF

# Pre-commit hook to validate branch names
cat > "$REPO_ROOT/$HOOKS_DIR/pre-commit" << 'EOF'
#!/bin/bash
# Pre-commit hook for branch name validation

branch=$(git rev-parse --abbrev-ref HEAD)

# Define valid branch name patterns
valid_patterns=(
    "^main$"
    "^develop$"
    "^feature/.+"
    "^fix/.+"
    "^hotfix/.+"
    "^refactor/.+"
    "^docs/.+"
    "^test/.+"
    "^claude/.+"
)

# Check if branch name matches any valid pattern
is_valid=false
for pattern in "${valid_patterns[@]}"; do
    if [[ $branch =~ $pattern ]]; then
        is_valid=true
        break
    fi
done

if [ "$is_valid" = false ]; then
    echo ""
    echo "⚠️  WARNING: Branch name '$branch' doesn't follow naming conventions!"
    echo ""
    echo "Recommended branch naming patterns:"
    echo "  • feature/<feature-name>  - For new features"
    echo "  • fix/<bug-description>   - For bug fixes"
    echo "  • hotfix/<critical-fix>   - For urgent fixes"
    echo "  • refactor/<description>  - For refactoring"
    echo "  • docs/<description>      - For documentation"
    echo "  • test/<description>      - For tests"
    echo "  • claude/<task-sessionid> - For Claude AI tasks"
    echo ""
    echo "Consider renaming your branch:"
    echo "  git branch -m <new-branch-name>"
    echo ""
    read -p "Continue with commit anyway? (yes/no): " -r
    echo
    if [[ ! $REPLY =~ ^yes$ ]]; then
        echo "❌ Commit aborted."
        exit 1
    fi
fi
EOF

# Commit-msg hook for commit message format
cat > "$REPO_ROOT/$HOOKS_DIR/commit-msg" << 'EOF'
#!/bin/bash
# Commit message format validator

commit_msg_file=$1
commit_msg=$(cat "$commit_msg_file")

# Check for minimum length
if [ ${#commit_msg} -lt 10 ]; then
    echo ""
    echo "⚠️  Commit message is too short (minimum 10 characters)"
    echo "Please provide a more descriptive commit message."
    echo ""
    exit 1
fi

# Optional: Check for conventional commit format (disabled by default)
# Uncomment to enable
# if ! [[ $commit_msg =~ ^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?:.+ ]]; then
#     echo ""
#     echo "⚠️  Commit message doesn't follow conventional format"
#     echo ""
#     echo "Format: <type>(<scope>): <description>"
#     echo ""
#     echo "Types: feat, fix, docs, style, refactor, test, chore"
#     echo "Example: feat(calculator): add scientific mode"
#     echo ""
#     read -p "Continue anyway? (yes/no): " -r
#     echo
#     if [[ ! $REPLY =~ ^yes$ ]]; then
#         exit 1
#     fi
# fi
EOF

# Make hooks executable
chmod +x "$REPO_ROOT/$HOOKS_DIR/pre-push"
chmod +x "$REPO_ROOT/$HOOKS_DIR/pre-commit"
chmod +x "$REPO_ROOT/$HOOKS_DIR/commit-msg"

echo ""
echo "✓ Git hooks installed successfully!"
echo ""
echo "Installed hooks:"
echo "  • pre-push    - Warns about pushing to main"
echo "  • pre-commit  - Validates branch names"
echo "  • commit-msg  - Validates commit messages"
echo ""
echo "To disable a hook, remove or rename the file in $HOOKS_DIR/"
echo ""
