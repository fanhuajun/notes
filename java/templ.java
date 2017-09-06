/*
 * @(#)WorkOrderDetailDTO.java 2016年11月29日
 * 
 * Copyright (c), 2016 深圳市万睿智能科技有限公司（Shenzhen Wan Rui Intelligent Technology Co., Ltd.）
 * 
 * 著作权人保留一切权利，任何使用需经授权。
 */
package com.vanrui.app.order.dto;

/**
 *
 * @author fanhuajun
 * @date 2016年11月29日 下午5:51:42
 * @version V1.0.0 description：
 * 
 */
public class WorkOrderDetailDTO {
    
    // 工单状态
    private Integer status;
    
    // 所属项目ID
    private Long orgId;
    
    // 故障设备ID
    private Long deviceId;
    
    // 安装地点
    private String devicePosition;
    
    // 故障描述
    private String faultDesc;
    
    // 故障图片URL
    private String faultPicture;
    
    // 故障原因
    private String failureCause;
    
    // 维修方法
    private String maintenanceMethod;
    
    

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public String getDevicePosition() {
        return devicePosition;
    }

    public void setDevicePosition(String devicePosition) {
        this.devicePosition = devicePosition;
    }

    public String getFaultDesc() {
        return faultDesc;
    }

    public void setFaultDesc(String faultDesc) {
        this.faultDesc = faultDesc;
    }

    public String getFaultPicture() {
        return faultPicture;
    }

    public void setFaultPicture(String faultPicture) {
        this.faultPicture = faultPicture;
    }

    public String getFailureCause() {
        return failureCause;
    }

    public void setFailureCause(String failureCause) {
        this.failureCause = failureCause;
    }

    public String getMaintenanceMethod() {
        return maintenanceMethod;
    }

    public void setMaintenanceMethod(String maintenanceMethod) {
        this.maintenanceMethod = maintenanceMethod;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}
