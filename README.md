# joomla-docker
To run this docker container:
Install Docker for your OS-- https://docs.docker.com/get-docker/

From a command line run
`docker image build -t [your_image_tag] .`

Once the image is built you can
`docker run -d --name [your_container_name] -p 8080:80 -it [your_image_tag]`

If you want to link the code you're working on into the container, try
`docker run -d -v ~/[your_work_dir]/:/var/www/example.com/work_directory --name [your_container_name] -p 8080:80 -it [your_image_tag]`

To auto-install a Joomla component you're working on, create an installable archive of your extension and name it Atchive.zip. Leave this in the directory you're linking to `work_directory`, then uncomment the two noted lines in the scripts/init.sh file.

Once the container is booted you can browse to http://localhost:8080 to visit your new Joomla site. 

If you want to change the version of Joomla, edit the Dockerfile.

If you want to contribute, fork this repository and submit pull requests.