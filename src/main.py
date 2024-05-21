import subprocess

if __name__ == "__main__":
    print("Hello from Python")
    result = subprocess.run( ["docker", "run", "-i", "hello-world"]
                           , stdout=subprocess.PIPE
                           , stderr=subprocess.PIPE
                           )


    if result.stderr:
        print("Error: ")
        print(result.stderr)
    else:
        hello_part = result.stdout.decode("utf-8").split("\n")[1]
        print(hello_part)
        print("That's all.")
