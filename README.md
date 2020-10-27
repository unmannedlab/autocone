AUTOCONE

This is a traffic safety application to provide an early warning system to prevent distracted drivers from colliding with moving road service convoys. The primary application of this repo is to provide the code base used to control an inexpensive rover and intelligently guide it behind a lead vehicle.

Hardware overview:
- Computer: Any computer with ros kinetic which can operate on the platform. The code used a raspberry pi 3b+
- Motor Controllers: RobotEQ
- GPS: Ardusimple RTK2B

Setup:
- Setup a catkin workspace within the ros workspace.
- Within the src folder clone the following git repositories into the src directory:
  * https://github.com/unmannedlab/autocone.git
  * https://github.com/unmannedlab/ubxtranslator.git
  * https://github.com/AIS-Bonn/nimbro_network.git
  * https://github.com/unmannedlab/omnicone.git
- copy all of the files from src/autocone/launch/for_nimbro_network to src/nimbro_network/nimbro_topic_transport/launch/
- copy all of the files from src/autocone/launch/for_ubx_translator to src/ubxtranslator/launch/
- copy all of the files from src/autocone/nodes/for_ubx_translator to src/ubxtranslator/nodes/
- in the workspace root directory run: 
  * catkin_make
  * source devel/setup.bash

 
