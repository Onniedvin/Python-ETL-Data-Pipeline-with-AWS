# AWS:n ja Terraformin käyttäminen Spotify tietojen kanssa

## Mikä tää on?

Harjottelua IaC parissa käyttäen Terraformia ja AWS. Kokeilen tutkia oman Spotify-soittolistani artistien albumien pituutta.

#### Käytettävät palvelut

| Palvelu  | Käyttö  |
|:---|:---|
| Terraform  | Toteuttaa pilvi-infran (**oletusregioona *us-east-1***) |
| Cloudwatch  | Kuukausittainen triggeri, joka hakee uudet biisit soittolistalta  |
| Lambda  | Python koodi, joka tekee analyysin  |
| S3  | Data tallennetaan datajärveen  |
| Spotify API | Soittolista haetaan täältä. Pythonin kanssa käytetään Spotipy-kirjastoa  |

Gluen crawleria ja Athenaa voi käyttää analysoimaan kerättyä dataa lopuksi.

## Asennus

#### Tarvittavat ohjelmat ja kirjastot, muut

* [Python](https://www.python.org/downloads/)
* [Terraform](https://developer.hashicorp.com/terraform/install)
* [Spotipy](https://spotipy.readthedocs.io/en/2.22.1/)
* AWS tili (ilmanen käy, joutuu syöttämään korttitiedot)

## Tämänhetkiset ongelmat

Okei, yritin tehdä tätä koulun kurssin tarjoamalla AWS-tilillä. Siinä ei kuitenkaan onnistu luomaan IAM rooleja tai policyja omalle käyttäjälle, mikä antaisi mahdollisuuden luoda esim. S3 ämpäreitä Lambdan avulla. Tän pitäisi onnistua siis normaalilla AWS-tilillä.

Ongelma lienee siis tämän IAM roolin **lambda_execution_role** kanssa, jota yritän luoda.

```╷
│ Error: Retrieving AWS account details: validating provider credentials: retrieving caller identity from STS: operation error STS: GetCallerIdentity, https response error StatusCode: 403, RequestID: 5bb325ad-de11-4989-a691-d3bb7dc93566, api error InvalidClientTokenId: The security token included in the request is invalid.
│ 
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on providers.tf line 1, in provider "aws":
│    1: provider "aws" {
│
╵
```