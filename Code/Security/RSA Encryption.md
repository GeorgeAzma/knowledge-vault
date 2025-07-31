[[Encryption#Symmetric Encryption|Symmetric Encryption]] algorithm `Rivest–Shamir–Adleman`
### How It Works
- Select 2 primes $(P,Q)$ `(7,19)`
- Calculate product $N=PQ$ `133`
- Calculate totioent $T=(P-1)(Q-1)$ `108`
- Select public key $E$ `29`
	- Must be prime `only divisible by 1 and itself`
	- Must be less than totient `108`
	- Most not be factor of totient `54, 27...`
- Select private key $D$ `41`
	- `(D * E) % T = 1`
- Encrypt message $M$ `60`
	- `C = M^E % N` `86`
- Decrypt cypher
	- `M = C^D % N` `60`
``` python
import random

# Helper function to compute the greatest common divisor
def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a


# Helper function to find modular inverse
def modinv(a, m):
    m0, x0, x1 = m, 0, 1
    if m == 1:
        return 0
    while a > 1:
        q = a // m
        m, a = a % m, m
        x0, x1 = x1 - q * x0, x0
    if x1 < 0:
        x1 += m0
    return x1


# Function to generate RSA keys
def generate_keys():
    p = 61  # A prime number
    q = 53  # Another prime number
    n = p * q  # Modulus
    phi = (p - 1) * (q - 1)  # Euler's totient function
    e = 17  # Public exponent
    while gcd(e, phi) != 1:
        e += 2
    d = modinv(e, phi)  # Private exponent
    return ((e, n), (d, n))  # Public and private keys


# Function to encrypt a message with the public key
def encrypt(public_key, plaintext):
    e, n = public_key
    return [pow(ord(char), e, n) for char in plaintext]


# Function to decrypt a message with the private key
def decrypt(private_key, ciphertext):
    d, n = private_key
    return "".join([chr(pow(char, d, n)) for char in ciphertext])


# Demonstration of RSA algorithm
public_key, private_key = generate_keys()
print("Public Key:", public_key)
print("Private Key:", private_key)

message = "HELLO"
print("Original Message:", message)

encrypted_message = encrypt(public_key, message)
print("Encrypted Message:", encrypted_message)

decrypted_message = decrypt(private_key, encrypted_message)
print("Decrypted Message:", decrypted_message)

```
