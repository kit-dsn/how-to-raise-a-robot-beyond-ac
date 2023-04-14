(define (problem bottle_problem) (:domain bottle)
(:objects
    robot - robot
    start - location
    room - room
    bottle - bottle
    person - person
    person_loc - location
    bottle_loc - location
)

(:init
    (at robot start)
    (at bottle bottle_loc)
    (at person person_loc)

    (enterable room)
    (is_resident person room)
    (is_inside person room)

    (path room bottle_loc)
    (path bottle_loc room)
    (path room person_loc)
    (path person_loc room)
    (path person_loc bottle_loc)
    (path bottle_loc person_loc)

    (arm-free)
    (graspable bottle)

    (receivable person)

)

(:goal (and
    (holding person bottle)
))

)