# create variables
LogFile="reports/build.log"
ExitCode=0
IsFastFail=true

# create directory for log file
mkdir -p reports
# clear log file
echo "" > $LogFile

function Log ()
{
	echo $1 2>&1 | tee -a $LogFile
}

function RunCommand()
{
	# first parameter is echo output
	echoOuput=$1
	# command is all other parameters
	command=${@:2}

	if [ "$echoOuput" = true ]; then
		Log "Running Command: \"$command\""
		$command 2>&1 | tee -a $LogFile
	else
		$command >> $LogFile
	fi

	commandExitCode=${PIPESTATUS[0]}

	if [ $commandExitCode -ne 0 ]; then
		ExitCode=1
		Log "    Command: \"$command\" Failed with exit code: $commandExitCode"
		Log "    See log file for more information: $LogFile"

		if [ $IsFastFail = true ]; then
			exit $ExitCode
		fi
	fi

}
