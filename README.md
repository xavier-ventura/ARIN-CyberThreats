 Cybersecurity and Threat Analysis in the ARIN Zone

## Project Description
This repository contains the development and results of an analysis focused on the **ARIN** zone (North America and certain regions of the Caribbean). The main objective of the study is to analyze and understand the distribution, evolution, and impact of various cyber threats (malware, botnets, malicious IPs) through different IP address databases and incident logs.

## Structure and Content of the Analysis
1. **IP Status and Evolution (Reputation 2013 vs 2019)**: Comparison of IPs classified as *Malicious Host*, evaluating the exponential growth of cybercrime and geographic dispersion over the years.
2. **Impact of ZeroAccess and Zeus Viruses**: Geographic analysis (using choropleth maps) of the reach of the Zeus and ZeroAccess botnets, paying special attention to their epicenter in the US and propagation towards Canada.
3. **ASN Blocks and Providers Analysis**: Identification of the Autonomous Systems (ASN) most used for malicious purposes (e.g., DigitalOcean, Comcast, Amazon) and how large companies improved their defenses between 2013 and 2019.
4. **Firewall Study**: Verification of firewall effectiveness by analyzing "pre" and "post" block traffic.
5. **Traffic Analysis with Wireshark**: Detection of brute-force attack patterns, studying the origins and destinations of the involved IPs.
6. **Modeling and Regression**: Implementation of a linear regression model to understand which factors (population, land area, number of ISPs, technological investment) most significantly influence the number of computers infected by ZeroAccess.
7. **Incident Database (VCDB)**: Study of the different types of attacks (physical, malware, hacking, human errors) and victim profiles in the US and Canada.

## Technologies and Tools Used
- **MATLAB**: For graphical representation, geographic maps (world map, choropleths), node graphs (botnet networks by country), and statistical analysis.
- **Python**: Use of libraries such as `pandas`, `requests`, and `concurrent.futures` to obtain data from the *ipinfo.io* API and integration of metadata (ASN, geolocation).
- **R**: For data preparation and building the multiple regression model.
- **Wireshark / Traffic capture**: For packet analysis and brute-force detection.

## Main Conclusions
- **The United States** remains the absolute epicenter of both legitimate infrastructure and security incidents and malicious addresses in the ARIN zone.
- Although the US has higher absolute numbers of infections, **Canada** shows higher relative per capita infection rates against certain threats like ZeroAccess.
- Malicious actors are migrating and decentralizing their network infrastructure: in 2013 they preferred giants like Amazon or Microsoft, while in 2019 there is a shift towards service providers (like DigitalOcean) that may be more accessible.
- Demographic and infrastructure variables (Population, geographic extension, number of ISPs) are statistically significant determinants in the volume of regional infections.
