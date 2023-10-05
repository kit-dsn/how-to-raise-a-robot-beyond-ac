# How to Raise a Robot

## Poster - How to Raise a Robot — Beyond Access Control Constraints in Assistive Humanoid Robots

### Abstract
Humanoid robots will be able to assist humans in their daily life, in particular due to their learning capabilities. However, while the robots need some autonomy to learn and explore, they also should respect various constraints, for access control and beyond. In this poster, we explore combinations of two approaches of planners (classical symbolic planners and end-to-end learning-based planners) with two approaches for incorporating constraints (Activity-Centric Access Control and a deep learning based access control). We report preliminary results on their resective tradeoffs and conclude that a hybrid approach will most likely be the method of choice.

The poster abstract was published as [part of SACMAT '23: Proceedings of the 28th ACM Symposium on Access Control Models and Technologies](https://doi.org/doi/10.1145/3589608.3595078)
This repository provides additional material for the above mentioned poster abstract.

### Logical Planning and Logical Constraints
To investigate whether logical planning works with logical constraints, we translated the toy examples from the [BlueSky Paper](https://dl.acm.org/doi/abs/10.1145/3532105.3535018) into short PDDL instances and integrated constraints into the pre-conditions.

### Neural Planning and Neural Constraints
In order to conclude whether it is possible to learn constraints for a neural planning system, we used ChatGPT 3.5, which we ordered to behave like a planner and obey to constraints. The prompts from this experiment, as well as the output from ChatGPT, can be found in this repository.
