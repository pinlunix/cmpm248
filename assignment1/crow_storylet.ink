VAR suspicion_level = 0
VAR crow_flirt_level = 0

->start_crow_convo
==start_crow_convo==
You open the door to face the body of a well-built man dressed in a black suit with leafy grapevine patterns. The body leans against the doorframe, arms loosely crossed. You look up to see the body has the head of a crow, who can surprisingly be described as handsome. His stunning black feathers shone iridescently in the light. His shining dark eyes gazed down at you. You can almost see a smirking expression.

“How may I help you, darling?” asks the crow.
-(opts)
    * (cutting_to_the_chase)[Ask about air fryer] "Do you know anything about the air fryer in the shared kitchen downstairs?"
        The crow tilts his head.
        "Cutting to the chase I see. Let's slow down for a moment and introduce ourselves. My name is Midnight. And yours?"
    *{cutting_to_the_chase}[Cutting to the chase?] Why did he say "Cutting to the chase?" You smell something fishy. "Where were you last night?" you ask.
            He replied, "I was feeling a bit peckish last night and went to the cafe next door to buy something to snack on. I heated it up in the kitchen."
            ~suspicion_level = suspicion_level + 1
            ->location_revealed
    * (impatient){cutting_to_the_chase}[Impatient] "Mr. Midnight, this is an urgent matter. Please cooperate with me," you urge.
            The crow smiles and nods, appearing to agree to cooperate.
    * (introduce){cutting_to_the_chase}[Introduce yourself] You introduce yourself, barely. "I'm the maintenance worker who needs you to cooperate with me."
    * (flirt){not impatient}{not introduce}[Flirt] You smile sweetly. "Is your name Midnight, because you're the crow that's on my mind."
        The crow looks surprised. "My name actually is Midnight. You're making me blush." He raises a hand to fan himself while looking at the ceiling.
        ~ crow_flirt_level = crow_flirt_level + 1
    * {flirt}[Sweetly ask] You speak softly with a smile. "Midnight, would you happen to know anything about an air fryer in the shared kitchen?"
            He smiles endearingly. "Why yes, I used it to heat up a snack I bought from the cafe next door."
            ~ crow_flirt_level = crow_flirt_level + 1
            -> location_revealed
    * [Ask about location] "Where were you last night?" you ask.
        He replied, "I was feeling a bit peckish last night and went to the cafe next door to buy something to snack on. I heated it up in the kitchen."
        ->location_revealed
- -> opts

==location_revealed==
- (opts)
    * [Ask about heating] You follow up with the question. "What did you use to heat it up?"
        He responded, "I used the air fryer. It did a fantastic job. My food was heated very evenly."
        ~ suspicion_level = suspicion_level + 1
        -> air_fryer_qs
    * [Ask about food] "What food did you heat up?"
        "Brownies," he replied. "Oh, it was so delicious. You should try it. I can take you to the cafe this afternoon for a cup of coffee and some treats." He winks at you.
        ~ crow_flirt_level = crow_flirt_level + 1
        -> opts
    * (flirt)[Flirt] "Do you believe in love at first peck?" You ask in a sweet voice.
        He stares at you agape. Softly, he whispers, "Would you do the honors?" 
        ~ crow_flirt_level = crow_flirt_level + 1
        -> opts
    * {flirt}[Peck his cheek] You stand on tippy toes to peck his cheek. You still have a mission to accomplish and continue to question him. 
        ~ crow_flirt_level = crow_flirt_level + 1
        -> opts
    - -> air_fryer_qs
    
==air_fryer_qs==
- (opts)
    * (condition)[Air fryer condition] "Was the air fryer in good condition when you left?"
        He nodded. "Yes, it worked perfectly well when I used it. I made sure to clean up after myself. I wouldn't want to trouble you. Why?"
    * [Others using air fryer] "Did you see anyone else use the air fryer?"
        He shook his head. "No, I was the only one in the kitchen when I used the air fryer." He shrugs. "If someone came after, I wouldn't know."
        ~ suspicion_level = suspicion_level + 1
    * (buttons){condition}[Broken] You explain. "The air fryer was discovered to be broken this morning. Management is trying to find the cause."
        "My goodness," he exclaimed. "That's terrible news! It was in pristine condition last night. The buttons on it were gorgeous. I hope it gets fixed soon."
    * {buttons} [Buttons] "How did you use the buttons?"
        "I used the button to set the temperature for my food. One satisfying click did the job." He nods vigorously. "I will say that the click of the button is very satisfying. I wonder how they made it that way."
        ~ suspicion_level = suspicion_level + 1
    * [This morning] "Have you gone to the kitchen this morning?"
        He replies, "No, I was just getting dressed when you knocked on the door." He straightens his tie. "I am preparing to attend my friend's party. Would you like to be my plus one?" He winks.
            ~ crow_flirt_level = crow_flirt_level + 1
        ** [Accept] You smile and nod. "Yes, I can be your plus one. First, help me with this problem."
        ** [Reject] You flat out reject him. "No, I'm very busy. Please answer my questions."
    - -> opts


// idk how to connect this to the stuff above lol
==crow_end_convo==
You've asked all you needed from the crow. You say your farewell and walk away from the door.
Your boss rings you.
"What do you make of that crow guy?"
- {suspicion_level < 3 && crow_flirt_level < 2} "He has been very cooperative. I don't think he's supsicious."
- {suspicion_level < 3 && crow_flirt_level >= 2} "He has been cooperative. He's very charming as well. I think we got along very well."
- {suspicion_level == 3 && crow_flirt_level < 2} "He's raised a few red flags. He might be the culprit. We'll come back to it later."
- {suspicion_level == 3 && crow_flirt_level >= 2} "He's raised a few red flags. He might be culprit. He keeps trying to distract me with his flirtatious responses."
-> END

// after this storylet ends, let's say suspicion level needs to be 3 points to accuse the crow