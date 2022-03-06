# cron-schedule explanation

Since the data file will be available at 1am everyday, the python script (section1_pipeline)
that does the transformation of these files will need to be executed after 1am.

In this case, I have planned to schedule to cron job at 2am daily. 

First, I added a new cron job to corntab in visual studio code terminal
```
crontab -e
```

I will then be brought into the vi editor. In the editor, I added the command to schedule the job at 2am everyday 

```
0 2 * * *  /usr/bin/python /Users/beatrice/Downloads/dataeng_test-master/section1/section1_pipeline.py
```


Explanations of the command:
<br> <b>1.</b> 0 2 * * * indicates that the job will be scheduled to run at 2am daily (0 minute, 2hour, all day (month), all month, all day (week))
<br><br>  <b>2.</b> /usr/bin/python indicates where my python files is installed
<br><br>  <b>3.</b> /Users/beatrice/Downloads/dataeng_test-master/section1/section1_pipeline.py indicates the path where it stores the python script for transformation

Then, exit the editor and enter ```:wq``` to save and quit the file. 