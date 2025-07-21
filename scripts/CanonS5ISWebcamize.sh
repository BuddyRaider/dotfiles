sudo rmmod -f v4l2loopback
sudo modprobe v4l2loopback
sudo webcamize -b -d 2 -l DEBUG
sudo rmmod -f v4l2loopback
sudo modprobe v4l2loopback
