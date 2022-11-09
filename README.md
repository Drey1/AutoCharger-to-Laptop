# AutoCharger-to-Laptop

	::------------------------------------------::
	::| Autocharger Script for Windows by Drey |::
	::------------------------------------------::

Automatically charge your windows laptop with a smart wifi plug when it goes through some ranges of battery charge.

There are times when we have a laptop as our main or work computer and we spend many hours in a row working with it always plugged in. This causes the lithium battery to lose useful life due to the effort that is always taking it to charge 100% and the temperature it reaches. It is also bad to charge it to 100% and discharge it completely to plug it back in until it is constantly complete the charging cycles.

Ideally, if you use your laptop always plugged in remove the battery from the laptop, the bad thing is that currently laptops are not usually able to remove the battery. So the second best option is always stays at 50%, for this the laptop brands usually have programs that freeze the percentage of battery that is charged to the one you want and thus always leave it at a fixed percentage always having it plugged in. The problem is that not all laptops or models are compatible or have these programs.

This happened to me with one of my laptops and that is why I programmed this script in Windows Batch that calculates the battery percentage and if it goes through the lower or upper limit that you can mark in the "min" and "max" variables, it activates or deactivates the smart wifi plug to which the charger is connected and thus keeps the laptop always in a safe battery range, unfortunately the battery does not suffer but if it loses charge cycles, it is the best option if you do not have a program that leaves you a fixed percentage.

To control the smart wifi plug you need to link it and make it compatible with IFTTT and set the trigger to be a Webhooks.

Finally you must open the Windows Task Scheduler (or some similar program) that allows you to run the script every X time. I recommend configuring it every 5 min and that it starts running with the start of windows.
