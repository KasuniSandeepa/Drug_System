package drugfilter.model;

public class ATC_Model {

	String SENO;
	String GENERIC;
	 String CHEMICAL_CODE;
    String PHARMO_CLASS;
    String THERAPEUTIC_CLASS;
    String CLINICAL_CLASS;
    String ANATOMICAL_CLASS;
    String ATC_CODE;
    String CUTIONARY_LABLE;
    String ADDVERSE_EFFECT;
    String REGISTERED_DATE;
    String REGISTERED_USER;
    String NOTES;
    String STATUS;
   

    public ATC_Model() {
		super();
	}
    

    public ATC_Model(String PHARMO_CLASS, String THERAPEUTIC_CLASS, String CLINICAL_CLASS, String ANATOMICAL_CLASS, String CUTIONARY_LABLE) {
        this.PHARMO_CLASS = PHARMO_CLASS;
        this.THERAPEUTIC_CLASS = THERAPEUTIC_CLASS;
        this.CLINICAL_CLASS = CLINICAL_CLASS;
        this.ANATOMICAL_CLASS = ANATOMICAL_CLASS;
        this.CUTIONARY_LABLE = CUTIONARY_LABLE;
    }

    public ATC_Model(String PHARMO_CLASS, String THERAPEUTIC_CLASS, String CLINICAL_CLASS, String ANATOMICAL_CLASS, String CUTIONARY_LABLE, String GENERIC) {
        this.PHARMO_CLASS = PHARMO_CLASS;
        this.THERAPEUTIC_CLASS = THERAPEUTIC_CLASS;
        this.CLINICAL_CLASS = CLINICAL_CLASS;
        this.ANATOMICAL_CLASS = ANATOMICAL_CLASS;
        this.CUTIONARY_LABLE = CUTIONARY_LABLE;
        this.GENERIC = GENERIC;
    }
    
    



	public ATC_Model(String sENO, String gENERIC, String cHEMICAL_CODE, String pHARMO_CLASS, String tHERAPEUTIC_CLASS,
			String cLINICAL_CLASS, String aNATOMICAL_CLASS, String aTC_CODE, String cUTIONARY_LABLE,
			String aDDVERSE_EFFECT, String rEGISTERED_DATE, String rEGISTERED_USER, String nOTES, String sTATUS) {
		super();
		SENO = sENO;
		GENERIC = gENERIC;
		CHEMICAL_CODE = cHEMICAL_CODE;
		PHARMO_CLASS = pHARMO_CLASS;
		THERAPEUTIC_CLASS = tHERAPEUTIC_CLASS;
		CLINICAL_CLASS = cLINICAL_CLASS;
		ANATOMICAL_CLASS = aNATOMICAL_CLASS;
		ATC_CODE = aTC_CODE;
		CUTIONARY_LABLE = cUTIONARY_LABLE;
		ADDVERSE_EFFECT = aDDVERSE_EFFECT;
		REGISTERED_DATE = rEGISTERED_DATE;
		REGISTERED_USER = rEGISTERED_USER;
		NOTES = nOTES;
		STATUS = sTATUS;
	}

	public String getPHARMO_CLASS() {
        return PHARMO_CLASS;
    }

    public void setPHARMO_CLASS(String PHARMO_CLASS) {
        this.PHARMO_CLASS = PHARMO_CLASS;
    }

    public String getTHERAPEUTIC_CLASS() {
        return THERAPEUTIC_CLASS;
    }

    public void setTHERAPEUTIC_CLASS(String THERAPEUTIC_CLASS) {
        this.THERAPEUTIC_CLASS = THERAPEUTIC_CLASS;
    }

    public String getCLINICAL_CLASS() {
        return CLINICAL_CLASS;
    }

    public void setCLINICAL_CLASS(String CLINICAL_CLASS) {
        this.CLINICAL_CLASS = CLINICAL_CLASS;
    }

    public String getANATOMICAL_CLASS() {
        return ANATOMICAL_CLASS;
    }

    public void setANATOMICAL_CLASS(String ANATOMICAL_CLASS) {
        this.ANATOMICAL_CLASS = ANATOMICAL_CLASS;
    }

    public String getCUTIONARY_LABLE() {
        return CUTIONARY_LABLE;
    }

    public void setCUTIONARY_LABLE(String CUTIONARY_LABLE) {
        this.CUTIONARY_LABLE = CUTIONARY_LABLE;
    }

    public String getGENERIC() {
        return GENERIC;
    }

    public void setGENERIC(String GENERIC) {
        this.GENERIC = GENERIC;
    }

	public String getSENO() {
		return SENO;
	}

	public void setSENO(String sENO) {
		SENO = sENO;
	}

	public String getCHEMICAL_CODE() {
		return CHEMICAL_CODE;
	}

	public void setCHEMICAL_CODE(String cHEMICAL_CODE) {
		CHEMICAL_CODE = cHEMICAL_CODE;
	}

	public String getATC_CODE() {
		return ATC_CODE;
	}

	public void setATC_CODE(String aTC_CODE) {
		ATC_CODE = aTC_CODE;
	}

	public String getADDVERSE_EFFECT() {
		return ADDVERSE_EFFECT;
	}

	public void setADDVERSE_EFFECT(String aDDVERSE_EFFECT) {
		ADDVERSE_EFFECT = aDDVERSE_EFFECT;
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

	public String getNOTES() {
		return NOTES;
	}

	public void setNOTES(String nOTES) {
		NOTES = nOTES;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	
    

}
