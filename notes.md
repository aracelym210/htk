## Creating a Dockerfile
Finding instructions online on how to create a container using a Kali container image was pretty straightforward. However, before installing base tools I discovered that the default recommended image comes pretty bare bones. I actually didn't even poke around too much to see what the container did or didn't have after checking for certain tools I knew I might want to use such as `dirbuster` or `gobuster`. From here, I think I asked ChatGPT to give me some base tools to install then I tweaked the list to add a couple of more. 

Installing the `gcloud` cli took me a little bit more time than I care to admit because of an error related to `apt-key` which is provided in the Google documentation instructions to import the Google Cloud public key. I very briefly reviewed some Google hits related to this, and from what I recall this is something that is no longer supported in Linux. So, I ended up adding a layer to download and unzip the binary tarball. I wanted to also install the `gke-gcloud-auth-plugin`, but was running into an issue completing that during the build of image even after trying to go the route of a startup script. I decided, in the end, that it's not too much effort to run the install command once I open the container. 

Overall, creating container image was pretty easy and can easily be tweaked. It remains to be seen if this containerized toolbox will be sufficient to use as opposed to a full-fledged VM for testing against Kubernetes Goat and beyond.

## References
### gcloud
- [kubectl GKE auth requirements](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl#gcloud_1)
- [gcloud cli install](https://cloud.google.com/sdk/docs/install#linux)

