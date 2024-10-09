# azcopy test case

Quick test case to check whether azcopy traffic is blocked in different environments


## Setup

- Azure tenancy with a storage container, with a blob in it to download called `sample_file.txt`
- Add a guest user, set their role in the storage container to be a azure blob contributor or reader
- copy `.env.sample` to `.env` and edit the variables 

## Test

Run this, logging in using the guest user that you created above

```shell
docker compose --build up
```
and then there should be a sample file in the data directory