import re
import pandas as pd
 
df = pd.DataFrame(['+48 601 602 603', 
                   '(48) 601-602-603',
                   '(+48)601602603',
                   '+48 601602603', 
                   '+48601602603', 
                   '48601602603',
                   ], 
             columns=['phone_orig'])
 
phone_pattern = ".*?(\\d{2}).*(\\d{3}).*(\\d{3}).*(\\d{3})"
 
df['country_prefix'] = df['phone_orig'].apply(lambda x: \
                        re.sub(phone_pattern, r'+\1', str(x)))
df['phone'] = df['phone_orig'].apply(lambda x: \
                        re.sub(phone_pattern, r'\2\3\4', str(x)))
 
df
#-----------------------------------------------------
df = pd.DataFrame(['miroslaw_mamczur@miroslawmamczur.pl', 
                   'miroslaw.mamczur@gmail.com',
                   'miroslawmamczur@wp.pl',
                   'mm@wroclaw.com.pl',
                   'hmm@pwr.edu.pl',
                   'miroslaw123456789@ubs.com',
                   ], 
             columns=['email_full'])
 
email_pattern = "([a-zA-Z0-9\\_\\-\\.]+)@([a-zA-Z]+).(.+)"
 
df['email_user'] = df['email_full'].apply(lambda x: \
                    re.sub(email_pattern, r'\1', str(x)))
df['email_domain_name'] = df['email_full'].apply(lambda x: \
                    re.sub(email_pattern, r'\2', str(x)))
df['email_tld_name'] = df['email_full'].apply(lambda x: \
                    re.sub(email_pattern, r'\3', str(x)))
 
df
#-----------------------------------------------------

df = pd.DataFrame(['same male literki', 
                   '123456',
                   '123456 i male literki',
                   'małe i duże LITERKI',
                   'małe i duże LITERKI + 123',
                   'M1r0sław!',
                   'to_Je5t Długie.H@sło;Jak+Lubię',
                   ], 
             columns=['password'])
 
password_pattern = "(?=^.{8,}$)((?=.*\w)(?=.*[A-Z])\
(?=.*[a-z])(?=.*[0-9])(?=.*[|!@#'$%&\/\(\)\?\^\'\\\+\-\*]))^.*"
 
df['password_frag'] = df['password'].apply(lambda x: 'strong' if re.search(password_pattern, str(x)) else 'weak')

#------------------------------------------------------
df = pd.DataFrame(['0.0.0.0', 
                   '54.239.128.212',
                   '256.256.256.256',
                   '1.a.255.255',
                   'A to ukryte IP w tekście (89.78.209.42).',
                   'Można ukryć np. dwa IP: (89.78.209.42) i 1.2.3.4'
                   ], 
             columns=['ip'])
 
ip_pattern = "(?:(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}\
(?:25[0-5]|2[0-4]\d|[01]?\d\d?)"
 
df['ip_found'] = df['ip'].apply(lambda x: re.findall(ip_pattern, str(x)))
 
df

 
df
