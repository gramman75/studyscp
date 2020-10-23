sap.ui.define([
        "sap/ui/core/mvc/Controller",
        "sap/m/MessageToast",
        "sap/m/MessageBox"
	],
	/**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
	function (Controller, MessageToast, MessageBox) {
		"use strict";

		return Controller.extend("ns.ultrakim-fiori.controller.View1", {
			onInit: function () {

            },
            onSave: function() {
                this.getView().getModel().submitBatch("bookGroup").then(function(){
                    MessageToast.show("성공");
                });
   
            }
		});
	});
