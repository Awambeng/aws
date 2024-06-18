# How to set up secure credential storage for docker using docker credential helper

Docker containers often need to access various services and resources that require authentication credentials, such as private container registries, databases, or cloud storage. To avoid storing these sensitive credentials directly in your Docker configuration files, you can use the Docker credential helper to securely manage and store your credentials.

The pass credential helper is a plugin that integrates with the Docker client to handle credential storage and retrieval. It allows you to store your credentials in a secure password store managed by the pass password manager, and retrieve them when needed by your Docker containers.

# Prerequisites

- Docker installed on your system
- golang-docker-credential-helpers
- pass password manager installed and configured on your system
- A GPG key for encrypting the pass password store

# What is golang-docker-credential-helpers

golang-docker-credential-helpers is a Go library that provides a set of credential helpers for Docker, which allow Docker to integrate with various password managers and credential storage systems like osxkeychain(macOS), wincredman(Windows), pass(Linux).

# Install golang-docker-credential-helpers

```bash
sudo apt install golang-docker-credential-helpers
```

# Setting up the pass Credential Helper

1. Install pass
```bash
   sudo apt-get install pass
```

2. Configure with GPG key
If you don't have a GPG key already, generate a new one using the command below:
```bash
gpg --gen-key
```

After generating your GPG Key you will need to use the ID to initialize pass. You can get the ID of the GPG Key as follows:

```bash 
gpg --list-key
```

The output will look as follows:
```bash
pub   rsa3072 2021-02-09 [SC] [expires: 2022-02-09]
      3782CBB60147010B330523DD26FBCC7836BF353A
uid                      John Doe (Fedora Docs) <johndoe@example.com>
sub   rsa3072 2021-02-09 [E] [expires: 2022-02-09]
```

The ID of the key is just the last 8 characters of the hexadecimal number in the result above ```3782CBB60147010B330523DD26FBCC7836BF353A``` which will be ```36BF353A```

Finally Initialize the Credential Helper using the command:
```bash
pass init "Your GPG Key ID"
```

3. Configure Docker to Use the Credential Helper:
Open your Docker configuration file (usually located at ~/.docker/config.json on Unix-based systems) and add the following:
```bash
{
  "credsStore": "pass"
}
```

# Try Connecting to any container registry in our case we will test docker hub

To login to docker hub use the following command:
```bash
docker login --username your-username --password your-password
```

# Conclusion

By following these steps, you can securely store your Docker credentials using the pass credential helper and avoid the need to manage sensitive information directly in your Docker configuration.