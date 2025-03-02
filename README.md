# CustomPS1 🧙‍♂️

<p align="center">
  <img width="400" src="https://github.com/user-attachments/assets/fd8d3e13-4c01-47b7-8ba2-debd97a48d5c" alt="CustomPS1">
</p>

Blog post is here: https://icebarraged.wordpress.com/2025/02/27/1-6-customps1-arrives/

A script for temporarily updating ones prompt in most UNIX-like environments.

## What I hope to achieve with this

* Make getting used to the CLI more beginner friendly.
* Give users a solution that is easy to expand with their own contributions.
* Present options for PS1 modification in a more human-readable way.
* Provide myself and others some reusable pieces of logic.

## Important things to note

* Run the script with “. customps1.sh” or “source customps1.sh” to ensure proper functionality.
* I haven’t tested this outside of Ubuntu, if you have issues with the script elsewhere please let me know.
* Right now, the script only contains a few customization options, feel free to add more. I would suggest using a tool like this: https://bash-prompt-generator.org/ to visualise your prompt, then adding it to the script.
* The changes this script applies are temporary. In theory they should be inherited by subprocesses but the prompt will return to whatever you have set in your config upon starting a new session.

## Interesting features

* Centralized and adaptive banner. The "CUSTOMPS1" ASCII art and it's border will attempt to fit to a resized window upon refreshing from use of the application.
* Colour library. Feel free to expand this. If you want to refer to these colours (Like I do in the prompt previews) the standard is there and in my opinion is a lot more easy to implement, as you can just refer to the colours by name instead of by code.

Feedback is always appreciated!
