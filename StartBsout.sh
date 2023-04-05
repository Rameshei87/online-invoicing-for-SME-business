export ORACLE_HOME=/home/oracle/dbase/db_1
export LD_LIBRARY_PATH=/home/oracle/dbase/db_1/lib:/usr/lib:/home/wbsbatch/PM/lib:/home/wbsbatch/PM/FrameworkLib_3.6/OracleLib
cd /home/wbsbatch/PM/bin
SAL=`ps -ef|grep PM_Bsout |grep -v "grep"|awk {'print $1'}`
if [ "$SAL" != "" ]
then
echo "PM_Bsout is already running"
else
POL=`ls /data2/PM/signal/BSOUT/|grep "bsout." |wc|awk '{print $1}'`
if [ "$POL" != 0 ]
then
echo "Remove any Lock or stop file present"
rm /data2/PM/signal/BSOUT/BSOUT*
fi
./PM_Bsout &
fi
