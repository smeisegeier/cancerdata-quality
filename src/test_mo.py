import marimo

__generated_with = "0.18.4"
app = marimo.App()


@app.cell
def _(mo):
    mo.md(r"""
    # test
    using marimo
    """)
    return


@app.cell
def _(mo):
    mo.md(r"""
    ```mermaid
    %%{init: {'theme': 'forest'}}%%
    treemap
    "Tumore (TNM-relevante Diagnose)"
        "Histologisch gesichert (Primaertumor) (h)"
            "Grading liegt vor* (g)": 45
            "pT liegt vor (a)"
                "pN liegt vor (f)": 30
                "Relevante OP (b)"
                    "Gueltiger R-Status ja (d)": 55
                    "Gueltiger R-Status nein": 15
                "Keine relevante OP (b)": 10
            "pT liegt nicht vor"
                "Relevante OP (c)"
                    "Gueltiger R-Status ja (e)": 25
                    "Gueltiger R-Status nein (c)": 12
                "Keine relevante OP (c)": 8
        "(x)": 20
    ```
    <!-- "Andere Diagnosesicherung": 20 -->
    """)
    return


@app.cell
def _():
    # lol
    return


@app.cell
def _(mo):
    mo.md(r"""
    ```mermaid
    graph TD
        %% Define Swimlanes using Subgraphs
        subgraph S1 [Phase 1: Diagnosesicherung]
            Start["Tumore<br/>(TNM-relevante Diagnose)"]
            Other["Andere Diagnosesicherung"]
            Hist["Histologisch gesichert (h)"]
            Grading["Grading liegt vor* (g)"]
        end

        subgraph S2 [Phase 2: Tumor Staging]
            pT_Yes["pT liegt vor (a)"]
            pT_No["pT liegt nicht vor"]
            pN["pN liegt vor (f)"]
        end

        subgraph S3 [Phase 3: OP & R-Status]
            OP_B["Relevante OP (b)"]
            No_OP_B["Keine relevante OP"]
            OP_C["Relevante OP (c)"]
            No_OP_C["Keine relevante OP"]
            R_D["Gültiger R-Status Ja(d)/nein"]
            R_E["Gültiger R-Status Ja(e)/nein"]
        end

        %% Logic Connections
        Start --> Hist
        Start --> Other
        Hist -.-> Grading

        Hist --> pT_Yes
        Hist --> pT_No
        pT_Yes -.-> pN

        pT_Yes --> OP_B
        pT_Yes --> No_OP_B

        pT_No --> OP_C
        pT_No --> No_OP_C

        OP_B --> R_D
        OP_C --> R_E

        %% Styling for Swimlane look
        style S1 fill:#f5f5f5,stroke:#333,stroke-dasharray: 5 5
        style S2 fill:#fff,stroke:#333,stroke-dasharray: 5 5
        style S3 fill:#f5f5f5,stroke:#333,stroke-dasharray: 5 5
    ```
    """)
    return


@app.cell
def _(mo):
    mo.md(r"""
    ```mermaid
    mindmap
      root((mindmap))
        Origins
          Long history
          ::icon(fa fa-book)
          Popularisation
            British popular psychology author Tony Buzan
        Research
          On effectiveness<br/>and features
          On Automatic creation
            Uses
                Creative techniques
                Strategic planning
                Argument mapping
        Tools
          Pen and paper
          Mermaid
    ```
    """)
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
