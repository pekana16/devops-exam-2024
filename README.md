# Oppgave 1
  - Leveranse 1: https://41zkfw52qi.execute-api.eu-west-1.amazonaws.com/Prod/generate


  - Leveranse 2: https://github.com/pekana16/devops-exam-2024/actions/runs/12016768152

# Oppagave 2

# Oppgave 3
 - Beskrivelse:
    Jeg valgte å tagge Docker-bildene mine med "latest" tag.
    Ved å bruke "latest"-tag har jeg forenklet hele taggeprosessen. 
    Den nyeste versjonen av containeren er også alltid tilgjengelig for evaluering pga "latest".
    Strategien fokuserer på enkelhet og effektivitet.
 - Container-image: pekana/java_sqs_client
 - SQS URL: https://sqs.eu-west-1.amazonws.com/244530008913/Queue_39

# Oppgave 4

# Oppgave 5
CI/CD og Automation CI/CD-prosesser har unike utfordringer for begge arkitekturene.
- Serverless (Faas) -> Det er mage små funksjoner her som må versjoneres og håndteres separat. Dette kan derfor komplisere testing og distribusjon. Automatisering bruker verktøy som AWS SAM og serverless rammeverk, men krever administrasjon av flere små enheter. Serverless forenkler hyppige distribusjoner.
- Mikrotjenester (containere) -> Mikrotjenester pakket som containere har mer kontroll over avhengigheter. Orkestreringsverktøy som "Kubernetes" lar deg administrere distribusjoner og gjøre skalering forutsigbar. Automatiseringsverktøy muliggjør utrullung av blågrønn og kanarifugl.

Konklusjon: Det er serverless som tilbyr rask distribusjon på funksjonsnivå, mens containere forenkler mer granulær kontroll og automatisering av komplekse avhengigheter.

Overvåkning:
- Serverless (FaaS) -> Overvåkning er rett og slett vanskelig i FaaS på grunn av funksjonalitetens korte levetid. Verktøy som AWS CloudWatch og X-Ray brukes, men det kan være vanskelig å få oversikt over ytelsen til mange funksjoner.
- Mikrotjenester (containere) -> Containere kan bruke verktøy som Prometheus, Grafana og ELK Stack for sentraliserte loggingssystemer og overvåkning. Tjenestenettverk som Istio tilbyr bedre sproing og kontroll.

Konklusjon: Mikrotjenester gir bedre verktøy for overvåkning, men serverløs gjør overvåking vanskeligere på grunn av funksjonell ustabilitet.


Skalerbarhet og kostandskontroll:
- Serverless (FaaS) -> Automatisk skalering for å vokse etter behov. Det er kostnadseffektivt for en rekke arbeidsbelastninger, men kan være dyrt for ofte utførte eller langvarige funksjoner. "Cold-start" kan føre til forsinkelser.
- Mikrotjenester (containere) -> Kubernates kan automatisere skalering, men med større forutsigbarhet enn serverless. Når etterspørselsen er lav, kan ressursene være underutnyttet, men de medfører forutsigbare kostander.

Konklusjon: Serverless er kostandseffektivt for dynamiske arbeidsbelastninger, og mikrotjenester gir deg mer kontroll over ressurser og kostander.


Eierskap og ansvar:
- Serverless (Faas) -> Mye av infrastrukturadministrasjonen er abstrahert bort, slik at teamene kan fokusere på forretningslogikk. Dette reduserer kontroll.
- Miktrotjenester (containere) -> Her har DevOps-teamene mer kontroll over infrastruktur og ressurser, øker eierskapet, men øker også det operasjonelle ansvaret.

Konklusjon: Serverless reduserer infrastrukturansvaret, mens mikrotjenester gir mer kontroll og eierskap, men er mer "kompleks". 