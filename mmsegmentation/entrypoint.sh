echo 'entrypoint'
/usr/sbin/sshd

bash /root/code/init.sh

#exec args
exec "$@"
