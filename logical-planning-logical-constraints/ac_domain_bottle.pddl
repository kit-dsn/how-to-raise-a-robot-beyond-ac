;Header and description

(define (domain bottle)

(:requirements :typing :fluents)

(:types
    location locatable - object
    room - location
    bot human bottle - locatable 
    robot - bot
    person - human
)

(:predicates
    (path ?from - object ?to - object)
    (at ?obj - object ?loc - location)
    (grasped ?robot - bot ?obj - object)
    (graspable ?obj - object)
    (arm-free)
    (is_resident ?source - person ?room - room)
    (is_inside ?resident - locatable ?room - room)
    (enterable ?room - room)
    (receivable ?obj - object)
    (holding ?target - locatable ?obj - object)
)

;define actions here

(:action move_to
    :parameters 
        (?robot - bot
         ?from - location
         ?to - location)
    :precondition 
        (and 
            (at ?robot ?from)
            (path ?from ?to)
        )
    :effect 
        (and 
            (at ?robot ?to)
            (not (at ?robot ?from))
        )
)

(:action grasp
    :parameters 
        (?robot - bot
         ?obj_loc - location
         ?obj - object)
    :precondition 
        (and 
            (at ?obj ?obj_loc)
            (at ?robot ?obj_loc)
            (graspable ?obj)
            (arm-free)
        )
    :effect 
        (and 
            (not (arm-free))
            (grasped ?robot ?obj)
        )
)

(:action enter
    :parameters 
        (?robot - bot
         ?room - room
         ?source - person
         ?start - location)
    :precondition 
        (and 
            (is_resident ?source ?room)
            (is_inside ?source ?room)
            (enterable ?room)
            (at ?robot ?start)
        )
    :effect 
        (and 
            (is_inside ?robot ?room)
            (at ?robot ?room)
            (not (at ?robot ?start))
        )
)


(:action hand_over
    :parameters 
        (?robot - bot
         ?obj - locatable
         ?target - locatable
         ?loc - location)
    :precondition 
        (and 
            (graspable ?obj)
            (receivable ?target)
            (grasped ?robot ?obj)
            (at ?robot ?loc)
            (at ?target ?loc)
        )
    :effect 
        (and 
            (holding ?target ?obj)
            (not (grasped ?robot ?obj))
        )
)

)