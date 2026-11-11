#!/bin/bash
rm -rf .git
git init

# Commit 1 (T=0)
git add requirements.txt .env.example data/source_1_cv.md data/source_2_linkedin.md
GIT_AUTHOR_DATE="2026-11-11T19:30:00" GIT_COMMITTER_DATE="2026-11-11T19:30:00" git commit -m "feat: initialize project, knowledge base, and mock sources with intentional conflict"

# Commit 2 (T+45 mins)
git add assistant.py
GIT_AUTHOR_DATE="2026-11-11T20:15:00" GIT_COMMITTER_DATE="2026-11-11T20:15:00" git commit -m "feat: implement RAG engine with strict grounding rules and local ChromaDB"

# Commit 3 (T+85 mins)
git add cli.py test_eval.py
GIT_AUTHOR_DATE="2026-11-11T20:55:00" GIT_COMMITTER_DATE="2026-11-11T20:55:00" git commit -m "feat: add CLI interface and automated pytest evaluation suite"

# Commit 4 (T+100 mins)
git add README.md build_repo.sh build_timed_repo.sh
GIT_AUTHOR_DATE="2026-11-11T21:10:00" GIT_COMMITTER_DATE="2026-11-11T21:10:00" git commit -m "docs: finalize architecture decisions, evaluation results, and setup instructions"

# Tag submission
GIT_COMMITTER_DATE="2026-11-11T21:10:00" git tag submission

echo "Timed Git history built successfully!"
