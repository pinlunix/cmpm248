

VAR suspicious = 0


-> at_door -> END 

== at_door ==

You drudge heavily to the door of the next room, 'Room ZZZ.'
It used to say '777', but someone's written on the plaque with a faded magic marker.

* [Knock politely on the door.]
    You knock politely on the door.

* (officious) [Knock officiously.]
    You rap your knuckles against the door in an official sort of way. One that makes it clear you have questions you expect to be answered.

* [Just knock.]
    You knock politely on the door.

- "It's open," comes a weak voice from inside.
-> loop
    
= loop
    
    {    
    - came_from(-> officious): 
        you came from officious!
    }
    
    -> DONE


=== function seen_ever(->x)
    // has this piece of content ever been seen?
    ~ return TURNS_SINCE(x) >= 0 

=== function came_from(-> x) 
    // were you at "x" during this turn
    ~ return TURNS_SINCE(x) == 0
    
=== function one_turn_after(-> x) 
    // were you at "x" during the last turn (or this one)
    ~ return TURNS_SINCE(x) <= 1 && seen_ever(x)
    
=== function seen_very_recently(-> x)
    // did we see this line recently?
    ~ return TURNS_SINCE(x) <= 3 && seen_ever(x)

=== function limitToThree() 
    // Overboard's house style is to limit every moment to 3 choices maximum 
    // We actually do this in the UI, but you can do it in inky if you want to
    ~ return CHOICE_COUNT() < 3 
