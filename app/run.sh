#! /bin/msh

# Go into the directory of the application.
P=`readlink -f "$0"`
cd "`dirname "$P"`" || exit $?

# Kill all stray process instances.
echo "Killing other instances of the application ..."
killall app 2> /dev/null

# Deploy the "web interface"
cp index.html /home/httpd/
mkdir -p /home/httpd/imgs
cp leanXzebra.jpg /home/httpd/imgs/

# Run the application
echo "Running the application..."
./app
echo "The application quit with an exit status of $?."
