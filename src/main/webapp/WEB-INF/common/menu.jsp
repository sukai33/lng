<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="tpl-left-nav tpl-left-nav-hover">
    <div class="tpl-left-nav-title">
        Amaze UI 列表
    </div>
    <div class="tpl-left-nav-list">
        <ul class="tpl-left-nav-menu">
            <li class="tpl-left-nav-item">
                <a href="/admin/loginSuccess"
                   class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-home"></i>
                    <span>首页</span>
                </a>
            </li>

            <shiro:hasPermission name="2">
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" id="role" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-wpforms"></i>
                        <span>气瓶信息</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                </li>
            </shiro:hasPermission>

            <shiro:hasPermission name="2">
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" id="role" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-wpforms"></i>
                        <span>车辆信息</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            <a href="#">
                                <i class="am-icon-angle-right"></i>
                                <span>车辆信息</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="#">
                                <i class="am-icon-angle-right"></i>
                                <span>车辆终端管理</span>
                            </a>

                            <a href="#">
                                <i class="am-icon-angle-right"></i>
                                <span>质检管理</span>
                            </a>

                            <a href="#">
                                <i class="am-icon-angle-right"></i>
                                <span>续费管理</span>
                            </a>

                            <a href="#">
                                <i class="am-icon-angle-right"></i>
                                <span>车辆到期管理</span>
                            </a>
                        </li>
                    </ul>
                </li>

            </shiro:hasPermission>

            <shiro:hasPermission name="2">
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" id="" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-wpforms"></i>
                        <span>车辆管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                            <a href="/admin/findAllVehicle">
                                <i class="am-icon-angle-right"></i>
                                <span>车辆列表</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="/admin/showPosition">
                                <i class="am-icon-angle-right"></i>
                                <span>位置监控</span>
                            </a>

                          <%--  <a href="/admin/addVehicle">
                                <i class="am-icon-angle-right"></i>
                                <span>添加车辆</span>
                            </a>--%>

                        </li>
                    </ul>

                </li>
            </shiro:hasPermission>

            <shiro:hasPermission name="2">
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" id="role" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-wpforms"></i>
                        <span>系统管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li class="tpl-left-nav-item">
                            <a href="javascript:;" id="role" class="nav-link tpl-left-nav-link-list">
                                <i class="am-icon-angle-right"></i>
                                <span>角色管理</span>
                                <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                            </a>
                            <ul class="tpl-left-nav-sub-menu" style="display: none;">
                                <li>
                                    <a href="/role/findAll">
                                        <i class="am-icon-angle-right"></i>
                                        <span>角色查询</span>
                                        <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                    </a>

                                    <a href="/admin/addUser">
                                        <i class="am-icon-angle-right"></i>
                                        <span>添加角色</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="tpl-left-nav-item">
                            <a href="javascript:;" id="user" class="nav-link tpl-left-nav-link-list">
                                <i class="am-icon-angle-right"></i>
                                <span>用户管理</span>
                                <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                            </a>
                            <ul class="tpl-left-nav-sub-menu" style="display: none;">
                                <li>
                                    <a href="/admin/showUser">
                                        <i class="am-icon-angle-right"></i>
                                        <span>用户查询</span>
                                        <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                    </a>

                                    <a href="/admin/addUser">
                                        <i class="am-icon-angle-right"></i>
                                        <span>添加用户</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="tpl-left-nav-item">
                            <a href="javascript:;" id="dept" class="nav-link tpl-left-nav-link-list">
                                <i class="am-icon-angle-right"></i>
                                <span>机构管理</span>
                                <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                            </a>
                            <ul class="tpl-left-nav-sub-menu" style="display: none;">
                                <li>
                                    <a href="#">
                                        <i class="am-icon-angle-right"></i>
                                        <span>机构查询</span>
                                        <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                    </a>

                                    <a href="#">
                                        <i class="am-icon-angle-right"></i>
                                        <span>添加机构</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </li>

            </shiro:hasPermission>

        </ul>
    </div>
</div>
