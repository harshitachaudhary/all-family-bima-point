﻿<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="awards.aspx.cs" Inherits="awards" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <!-- Start Pages Title  -->

        <section id="Page-title" class="Page-title-Style1">
            <div class="color-overlay"></div>
            <div class="container inner-img">
                <div class="row">
                    <div class="Page-title">
                        <div class="col-md-12 text-center">
                            <div class="title-text">
                                <h6>ALL FAMILY BIMA POINT</h6>
                                <h2 class="page-title">AWARDS & ACHIEVEMENTS</h2>
                            </div>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="breadcrumb-trail breadcrumbs">
                                <span class="trail-begin"><a href="#">Home</a></span>
                                <span class="sep">/</span> <span class="trail-end">Awards & Achievements</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- End Pages Title  -->
        <!-- Start Our Team -->

        <section id="Team" class="light-wrapper">
            <div class="container inner">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-section text-left">
                            <p>Creatives</p>
                            <h3>OUR AWARDS AND ACHIEVEMENTS</h3>
                        </div>
                        <div class="description-welcome text-left">
                            <p>BIMA POINT has more than 200 happy and satisfied customers. In a very short period BIMA POINT
                     received much more awards from LIC of India , The BIMA POINT says THANKS to all customers for
                               trust .</p>
                        </div>
                    </div>
                </div>
                <div class="divcod55"></div>
                <div class="row">


                    <asp:Repeater ID="rptrawrd" runat="server">
                            <ItemTemplate>
                    <div class="team-item col-xs-12 col-sm-6 col-md-3">
                        <div class="team-item-block" style="margin-top: 30px;">
                            <div class="team-thumb">
                                <img src="<%# ResolveUrl(Eval("img").ToString()) %>" alt="Mahmoud ADel Baghagho">
                            </div>
                            <div class="info-team">
                                <h5><%# Eval("name") %></h5>
                                <p class="team-company"><%# Eval("desc_") %></p>
                            </div>
                        </div>
                    </div>

                   </ItemTemplate>
                        </asp:Repeater>


                  
                   
                   
                </div>
            </div>
        </section>

        <!-- End Our Team -->

    </div>
</asp:Content>

