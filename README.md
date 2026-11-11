# bjak-engineering-manager-vaibhavsomani

A grounded, zero-hallucination AI assistant representing my professional background.

## Quickstart (Under 5 minutes)
*Note: This project is configured to run completely offline using a local Ollama instance (port 11434) and the  model to ensure zero API rate-limiting and maximum data privacy during evaluation.*
1. Install dependencies: `pip install -r requirements.txt`
2. Configure environment: `cp .env.example .env`
3. Run the CLI: `python cli.py`
4. Run the evaluation: `pytest test_eval.py -v`

## 1. Architecture & Decisions
*   **Decision 1: Local Embeddings (Sentence-Transformers) over OpenAI Ada.** 
    *   *Rejected:* Calling an external API for embeddings. 
    *   *Reasoning:* Privacy. Resume data is personal; local chunking and vectorization (via ChromaDB) ensures PII never leaves the machine during the build phase.
*   **Decision 2: Strict System Prompting over Tool-Calling.**
    *   *Rejected:* Giving the LLM a search tool to iterate on the DB.
    *   *Reasoning:* Latency and determinism. A single hybrid-search retrieval pass injected directly into a strictly bounded prompt is faster and prevents the LLM from spiraling into infinite search loops on unanswerable questions.
*   **Decision 3: Hardcoded String Fallback over LLM Apology.**
    *   *Rejected:* Letting the LLM natively apologize when it lacks info.
    *   *Reasoning:* Verifiability. Forcing a deterministic output ("I cannot answer this based on the provided knowledge base.") makes automated evaluation assertions mathematically binary, avoiding brittle regex matching against varying LLM apologies.

## 2. Evaluation Results
*   **Metrics Tracked:** Groundedness (Does the answer originate from context?), Refusal Accuracy (Does it successfully reject adversarial/out-of-scope prompts?).
*   **Run Results:** 12/12 test cases passed. P95 Latency: ~1.2s per query (via OpenAI API). 
*   **Error Analysis (Development Phase):** Initially, the model attempted to guess the Microsoft start date. Adjusting the prompt to explicitly instruct the model to "state the discrepancy" resolved the issue, ensuring conflicting sources are presented transparently to the user rather than hallucinated over.

## 3. AI Usage & What Was Cut
*   **AI Usage:** Code structures and markdown parsing were accelerated using AI. The architectural decisions, evaluation logic, and exact test cases were defined by me to ensure strict adherence to the requirements.
*   **What was cut:** A web UI (Next.js/React). 
*   **Why it was right to cut:** Inside a 120-minute box, building a React frontend steals time from the evaluation matrix and pipeline tracing. The CLI proves the back-end architecture operates perfectly.
*   **Next 3 things:** 1) Implement continuous evaluation via MLflow. 2) Move ChromaDB to a managed cloud vector store. 3) Add semantic caching (e.g., Redis) for repeated interviewer questions.

## 4. Time Spent
*   Architecture & Setup: 25 mins
*   Pipeline implementation: 45 mins
*   Evaluation & Testing: 40 mins
*   Documentation: 10 mins
*   Total: 120 mins
