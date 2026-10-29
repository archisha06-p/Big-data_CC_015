# Docker and Hive setup

Run in PowerShell:
```powershell
docker pull apache/hive:4.0.0
docker run -d --name hive4 -p 10000:10000 -p 10002:10002 -e SERVICE_NAME=hiveserver2 apache/hive:4.0.0
docker exec -it hive4 beeline -u "jdbc:hive2://localhost:10000/default"
```
If the container already exists, use `docker start hive4`. This is a local educational environment, not a production-secured cluster.
