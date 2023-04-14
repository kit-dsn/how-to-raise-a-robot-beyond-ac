(define (problem dishwasher_problem) (:domain dishwasher)
(:objects
    robot - robot
    dishwasher - dishwasher
    dish - locatable
    start - location
    table - location
    dishwasher_loc - location
    dish_loc - location
)

(:init

    (at robot start)
    (at dishwasher dishwasher_loc)

    (at dish table)
    (graspable dish)
    
    (path start dishwasher_loc)
    (path dishwasher_loc start)

    (path start table)
    (path table start)
    (path dishwasher_loc table)
    (path table dishwasher_loc)

    (washer-closed)
    (not (washer-open))
    (graspable dishwasher)
    (arm-free)

    (dishwashable dish)

    (= (current_load dishwasher) 1)
    (= (capacity dishwasher) 10)

)

(:goal (and
    (dish_loaded dish dishwasher)
    (washer-closed)
))

)