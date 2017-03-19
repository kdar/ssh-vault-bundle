# ssh-vault-bundle

Provides a way to encrypt text and bundle it into a bash script so that the recipient can run it and immediately see the decrypted text using rsa pub/priv keys.

## Getting Started

### Prerequisites

You need to be on x64 linux and have bash.

### Installing

Download the project

```
wget https://github.com/kdar/ssh-vault-bundle/archive/master.zip
```

Unzip it

```
unzip master.zip
```

### Usage

Say we want to send an encrypted message to your friend Bob. We have Bob's public key in `bob.rsa.pub`.

```
bash make.sh ./bob.rsa.pub
```

Now your text editor will pop up and you can enter the message you want to send. Afterward, we will have a `dist.sh` file that is created.

Now send `dist.sh` to Bob. Bob now only needs to run dist.sh on his machine with his private rsa key.

```
./dist.sh ~/.ssh/id_rsa
Hello! This is an encrypted message!
```

### Should I use this for secure communications?

Probably not.

## Built With

* [ssh-vault](https://github.com/ssh-vault/ssh-vault) - for encrypting with keys
* [makeself](https://github.com/megastep/makeself) - for packaging up script

## Contributing

Feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

