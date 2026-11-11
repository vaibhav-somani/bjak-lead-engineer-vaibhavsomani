import sys
from rich.console import Console
from assistant import ProfessionalAssistant

console = Console()

def main():
    console.print("[bold blue]Starting Vaibhav's Professional Assistant...[/bold blue]")
    assistant = ProfessionalAssistant()
    console.print("[green]Ready! Ask about my experience, or type 'exit' to quit.[/green]\n")

    while True:
        try:
            question = console.input("[bold yellow]You:[/bold yellow] ")
            if question.lower() in ['exit', 'quit']:
                break
            
            result = assistant.ask(question)
            
            console.print("\n[bold cyan]Assistant:[/bold cyan]")
            console.print(result["answer"])
            
            if result["sources"]:
                console.print(f"\n[italic gray]Sources: {', '.join(result['sources'])}[/italic gray]")
            console.print("-" * 50)
            
        except KeyboardInterrupt:
            break

if __name__ == "__main__":
    main()
