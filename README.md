# oxidized

This suppose you deploy on k8s so there is the deployment.yaml

# prerequirement

you need to prepare 3 secrets
1. Device, this is for oxidized to find the target devices
```yaml
apiVersion: v1
data:
  device.db: <fill in the db content>
kind: Secret
metadata:
  name: device
  namespace: oxidized
``` 
2. oxidized-git-login this is for oxidized to save config to git
```yaml
apiVersion: v1
data:
  password: xxxxxx
  username: xxxxxxx
kind: Secret
metadata:
  name: oxidized-git-login
  namespace: oxidized
```

3. ldap, this is for ldap login oxidized
```yaml
apiVersion: v1
data:
  bind: id=ldap,cn=users,cn=accounts,dc=abc,dc=com
  password: xxxxxxxxxxxxxxxxxx
  url: ldap://ldap.abc.com:389/cn=users,cn=accounts,dc=abc,dc=com?uid?sub?(&(objectClass=person)(memberOf=cn=<targetgroup>,cn=groups,cn=accounts,dc=abc,dc=com))
kind: Secret
metadata:
  name: ldap
  namespace: oxidized

```
# concept
1. setup git for config backup storage
2. setup the oxidized
3. as oxidized do not have auth solution so we use nginx to create the ldap login feature
