package demo.domain;

public class OrganizationLevel {
    private Long organizationId;

    private String organizationName;

    private Byte organizationTypeId;

    private String sn;

    private Long parentId;

    public Long getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Long organizationId) {
        this.organizationId = organizationId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName == null ? null : organizationName.trim();
    }

    public Byte getOrganizationTypeId() {
        return organizationTypeId;
    }

    public void setOrganizationTypeId(Byte organizationTypeId) {
        this.organizationTypeId = organizationTypeId;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
}