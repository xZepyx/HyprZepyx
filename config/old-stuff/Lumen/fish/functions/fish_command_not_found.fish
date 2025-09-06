function fish_command_not_found
    set insults \
        "Did you mistype or is your keyboard drunk?" \
        "Command not found. Brain not found either." \
        "You're the reason man pages exist." \
        "Typed like a toddler on caffeine." \
        "That command? It died of cringe." \
        "Even a potato can type better." \
        "Next time, let your cat try. Might get closer." \
        "You're basically speedrunning incompetence." \
        "Mistyping like it's an Olympic sport." \
        "You type like you’re trying to summon Satan." \
        "Linux is crying. Just stop." \
        "This isn’t hacking. This is embarrassing." \
        "You missed so hard, Vim started shaking." \
        "The command line just sighed." \
        "Even Clippy gave up on you." \
        "Your keyboard wants a new owner." \
        "404: Skill not found." \
        "That typo gave me cancer." \
        "I’ve seen AI generate better commands." \
        "Congrats, you typed literal garbage." \
        "You make typos look intentional." \
        "Try typing with your eyes open next time." \
        "You’re a walking StackOverflow question." \
        "Was that a command or an error generator?" \
        "You misspelled 'help'." \
        "You're the reason people use GUIs." \
        "Command not found. Neither is your talent." \
        "Go home, you're drunk on typos." \
        "Mistyped again? Classic you." \
        "Every time you type, a sysadmin cries." \
        "If you were a script, you'd be /dev/null." \
        "Your command line skills belong in the trash." \
        "Try again. This time, sober." \
        "Just alias 'fail' to your name." \
        "Type slower. Think harder. Or don’t." \
        "Your autocorrect gave up years ago." \
        "If mistakes built muscles, you'd be jacked." \
        "Command not found. Ego destroyed." \
        "Even Notepad would reject that." \
        "You just softlocked your own terminal." \
        "You're keyboard smashing with confidence." \
        "That wasn't a command. That was a cry for help." \
        "Shell shock from secondhand embarrassment." \
        "Why type when you can guess wrong every time?" \
        "Commands aren't supposed to look like gibberish." \
        "This isn't improv. Learn the script." \
        "You pressed keys. That’s about it." \
        "Error 9000: User is untrainable." \
        "That wasn’t a typo. That was performance art." \
        "The shell refuses to acknowledge that."

    set count (count $insults)
    set index (math (random) % $count + 1)
    set insult $insults[$index]
    set_color red
    echo "$insult (You typed: '$argv')"
    set_color normal
end
