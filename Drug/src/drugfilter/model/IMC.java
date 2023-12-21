package drugfilter.model;

public class IMC {
	
	    String SENO;
	    String IMPORTER;
	    String MANUFACTURER;
	    String COUNTRY;
	    String IMCNEW;
	    String IMCCODE;
	    String ADDRESS;
	    String PHONE;
	    String FAX;
	    String EMAIL;
	    String REGISTRED_DATE;
	    String REGISTRED_USER;
	    String STATUS;
	    
		public IMC(String sENO, String iMPORTER, String mANUFACTURER, String cOUNTRY, String iMCNEW, String iMCCODE,
				String aDDRESS, String pHONE, String fAX, String eMAIL, String rEGISTRED_DATE, String rEGISTRED_USER,
				String sTATUS) {
			super();
			SENO = sENO;
			IMPORTER = iMPORTER;
			MANUFACTURER = mANUFACTURER;
			COUNTRY = cOUNTRY;
			IMCNEW = iMCNEW;
			IMCCODE = iMCCODE;
			ADDRESS = aDDRESS;
			PHONE = pHONE;
			FAX = fAX;
			EMAIL = eMAIL;
			REGISTRED_DATE = rEGISTRED_DATE;
			REGISTRED_USER = rEGISTRED_USER;
			STATUS = sTATUS;
		}

		public IMC() {
			// TODO Auto-generated constructor stub
		}

		public String getSENO() {
			return SENO;
		}

		public void setSENO(String sENO) {
			SENO = sENO;
		}

		public String getIMPORTER() {
			return IMPORTER;
		}

		public void setIMPORTER(String iMPORTER) {
			IMPORTER = iMPORTER;
		}

		public String getMANUFACTURER() {
			return MANUFACTURER;
		}

		public void setMANUFACTURER(String mANUFACTURER) {
			MANUFACTURER = mANUFACTURER;
		}

		public String getCOUNTRY() {
			return COUNTRY;
		}

		public void setCOUNTRY(String cOUNTRY) {
			COUNTRY = cOUNTRY;
		}

		public String getIMCNEW() {
			return IMCNEW;
		}

		public void setIMCNEW(String iMCNEW) {
			IMCNEW = iMCNEW;
		}

		public String getIMCCODE() {
			return IMCCODE;
		}

		public void setIMCCODE(String iMCCODE) {
			IMCCODE = iMCCODE;
		}

		public String getADDRESS() {
			return ADDRESS;
		}

		public void setADDRESS(String aDDRESS) {
			ADDRESS = aDDRESS;
		}

		public String getPHONE() {
			return PHONE;
		}

		public void setPHONE(String pHONE) {
			PHONE = pHONE;
		}

		public String getFAX() {
			return FAX;
		}

		public void setFAX(String fAX) {
			FAX = fAX;
		}

		public String getEMAIL() {
			return EMAIL;
		}

		public void setEMAIL(String eMAIL) {
			EMAIL = eMAIL;
		}

		public String getREGISTRED_DATE() {
			return REGISTRED_DATE;
		}

		public void setREGISTRED_DATE(String rEGISTRED_DATE) {
			REGISTRED_DATE = rEGISTRED_DATE;
		}

		public String getREGISTRED_USER() {
			return REGISTRED_USER;
		}

		public void setREGISTRED_USER(String rEGISTRED_USER) {
			REGISTRED_USER = rEGISTRED_USER;
		}

		public String getSTATUS() {
			return STATUS;
		}

		public void setSTATUS(String sTATUS) {
			STATUS = sTATUS;
		}
	    
	    






}
