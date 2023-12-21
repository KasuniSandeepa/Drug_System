package drugfilter.model;

public class ISD {

    String BRAND;
    String FORMULATION;
    String STRENGTH;
    String IMPORTER;
    String MANUFACTURER;
    String GENERIC;
    String ID;
    String STATUS;
    String IMC_CODE;
    String GENERIC2;
    String GENERIC3;
    String BRAND_CODE;
    String UNITS;
    String SHEDULE;
    String NMRANO;
    String REGISTERED_DATE;
    String REGISTERED_USER;
    String EXPIRE_DATE;
    String MRP;
    String NOTES;
    String COUNTRY;

    public ISD(String BRAND, String FORMULATION, String STRENGTH, String IMPORTER, String MANUFACTURER) {
        this.BRAND = BRAND;
        this.FORMULATION = FORMULATION;
        this.STRENGTH = STRENGTH;
        this.IMPORTER = IMPORTER;
        this.MANUFACTURER = MANUFACTURER;
    }


    public ISD(String BRAND, String FORMULATION, String STRENGTH, String IMPORTER, String MANUFACTURER, String GENERIC) {
        this.BRAND = BRAND;
        this.FORMULATION = FORMULATION;
        this.STRENGTH = STRENGTH;
        this.IMPORTER = IMPORTER;
        this.MANUFACTURER = MANUFACTURER;
        this.GENERIC = GENERIC;
    }

    public ISD() {
		// TODO Auto-generated constructor stub
	}


	public String getBRAND() {
        return BRAND;
    }

    public void setBRAND(String BRAND) {
        this.BRAND = BRAND;
    }

    public String getFORMULATION() {
        return FORMULATION;
    }

    public void setFORMULATION(String FORMULATION) {
        this.FORMULATION = FORMULATION;
    }

    public String getSTRENGTH() {
        return STRENGTH;
    }

    public void setSTRENGTH(String STRENGTH) {
        this.STRENGTH = STRENGTH;
    }

    public String getIMPORTER() {
        return IMPORTER;
    }

    public void setIMPORTER(String IMPORTER) {
        this.IMPORTER = IMPORTER;
    }

    public String getMANUFACTURER() {
        return MANUFACTURER;
    }

    public void setMANUFACTURER(String MANUFACTURER) {
        this.MANUFACTURER = MANUFACTURER;
    }

    public String getGENERIC() {
        return GENERIC;
    }

    public void setGENERIC(String GENERIC) {
        this.GENERIC = GENERIC;
    }


	public String getID() {
		return ID;
	}


	public void setID(String iD) {
		ID = iD;
	}


	public String getSTATUS() {
		return STATUS;
	}


	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}


	public String getIMC_CODE() {
		return IMC_CODE;
	}


	public void setIMC_CODE(String iMC_CODE) {
		IMC_CODE = iMC_CODE;
	}


	public String getGENERIC2() {
		return GENERIC2;
	}


	public void setGENERIC2(String gENERIC2) {
		GENERIC2 = gENERIC2;
	}


	public String getGENERIC3() {
		return GENERIC3;
	}


	public void setGENERIC3(String gENERIC3) {
		GENERIC3 = gENERIC3;
	}


	public String getBRAND_CODE() {
		return BRAND_CODE;
	}


	public void setBRAND_CODE(String bRAND_CODE) {
		BRAND_CODE = bRAND_CODE;
	}


	public String getUNITS() {
		return UNITS;
	}


	public void setUNITS(String uNITS) {
		UNITS = uNITS;
	}


	public String getSHEDULE() {
		return SHEDULE;
	}


	public void setSHEDULE(String sHEDULE) {
		SHEDULE = sHEDULE;
	}


	public String getNMRANO() {
		return NMRANO;
	}


	public void setNMRANO(String nMRANO) {
		NMRANO = nMRANO;
	}


	public String getREGISTERED_DATE() {
		return REGISTERED_DATE;
	}


	public void setREGISTERED_DATE(String rEGISTERED_DATE) {
		REGISTERED_DATE = rEGISTERED_DATE;
	}


	public String getREGISTERED_USER() {
		return REGISTERED_USER;
	}


	public void setREGISTERED_USER(String rEGISTERED_USER) {
		REGISTERED_USER = rEGISTERED_USER;
	}


	public String getEXPIRE_DATE() {
		return EXPIRE_DATE;
	}


	public void setEXPIRE_DATE(String eXPIRE_DATE) {
		EXPIRE_DATE = eXPIRE_DATE;
	}


	public String getMRP() {
		return MRP;
	}


	public void setMRP(String mRP) {
		MRP = mRP;
	}


	public String getNOTES() {
		return NOTES;
	}


	public void setNOTES(String nOTES) {
		NOTES = nOTES;
	}


	public String getCOUNTRY() {
		return COUNTRY;
	}


	public void setCOUNTRY(String cOUNTRY) {
		COUNTRY = cOUNTRY;
	}

	
	


    
}
