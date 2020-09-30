# grab top urls from alexa.com
 curl -o alexa.txt https://www.alexa.com/topsites
# grep for website
# cat alexa.txt | grep something like (?<=\/siteinfo\/).*?(?=")
# need to Write a bash script that takes a file of hostnames as input and resolves them to IP addresses using the 'host' or 'nslookup' commands
