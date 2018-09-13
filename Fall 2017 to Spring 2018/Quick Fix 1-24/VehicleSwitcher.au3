
Global $continue
Global $delay


$continue = 1
$delay = 500

While $continue==1
  Sleep($delay)

  WinActivate("Mission Planner 1.3.52 build 1.3.52.0 APM:Rover v3.1.2 (0fa522b8)", "")

  ControlClick("Mission Planner 1.3.52 build 1.3.52.0 APM:Rover v3.1.2 (0fa522b8)", "", "[NAME:cmb_sysid]")

  Send("{DOWN}")
  Send("{ENTER}")

  Sleep($delay)

  ControlClick("Mission Planner 1.3.52 build 1.3.52.0 APM:Rover v3.1.2 (0fa522b8)", "", "[NAME:cmb_sysid]")

  Send("{UP}")
  Send("{ENTER}")
WEnd
