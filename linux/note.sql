
挂载磁盘
-- mkdir /mnt/home
-- mount /dev/vdb1 /mnt/home

解挂磁盘
-- umount /dev/vdb1

chgrp -R mysql /mnt/home/mysql
chmod -R 770 /mnt/home/mysql