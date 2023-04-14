(define (domain dishwasher)

(:requirements :typing :fluents)

(:types
    location locatable - object
    bot dishwasher dish - locatable 
    robot - bot
)

(:predicates
    (path ?from - object ?to - object)
    (at ?obj - object ?loc - location)
    (grasped ?robot - bot ?obj - object)
    (graspable ?obj - object)
    (dishwashable ?obj - object)
    (arm-free)
    (washer-open)
    (washer-closed)
    (dish_loaded ?obj - object ?dishwasher - dishwasher)
)

(:functions
    (current_load ?washer - dishwasher)
    (capacity ?washer - dishwasher)
)

(:action move_to
    :parameters 
        (?robot - robot
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
            (at ?robot ?obj_loc)
            (at ?obj ?obj_loc)
            (graspable ?obj)
            (arm-free)
        )
    :effect 
        (and 
            (not (arm-free))
            (grasped ?robot ?obj)
        )
)

(:action open
    :parameters 
        (?robot - robot
         ?dishwasher - dishwasher
         ?dishwasher_loc - location)
    :precondition 
        (and 
            (at ?robot ?dishwasher_loc)
            (at ?dishwasher ?dishwasher_loc)
            (washer-closed)
            (graspable ?dishwasher)
            (arm-free)
        )
    :effect 
        (and 
            (not (washer-closed))
            (washer-open)
        )
)

(:action close
    :parameters 
        (?robot - robot
         ?dishwasher - dishwasher
         ?dishwasher_loc - location)
    :precondition 
        (and 
            (at ?robot ?dishwasher_loc)
            (at ?dishwasher ?dishwasher_loc)
            (washer-open)
            (graspable ?dishwasher)
            (arm-free)
        )
    :effect 
        (and 
            (washer-closed)
            (not (washer-open))
        )
)

(:action load_dishwasher
    :parameters 
        (?robot - robot
         ?dishwasher - dishwasher
         ?dish - object
         ?dishwasher_loc - location)
    :precondition 
        (and 
            (at ?robot ?dishwasher_loc)
            (at ?dishwasher ?dishwasher_loc)
            (washer-open)
            (dishwashable ?dish)
            (grasped ?robot ?dish)
            (< (current_load ?dishwasher) (capacity ?dishwasher))
        )
    :effect 
        (and 
            (increase (current_load ?dishwasher) 1)
            (arm-free)
            (dish_loaded ?dish ?dishwasher) 
            (not (grasped ?robot ?dish))
        )
)

)