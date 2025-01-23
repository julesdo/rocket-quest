UPDATE rockets
SET flag = CASE

  WHEN nation = 'Afghanistan' THEN 'https://flagcdn.com/256x192/af.png'
  WHEN nation = 'Albania' THEN 'https://flagcdn.com/256x192/al.png'
  WHEN nation = 'Algeria' THEN 'https://flagcdn.com/256x192/dz.png'
  WHEN nation = 'Andorra' THEN 'https://flagcdn.com/256x192/ad.png'
  WHEN nation = 'Angola' THEN 'https://flagcdn.com/256x192/ao.png'
  WHEN nation = 'Antigua and Barbuda' THEN 'https://flagcdn.com/256x192/ag.png'
  WHEN nation = 'Argentina' THEN 'https://flagcdn.com/256x192/ar.png'
  WHEN nation = 'Armenia' THEN 'https://flagcdn.com/256x192/am.png'
  WHEN nation = 'Australia' THEN 'https://flagcdn.com/256x192/au.png'
  WHEN nation = 'Austria' THEN 'https://flagcdn.com/256x192/at.png'
  WHEN nation = 'Azerbaijan' THEN 'https://flagcdn.com/256x192/az.png'
  WHEN nation = 'Bahamas' THEN 'https://flagcdn.com/256x192/bs.png'
  WHEN nation = 'Bahrain' THEN 'https://flagcdn.com/256x192/bh.png'
  WHEN nation = 'Bangladesh' THEN 'https://flagcdn.com/256x192/bd.png'
  WHEN nation = 'Barbados' THEN 'https://flagcdn.com/256x192/bb.png'
  WHEN nation = 'Belarus' THEN 'https://flagcdn.com/256x192/by.png'
  WHEN nation = 'Belgium' THEN 'https://flagcdn.com/256x192/be.png'
  WHEN nation = 'Belize' THEN 'https://flagcdn.com/256x192/bz.png'
  WHEN nation = 'Benin' THEN 'https://flagcdn.com/256x192/bj.png'
  WHEN nation = 'Bhutan' THEN 'https://flagcdn.com/256x192/bt.png'
  WHEN nation = 'Bolivia' THEN 'https://flagcdn.com/256x192/bo.png'
  WHEN nation = 'Bosnia and Herzegovina' THEN 'https://flagcdn.com/256x192/ba.png'
  WHEN nation = 'Botswana' THEN 'https://flagcdn.com/256x192/bw.png'
  WHEN nation = 'Brazil' THEN 'https://flagcdn.com/256x192/br.png'
  WHEN nation = 'Brunei' THEN 'https://flagcdn.com/256x192/bn.png'
  WHEN nation = 'Bulgaria' THEN 'https://flagcdn.com/256x192/bg.png'
  WHEN nation = 'Burkina Faso' THEN 'https://flagcdn.com/256x192/bf.png'
  WHEN nation = 'Burundi' THEN 'https://flagcdn.com/256x192/bi.png'
  WHEN nation = 'Cabo Verde' THEN 'https://flagcdn.com/256x192/cv.png'
  WHEN nation = 'Cambodia' THEN 'https://flagcdn.com/256x192/kh.png'
  WHEN nation = 'Cameroon' THEN 'https://flagcdn.com/256x192/cm.png'
  WHEN nation = 'Canada' THEN 'https://flagcdn.com/256x192/ca.png'
  WHEN nation = 'Central African Republic' THEN 'https://flagcdn.com/256x192/cf.png'
  WHEN nation = 'Chad' THEN 'https://flagcdn.com/256x192/td.png'
  WHEN nation = 'Chile' THEN 'https://flagcdn.com/256x192/cl.png'
  WHEN nation = 'China' THEN 'https://flagcdn.com/256x192/cn.png'
  WHEN nation = 'Colombia' THEN 'https://flagcdn.com/256x192/co.png'
  WHEN nation = 'Comoros' THEN 'https://flagcdn.com/256x192/km.png'
  WHEN nation = 'Congo' THEN 'https://flagcdn.com/256x192/cg.png'
  WHEN nation = 'Costa Rica' THEN 'https://flagcdn.com/256x192/cr.png'
  WHEN nation = 'Croatia' THEN 'https://flagcdn.com/256x192/hr.png'
  WHEN nation = 'Cuba' THEN 'https://flagcdn.com/256x192/cu.png'
  WHEN nation = 'Cyprus' THEN 'https://flagcdn.com/256x192/cy.png'
  WHEN nation = 'Czech Republic' THEN 'https://flagcdn.com/256x192/cz.png'
  WHEN nation = 'Denmark' THEN 'https://flagcdn.com/256x192/dk.png'
  WHEN nation = 'Djibouti' THEN 'https://flagcdn.com/256x192/dj.png'
  WHEN nation = 'Dominica' THEN 'https://flagcdn.com/256x192/dm.png'
  WHEN nation = 'Dominican Republic' THEN 'https://flagcdn.com/256x192/do.png'
  WHEN nation = 'Ecuador' THEN 'https://flagcdn.com/256x192/ec.png'
  WHEN nation = 'Egypt' THEN 'https://flagcdn.com/256x192/eg.png'
  WHEN nation = 'El Salvador' THEN 'https://flagcdn.com/256x192/sv.png'
  WHEN nation = 'Equatorial Guinea' THEN 'https://flagcdn.com/256x192/gq.png'
  WHEN nation = 'Eritrea' THEN 'https://flagcdn.com/256x192/er.png'
  WHEN nation = 'Estonia' THEN 'https://flagcdn.com/256x192/ee.png'
  WHEN nation = 'Eswatini' THEN 'https://flagcdn.com/256x192/sz.png'
  WHEN nation = 'Ethiopia' THEN 'https://flagcdn.com/256x192/et.png'
  WHEN nation = 'Fiji' THEN 'https://flagcdn.com/256x192/fj.png'
  WHEN nation = 'Finland' THEN 'https://flagcdn.com/256x192/fi.png'
  WHEN nation = 'France' THEN 'https://flagcdn.com/256x192/fr.png'
  WHEN nation = 'Gabon' THEN 'https://flagcdn.com/256x192/ga.png'
  WHEN nation = 'Gambia' THEN 'https://flagcdn.com/256x192/gm.png'
  WHEN nation = 'Georgia' THEN 'https://flagcdn.com/256x192/ge.png'
  WHEN nation = 'Germany' THEN 'https://flagcdn.com/256x192/de.png'
  WHEN nation = 'Ghana' THEN 'https://flagcdn.com/256x192/gh.png'
  WHEN nation = 'Greece' THEN 'https://flagcdn.com/256x192/gr.png'
  WHEN nation = 'Grenada' THEN 'https://flagcdn.com/256x192/gd.png'
  WHEN nation = 'Guatemala' THEN 'https://flagcdn.com/256x192/gt.png'
  WHEN nation = 'Guinea' THEN 'https://flagcdn.com/256x192/gn.png'
  WHEN nation = 'Guinea-Bissau' THEN 'https://flagcdn.com/256x192/gw.png'
  WHEN nation = 'Guyana' THEN 'https://flagcdn.com/256x192/gy.png'
  WHEN nation = 'Haiti' THEN 'https://flagcdn.com/256x192/ht.png'
  WHEN nation = 'Honduras' THEN 'https://flagcdn.com/256x192/hn.png'
  WHEN nation = 'Hungary' THEN 'https://flagcdn.com/256x192/hu.png'
  WHEN nation = 'Iceland' THEN 'https://flagcdn.com/256x192/is.png'
  WHEN nation = 'India' THEN 'https://flagcdn.com/256x192/in.png'
  WHEN nation = 'Indonesia' THEN 'https://flagcdn.com/256x192/id.png'
  WHEN nation = 'Iran' THEN 'https://flagcdn.com/256x192/ir.png'
  WHEN nation = 'Iraq' THEN 'https://flagcdn.com/256x192/iq.png'
  WHEN nation = 'Ireland' THEN 'https://flagcdn.com/256x192/ie.png'
  WHEN nation = 'Israel' THEN 'https://flagcdn.com/256x192/il.png'
  WHEN nation = 'Italy' THEN 'https://flagcdn.com/256x192/it.png'
  WHEN nation = 'Jamaica' THEN 'https://flagcdn.com/256x192/jm.png'
  WHEN nation = 'Japan' THEN 'https://flagcdn.com/256x192/jp.png'
  WHEN nation = 'Jordan' THEN 'https://flagcdn.com/256x192/jo.png'
  WHEN nation = 'Kazakhstan' THEN 'https://flagcdn.com/256x192/kz.png'
  WHEN nation = 'Kenya' THEN 'https://flagcdn.com/256x192/ke.png'
  WHEN nation = 'Kiribati' THEN 'https://flagcdn.com/256x192/ki.png'
  WHEN nation = 'Kuwait' THEN 'https://flagcdn.com/256x192/kw.png'
  WHEN nation = 'Kyrgyzstan' THEN 'https://flagcdn.com/256x192/kg.png'
  WHEN nation = 'Laos' THEN 'https://flagcdn.com/256x192/la.png'
  WHEN nation = 'Latvia' THEN 'https://flagcdn.com/256x192/lv.png'
  WHEN nation = 'Lebanon' THEN 'https://flagcdn.com/256x192/lb.png'
  WHEN nation = 'Lesotho' THEN 'https://flagcdn.com/256x192/ls.png'
  WHEN nation = 'Liberia' THEN 'https://flagcdn.com/256x192/lr.png'
  WHEN nation = 'Libya' THEN 'https://flagcdn.com/256x192/ly.png'
  WHEN nation = 'Liechtenstein' THEN 'https://flagcdn.com/256x192/li.png'
  WHEN nation = 'Lithuania' THEN 'https://flagcdn.com/256x192/lt.png'
  WHEN nation = 'Luxembourg' THEN 'https://flagcdn.com/256x192/lu.png'
  WHEN nation = 'Madagascar' THEN 'https://flagcdn.com/256x192/mg.png'
  WHEN nation = 'Malawi' THEN 'https://flagcdn.com/256x192/mw.png'
  WHEN nation = 'Malaysia' THEN 'https://flagcdn.com/256x192/my.png'
  WHEN nation = 'Maldives' THEN 'https://flagcdn.com/256x192/mv.png'
  WHEN nation = 'Mali' THEN 'https://flagcdn.com/256x192/ml.png'
  WHEN nation = 'Malta' THEN 'https://flagcdn.com/256x192/mt.png'
  WHEN nation = 'Marshall Islands' THEN 'https://flagcdn.com/256x192/mh.png'
  WHEN nation = 'Mauritania' THEN 'https://flagcdn.com/256x192/mr.png'
  WHEN nation = 'Mauritius' THEN 'https://flagcdn.com/256x192/mu.png'
  WHEN nation = 'Mexico' THEN 'https://flagcdn.com/256x192/mx.png'
  WHEN nation = 'Micronesia' THEN 'https://flagcdn.com/256x192/fm.png'
  WHEN nation = 'Moldova' THEN 'https://flagcdn.com/256x192/md.png'
  WHEN nation = 'Monaco' THEN 'https://flagcdn.com/256x192/mc.png'
  WHEN nation = 'Mongolia' THEN 'https://flagcdn.com/256x192/mn.png'
  WHEN nation = 'Montenegro' THEN 'https://flagcdn.com/256x192/me.png'
  WHEN nation = 'Morocco' THEN 'https://flagcdn.com/256x192/ma.png'
  WHEN nation = 'Mozambique' THEN 'https://flagcdn.com/256x192/mz.png'
  WHEN nation = 'Myanmar' THEN 'https://flagcdn.com/256x192/mm.png'
  WHEN nation = 'Namibia' THEN 'https://flagcdn.com/256x192/na.png'
  WHEN nation = 'Nauru' THEN 'https://flagcdn.com/256x192/nr.png'
  WHEN nation = 'Nepal' THEN 'https://flagcdn.com/256x192/np.png'
  WHEN nation = 'Netherlands' THEN 'https://flagcdn.com/256x192/nl.png'
  WHEN nation = 'New Zealand' THEN 'https://flagcdn.com/256x192/nz.png'
  WHEN nation = 'Nicaragua' THEN 'https://flagcdn.com/256x192/ni.png'
  WHEN nation = 'Niger' THEN 'https://flagcdn.com/256x192/ne.png'
  WHEN nation = 'Nigeria' THEN 'https://flagcdn.com/256x192/ng.png'
  WHEN nation = 'North Korea' THEN 'https://flagcdn.com/256x192/kp.png'
  WHEN nation = 'North Macedonia' THEN 'https://flagcdn.com/256x192/mk.png'
  WHEN nation = 'Norway' THEN 'https://flagcdn.com/256x192/no.png'
  WHEN nation = 'Oman' THEN 'https://flagcdn.com/256x192/om.png'
  WHEN nation = 'Pakistan' THEN 'https://flagcdn.com/256x192/pk.png'
  WHEN nation = 'Palau' THEN 'https://flagcdn.com/256x192/pw.png'
  WHEN nation = 'Palestine' THEN 'https://flagcdn.com/256x192/ps.png'
  WHEN nation = 'Panama' THEN 'https://flagcdn.com/256x192/pa.png'
  WHEN nation = 'Papua New Guinea' THEN 'https://flagcdn.com/256x192/pg.png'
  WHEN nation = 'Paraguay' THEN 'https://flagcdn.com/256x192/py.png'
  WHEN nation = 'Peru' THEN 'https://flagcdn.com/256x192/pe.png'
  WHEN nation = 'Philippines' THEN 'https://flagcdn.com/256x192/ph.png'
  WHEN nation = 'Poland' THEN 'https://flagcdn.com/256x192/pl.png'
  WHEN nation = 'Portugal' THEN 'https://flagcdn.com/256x192/pt.png'
  WHEN nation = 'Qatar' THEN 'https://flagcdn.com/256x192/qa.png'
  WHEN nation = 'Romania' THEN 'https://flagcdn.com/256x192/ro.png'
  WHEN nation = 'Russia' THEN 'https://flagcdn.com/256x192/ru.png'
  WHEN nation = 'Rwanda' THEN 'https://flagcdn.com/256x192/rw.png'
  WHEN nation = 'Saint Kitts and Nevis' THEN 'https://flagcdn.com/256x192/kn.png'
  WHEN nation = 'Saint Lucia' THEN 'https://flagcdn.com/256x192/lc.png'
  WHEN nation = 'Saint Vincent and the Grenadines' THEN 'https://flagcdn.com/256x192/vc.png'
  WHEN nation = 'Samoa' THEN 'https://flagcdn.com/256x192/ws.png'
  WHEN nation = 'San Marino' THEN 'https://flagcdn.com/256x192/sm.png'
  WHEN nation = 'Sao Tome and Principe' THEN 'https://flagcdn.com/256x192/st.png'
  WHEN nation = 'Saudi Arabia' THEN 'https://flagcdn.com/256x192/sa.png'
  WHEN nation = 'Senegal' THEN 'https://flagcdn.com/256x192/sn.png'
  WHEN nation = 'Serbia' THEN 'https://flagcdn.com/256x192/rs.png'
  WHEN nation = 'Seychelles' THEN 'https://flagcdn.com/256x192/sc.png'
  WHEN nation = 'Sierra Leone' THEN 'https://flagcdn.com/256x192/sl.png'
  WHEN nation = 'Singapore' THEN 'https://flagcdn.com/256x192/sg.png'
  WHEN nation = 'Slovakia' THEN 'https://flagcdn.com/256x192/sk.png'
  WHEN nation = 'Slovenia' THEN 'https://flagcdn.com/256x192/si.png'
  WHEN nation = 'Solomon Islands' THEN 'https://flagcdn.com/256x192/sb.png'
  WHEN nation = 'Somalia' THEN 'https://flagcdn.com/256x192/so.png'
  WHEN nation = 'South Africa' THEN 'https://flagcdn.com/256x192/za.png'
  WHEN nation = 'South Korea' THEN 'https://flagcdn.com/256x192/kr.png'
  WHEN nation = 'South Sudan' THEN 'https://flagcdn.com/256x192/ss.png'
  WHEN nation = 'Spain' THEN 'https://flagcdn.com/256x192/es.png'
  WHEN nation = 'Sri Lanka' THEN 'https://flagcdn.com/256x192/lk.png'
  WHEN nation = 'Sudan' THEN 'https://flagcdn.com/256x192/sd.png'
  WHEN nation = 'Suriname' THEN 'https://flagcdn.com/256x192/sr.png'
  WHEN nation = 'Sweden' THEN 'https://flagcdn.com/256x192/se.png'
  WHEN nation = 'Switzerland' THEN 'https://flagcdn.com/256x192/ch.png'
  WHEN nation = 'Syria' THEN 'https://flagcdn.com/256x192/sy.png'
  WHEN nation = 'Tajikistan' THEN 'https://flagcdn.com/256x192/tj.png'
  WHEN nation = 'Tanzania' THEN 'https://flagcdn.com/256x192/tz.png'
  WHEN nation = 'Thailand' THEN 'https://flagcdn.com/256x192/th.png'
  WHEN nation = 'Timor-Leste' THEN 'https://flagcdn.com/256x192/tl.png'
  WHEN nation = 'Togo' THEN 'https://flagcdn.com/256x192/tg.png'
  WHEN nation = 'Tonga' THEN 'https://flagcdn.com/256x192/to.png'
  WHEN nation = 'Trinidad and Tobago' THEN 'https://flagcdn.com/256x192/tt.png'
  WHEN nation = 'Tunisia' THEN 'https://flagcdn.com/256x192/tn.png'
  WHEN nation = 'Turkey' THEN 'https://flagcdn.com/256x192/tr.png'
  WHEN nation = 'Turkmenistan' THEN 'https://flagcdn.com/256x192/tm.png'
  WHEN nation = 'Tuvalu' THEN 'https://flagcdn.com/256x192/tv.png'
  WHEN nation = 'Uganda' THEN 'https://flagcdn.com/256x192/ug.png'
  WHEN nation = 'Ukraine' THEN 'https://flagcdn.com/256x192/ua.png'
  WHEN nation = 'United Arab Emirates' THEN 'https://flagcdn.com/256x192/ae.png'
  WHEN nation = 'United Kingdom' THEN 'https://flagcdn.com/256x192/gb.png'
  WHEN nation = 'United States' THEN 'https://flagcdn.com/256x192/us.png'
  WHEN nation = 'Uruguay' THEN 'https://flagcdn.com/256x192/uy.png'
  WHEN nation = 'Uzbekistan' THEN 'https://flagcdn.com/256x192/uz.png'
  WHEN nation = 'Vanuatu' THEN 'https://flagcdn.com/256x192/vu.png'
  WHEN nation = 'Vatican City' THEN 'https://flagcdn.com/256x192/va.png'
  WHEN nation = 'Venezuela' THEN 'https://flagcdn.com/256x192/ve.png'
  WHEN nation = 'Vietnam' THEN 'https://flagcdn.com/256x192/vn.png'
  WHEN nation = 'Yemen' THEN 'https://flagcdn.com/256x192/ye.png'
  WHEN nation = 'Zambia' THEN 'https://flagcdn.com/256x192/zm.png'
  WHEN nation = 'Zimbabwe' THEN 'https://flagcdn.com/256x192/zw.png'

  -- Si vous voulez un fallback :
  ELSE 'https://flagcdn.com/256x192/un.png'

END
WHERE nation IN (
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Angola',
  'Antigua and Barbuda',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Belarus',
  'Belgium',
  'Belize',
  'Benin',
  'Bhutan',
  'Bolivia',
  'Bosnia and Herzegovina',
  'Botswana',
  'Brazil',
  'Brunei',
  'Bulgaria',
  'Burkina Faso',
  'Burundi',
  'Cabo Verde',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Central African Republic',
  'Chad',
  'Chile',
  'China',
  'Colombia',
  'Comoros',
  'Congo',
  'Costa Rica',
  'Croatia',
  'Cuba',
  'Cyprus',
  'Czech Republic',
  'Denmark',
  'Djibouti',
  'Dominica',
  'Dominican Republic',
  'Ecuador',
  'Egypt',
  'El Salvador',
  'Equatorial Guinea',
  'Eritrea',
  'Estonia',
  'Eswatini',
  'Ethiopia',
  'Fiji',
  'Finland',
  'France',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Greece',
  'Grenada',
  'Guatemala',
  'Guinea',
  'Guinea-Bissau',
  'Guyana',
  'Haiti',
  'Honduras',
  'Hungary',
  'Iceland',
  'India',
  'Indonesia',
  'Iran',
  'Iraq',
  'Ireland',
  'Israel',
  'Italy',
  'Jamaica',
  'Japan',
  'Jordan',
  'Kazakhstan',
  'Kenya',
  'Kiribati',
  'Kuwait',
  'Kyrgyzstan',
  'Laos',
  'Latvia',
  'Lebanon',
  'Lesotho',
  'Liberia',
  'Libya',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'Madagascar',
  'Malawi',
  'Malaysia',
  'Maldives',
  'Mali',
  'Malta',
  'Marshall Islands',
  'Mauritania',
  'Mauritius',
  'Mexico',
  'Micronesia',
  'Moldova',
  'Monaco',
  'Mongolia',
  'Montenegro',
  'Morocco',
  'Mozambique',
  'Myanmar',
  'Namibia',
  'Nauru',
  'Nepal',
  'Netherlands',
  'New Zealand',
  'Nicaragua',
  'Niger',
  'Nigeria',
  'North Korea',
  'North Macedonia',
  'Norway',
  'Oman',
  'Pakistan',
  'Palau',
  'Palestine',
  'Panama',
  'Papua New Guinea',
  'Paraguay',
  'Peru',
  'Philippines',
  'Poland',
  'Portugal',
  'Qatar',
  'Romania',
  'Russia',
  'Rwanda',
  'Saint Kitts and Nevis',
  'Saint Lucia',
  'Saint Vincent and the Grenadines',
  'Samoa',
  'San Marino',
  'Sao Tome and Principe',
  'Saudi Arabia',
  'Senegal',
  'Serbia',
  'Seychelles',
  'Sierra Leone',
  'Singapore',
  'Slovakia',
  'Slovenia',
  'Solomon Islands',
  'Somalia',
  'South Africa',
  'South Korea',
  'South Sudan',
  'Spain',
  'Sri Lanka',
  'Sudan',
  'Suriname',
  'Sweden',
  'Switzerland',
  'Syria',
  'Tajikistan',
  'Tanzania',
  'Thailand',
  'Timor-Leste',
  'Togo',
  'Tonga',
  'Trinidad and Tobago',
  'Tunisia',
  'Turkey',
  'Turkmenistan',
  'Tuvalu',
  'Uganda',
  'Ukraine',
  'United Arab Emirates',
  'United Kingdom',
  'United States',
  'Uruguay',
  'Uzbekistan',
  'Vanuatu',
  'Vatican City',
  'Venezuela',
  'Vietnam',
  'Yemen',
  'Zambia',
  'Zimbabwe'
);
