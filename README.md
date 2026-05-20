# Bash scripts for fetching apis

## Clone the repository

```bash
git clone https://github.com/ZiyadCh/fetch_scripts.git
cd fetch_script
```
## Give executable permission:
```
chmod +x get_fetch.sh post_fetch.sh
```
## Make the commands usable from any directory
```
sudo mv get_fetch.sh /usr/local/bin/get_fetch
sudo mv post_fetch.sh /usr/local/bin/post_fetch
```


## Usage
#### GET METHOD:
```bash
 get_fetch [endpoint] [optional: number of lines ]
```
example:
```
 eg: get_fetch localhost:8000/api/teachers
```
#### POST METHOD:
```
 post_fetch [endpoint] [json data payload]
```
example:
```
post_fetch localhost:8000/api/students '{                                   ─╯
  "nom": "Martin",
  "prenom": "Sophie",
  "photo": "profiles/sophie_martin.jpg",
  "naissance": "1990-11-23",
  "adresse": "45 Avenue des Roses, Lyon",
  "gender": "F",
  "phone": "+3698765432", 
  "password": "SuperSecurePassword456!"
}'
```
- (make sure to wrap the json inside single quotes '')

