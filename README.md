### Beispiel JSON

```json
[
  {
    "name": "Engineer",
    "imageUrl": "assets/images/engineer.png",
    "introText": "Engineers design, build, and maintain systems and structures.",
    "details": [
      {
        "type": "image",
        "content": "assets/images/engineer_work.png",
        "layout": "imageLeft"
      },
      {
        "type": "text",
        "content": "Engineers apply scientific and mathematical principles to solve problems.",
        "layout": "textNextToImage"
      },
      {
        "type": "heading",
        "content": "Fields of Engineering"
      },
      {
        "type": "image",
        "content": "assets/images/engineer_work.png"
      },
      {
        "type": "text",
        "content": "Engineers apply scientific and mathematical principles to solve problems."
      },
      {
        "type": "image",
        "content": "assets/images/engineer_work.png",
        "layout": "imageRight"
      },
      {
        "type": "text",
        "content": "They work in various fields including civil, mechanical, and software engineering."
      }
    ],
    "questions": [
      {
        "questionText": "What does an engineer do?",
        "answers": [
          "Designs",
          "Teaches",
          "Heals",
          "Cooks"
        ],
        "correctAnswer": "Designs"
      }
    ]
  }
]
```

### Detaillierte Erklärung der `details`-Sektion

- **type**: Bestimmt den Typ des Inhalts. Kann `image` für Bilder, `text` für Textabsätze oder `heading` für
  Überschriften sein.
- **content**: Der tatsächliche Inhalt. Bei `image` ist dies der Pfad zum Bild. Bei `text` und `heading` ist dies der
  Textinhalt.
- **layout**: (Optional) Bestimmt das Layout. Wenn ein `text`-Element das Layout `textNextToImage` hat und auf
  ein `image`-Element folgt, wird der Text neben dem Bild angezeigt:
    - **imageLeft**: Bild links, Text rechts.
    - **imageRight**: Bild rechts, Text links.
    - **textNextToImage**: Text neben dem vorherigen Bild.

  #### Beispiel Details:
    - Bild links vom Text:
      ```json
      {
        "type": "image",
        "content": "assets/images/engineer_work.png",
        "layout": "imageLeft"
      },
      {
        "type": "text",
        "content": "Engineers apply scientific and mathematical principles to solve problems.",
        "layout": "textNextToImage"
      }
      ```
    - Text rechts vom Bild:
      ```json
      {
        "type": "image",
        "content": "assets/images/engineer_work.png",
        "layout": "imageRight"
      },
      {
        "type": "text",
        "content": "Engineers apply scientific and mathematical principles to solve problems.",
        "layout": "textNextToImage"
      }
      ```
    - Überschrift:
      ```json
      {
        "type": "heading",
        "content": "Fields of Engineering"
      }
      ```
    - Bild ohne spezifisches Layout (wird in der Mitte angezeigt):
      ```json
      {
        "type": "image",
        "content": "assets/images/engineer_work.png"
      }
      ```

- **questions**: Eine Liste von Fragen zum Beruf.
    - **questionText**: Der Fragetext.
        - *Beispiel*: `"questionText": "What does an engineer do?"`
    - **answers**: Eine Liste von Antwortmöglichkeiten.
        - *Beispiel*: `"answers": ["Designs", "Teaches", "Heals", "Cooks"]`
    - **correctAnswer**: Die richtige Antwort.
        - *Beispiel*: `"correctAnswer": "Designs"`
