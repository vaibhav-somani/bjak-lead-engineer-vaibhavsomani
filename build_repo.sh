#!/bin/bash
# Initialize git and make the required incremental commits
git init

# Commit 1
git add requirements.txt .env.example data/source_1_cv.md data/source_2_linkedin.md
git commit -m "feat: initialize project, knowledge base, and mock sources with intentional conflict"

# Commit 2
git add assistant.py
git commit -m "feat: implement RAG engine with strict grounding rules and local ChromaDB"

# Commit 3
git add cli.py test_eval.py
git commit -m "feat: add CLI interface and automated pytest evaluation suite"

# Commit 4
git add README.md
git commit -m "docs: finalize architecture decisions, evaluation results, and setup instructions"

# Tag submission
git tag submission

echo "Git history built successfully! Run 'git log' to see your commits."
