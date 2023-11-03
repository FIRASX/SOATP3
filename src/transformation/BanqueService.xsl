<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" />
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Liste des Comptes</title>
			</head>
			<body>
				<xsl:variable name="totalSolde">
					<xsl:value-of select="sum(BanqueService/getCompte/solde)" />
				</xsl:variable>
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date de Création</th>
					</tr>
					<xsl:for-each select="BanqueService/getCompte">
						<tr>
							<td>
								<xsl:value-of select="code" />
							</td>
							<td>
								<xsl:value-of select="solde" />
							</td>
							<td>
								<xsl:value-of select="dateCreation" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>Total Solde: <xsl:value-of select="$totalSolde" /></p>
				<xsl:variable name="totalSoldeFiltre">
					<xsl:value-of select="sum(BanqueService/getComptes[substring(dateCreation, 1, 4) > 2000]/solde)" />
				</xsl:variable>
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date de Création</th>
					</tr>
					<xsl:for-each select="BanqueService/getComptes[substring(dateCreation, 1, 4) > 2000]">
						<tr>
							<td>
								<xsl:value-of select="code" />
							</td>
							<td>
								<xsl:value-of select="solde" />
							</td>
							<td>
								<xsl:value-of select="dateCreation" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>Total Solde Filtre: <xsl:value-of select="$totalSoldeFiltre" /></p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
