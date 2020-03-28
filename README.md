# joomla-docker

### What is this repository about?
I wanted a way to develop my Joomla components in Docker, and be able to start / stop / refresh a brand new Joomla site with my component installed and ready to go. There were existing Joomla docker images, but they all required you to complete the normal setup process via the Joomla web installer. 

This project will build a complete Docker container with a LAMP stack installed and the Joomla CMS installed and pre-configured for you. You can also have it pre-install your component (thanks Nic from Akeeba!) if you desire.

### To run this docker container:
Install Docker for your OS: https://docs.docker.com/get-docker/

From a command line run
`docker image build -t [your_image_tag] .`

Once the image is built you can
`docker run -d --name [your_container_name] -p 8080:80 -it [your_image_tag]`

If you want to link the code you're working on into the container, try
`docker run -d -v ~/[your_work_dir]/:/var/www/example.com/work_directory --name [your_container_name] -p 8080:80 -it [your_image_tag]`

### To auto-install a Joomla component you're working on
Create an installable archive of your extension and name it `Archive.zip`. Leave this in the directory you're linking to `work_directory` (`your_work_dir` in the command above), then uncomment the two lines noted in the `scripts/init.sh` file.

Once the container is booted you can browse to http://localhost:8080 to visit your new Joomla site. 

If you want to change the version of Joomla, edit the Dockerfile and change line 6 as needed.

If you want to contribute, fork this repository and submit pull requests.

TODO: upgrade to PHP 7.x and add option for Joomla 4.x