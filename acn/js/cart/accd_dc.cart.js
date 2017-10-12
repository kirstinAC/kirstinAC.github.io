/*
 *  AJAX Paypal Cart 
 *  Copyright (c) 2011 DIGICRAFTS. All Right Reserved.
 *
 *  This software is the proprietary information of
 *  DIGICRAFTS. ("Proprietary Information").  You shall not
 *  disclose such Proprietary Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into
 *  with DIGICRAFTS.
 */
 /*
 	Customized for Art Center - ACN - 2014 
 */
(function (window) {
    window.DC.cart = DC.cart || {};
    DC.cart.Cart = {
        width: 300,
        height: 200,
        widget: null,
        autoOpenWhenAdd: false,
        autoCleanCart: true,
        openNewCheckOutWindow: false,
        language: "en",
        currency: "USD",
        header: "",
        footer: "",
        maxAllowed: null,
        serverOptions: {},
        themeColor: undefined,
        themeDarkColor: undefined,
        cartOpened: false,
        onItemAdd: DC.NOOP,
        onItemupRemove: DC.NOOP,
        onCartUpdate: DC.NOOP,
        onValidateAddress: DC.NOOP,
        onCheckOut: DC.NOOP,
        _currentSection: "cart",
        _widget: null,
        _cartController: null,
        _container: null,
        _cartView: null,
        _addressView: null,
        _paymentView: null,
        init: function (options) {
            var self = this;
            $.extend(this, options);
            if (this.language) {
                DC.cart.lang = DC.cart["lang_" + this.language];
            } else {
                DC.cart.lang = DC.cart.lang_en;
            } if (this.widget) {
                this._widget = this.widget;
                this._widget.addClass("cartWidget");
                this._widget.click(function () {
                    log(self._container.y);
                    if (self.cartOpened) {
                        self.closeCart();
                        self._changeSection("cart");
                    } else {
                        self.openCart();
                    }
                });
            }
            this._container = new DC.cart.ContatinerView({
                styles: "cart",
                width: this.width,
                height: this.height,
                maxAllowed: this.maxAllowed,
                onLeftButtonClick: function () {
                    if (self._currentSection == "cart") {
                        self.closeCart();
                    } else {
                        if (self._currentSection == "confirmation") {
                            self._changeSection("cart");
                        } else {
                            if (self._currentSection == "register") {
                                if (self._cartController.needShipping) {
                                    self._changeSection("confirmation");
                                } else {
                                    self._changeSection("cart");
                                }
                            }
                        }
                    }
                },
                onRightButtonClick: function () {
                    if (self._currentSection == "cart") {
                        if (self._cartController.needShipping) {
                            self._changeSection("confirmation");
                        } else {
                            self._changeSection("register");
                        }
                    } else {
                        if (self._currentSection == "confirmation") {
                            self._cartController.address = self._addressView.getShipping();
                            if (!self._cartController.address) {
                                return;
                            }
                            self.onValidateAddress(self._cartController.address);
                            self._changeSection("register");
                        }
                        else
                        {
	                        if (self._currentSection == "register") {

								var i = 1;
								var ccn = "";

								var ccn = "";
								for (var idx in self._cartController.items) {
									var item = self._cartController.items[idx];
									ccn += (i>1?",":"") + item.id;
									i++;
								}

								$.fancybox({
									helpers : {
										overlay : {
											css : {
												'background' : 'rgba(255, 255, 255, 0.90)'
											}
										},
										changeFade: 10,
										changeSpeed: 10,
									},
									type 				: 'iframe',
									href				: self.serverOptions.server + '&CCN=' + ccn,
									hideOnOverlayClick	: false

								});              
	                            self._changeSection("cart");
								self.closeCart();
	                        }
                        }
                    }
                }
            });
            this._cartView = new DC.cart.CartView({
                width: 280,
                onUpdate: function (e) {},
                onItemUpdate: function (ids, qtys) {
                    self._cartController.updateItemQty(ids, qtys);
                },
                onItemRemove: function (item) {
                    self._cartController.removeItem(item.id);
                }
            });
            this._addressView = new DC.cart.AddressView();
            this._paymentView = new DC.cart.PaymentView();
            this._container.setHeader(this.header);
            this._container.setFooter(this.footer);
            this._cartController = new DC.cart.CartController({
                currency: this.currency,
                maxAllowed: this.maxAllowed,
                paymentOptions: this.paymentOptions,
                serverOptions: this.serverOptions,
                openNewCheckOutWindow: this.openNewCheckOutWindow,
                onUpdate: function (cart) {
                    self._updateCartView(cart);
                    self.onCartUpdate(cart);
                },
                onItemAdd: function (item) {
                    self.onItemAdd(item);
                },
                onItemupRemove: function (item) {
                    self.onItemRemove(item);
                },
                onCheckout: function (cart) {
                    if (self.autoCleanCart) {
                        cart.clean();
                    }
                    self.onCheckOut(cart);
                    self._changeSection("cart");
                    self.closeCart();
                }
            });
            this._changeSection("cart");
            this._container.attachTo("body");
            this._container.setSize(this.width, this.height);
            this._container.ui.css({
                top: 0,
                left: ($(window).width() - this.width) / 2
            });
            this._container.setVisible(false);
            $(window).resize(function () {
                self._container.ui.css({
                    left: ($(window).width() - self.width) / 2
                });
            });
        },
        _updateCartView: function (cart) {
            this._container.setNeedShipping(cart.needShipping);
            if (this._currentSection == "cart") {
                if (cart.count <= 0) {
                    this._container.rightButton.setEnabled(false);
                    this._container.setTitle(DC.cart.lang["label_noitem"]);
                } 
                else
                if (cart.count == 1) {
                    this._container.rightButton.setEnabled(true);
                    this._container.setTitle(DC.cart.lang["label_item1_info"].replace("%S", cart.count));
                }
                else {
                    this._container.rightButton.setEnabled(true);
                    this._container.setTitle(DC.cart.lang["label_item_info"].replace("%S", cart.count));
                    
                    if (cart.count == 5) {
					   this._container.setTitle(DC.cart.lang["label_item5_info"].replace("%S", cart.count));
					}
                } 
                if (this._container.visible) {
                    this._cartView.update(cart);
                }
            }
            this._updateContainerButton();
            if (this._widget) {
                var content = $('<div class="cart_icon"><div class="badge">' + DC.cart.lang["cartwidget"].replace("%S", cart.count) + '</div></div>');
                content.hide();
                this._widget.empty();
                this._widget.append(content);
                content.fadeIn();
            }
            this._updateStyles();
        },
        _changeSection: function (section) {
            if (section == "cart") {
                this._container.setContent(this._cartView);
                this._container.setTitle(DC.cart.lang["label_item_info"].replace("%S", this._cartController.count));
                this._container.rightButton.setVisible(true);
                this._container.setSection(1);
            } else {
                if (section == "confirmation") {
                    this._container.setContent(this._addressView);
                    var shipping_info = "";//DC.cart.lang["label_shipping_info"].replace("%S", DC.Currency[this._cartController.currency] + this._cartController.shipping);
                    this._container.setTitle(shipping_info);
                    this._container.rightButton.setVisible(true);
                    this._container.setSection(2);
                } else {
                    if (section == "register") {
                        this._paymentView.updatePayment(this._cartController);
                        this._container.setContent(this._paymentView);
                        this._container.setTitle(DC.cart.lang["label_payment_info"]);
                        this._container.rightButton.setVisible(true);
                        this._container.setSection(3);
                    }
                }
            }
            this._currentSection = section;
            this._updateStyles();
            this._updateContainerButton();
        },
        _updateContainerButton: function () {
            if (this._cartController) {
                if (this._currentSection == "cart") {
                    this._container.leftButton.setText(DC.cart.lang["button_cancel"]);
                    this._container.rightButton.setText(DC.cart.lang["button_confirm"]);
                } else {
                    if (this._currentSection == "confirmation") {
                        this._container.leftButton.setText(DC.cart.lang["button_cart"]);
                        this._container.rightButton.setText(DC.cart.lang["button_register"]);
                    } else {
                        if (this._currentSection == "register") {
                            this._container.leftButton.setText(DC.cart.lang["button_cart"]);
	                        this._container.rightButton.setText(DC.cart.lang["button_register"]);
                        }
                    }
                }
            }
        },
        _updateStyles: function () {
            log(this.themeColor);
            if (this.themeColor) {
                $(".dc_ui.cart .button").css("background-color", this.themeColor);
                $(".dc_ui.cart .button.disabled").css("background-color", "");
                $(".dc_ui.cart .step").css("background-color", "");
                $(".dc_ui.cart .step.selected").css("background-color", this.themeColor);
                $(".cartWidget").css("background-color", this.themeColor);
            }
            if (this.themeDarkColor) {
                $(".dc_ui.cart .step .tag").css("background-color", "");
                $(".dc_ui.cart .step.selected .tag").css("background-color", this.themeDarkColor);
                $(".dc_ui.cart .total_label .amount").css("color", this.themeDarkColor);
            }
        },
        openCart: function () {
            this.cartOpened = true;
            this._container.setVisible(true);
            this._updateCartView(this._cartController);
            this._container.setSize();
            this._container.setXY(0, -this.height - 60, 0);
            this._container.setXY(0, 0, 0.5);
        },
        closeCart: function () {
            this.cartOpened = false;
            var self = this;
            this._container.setXY(0, -this.height - 60, 0.5, function () {
                self._container.setVisible(false);
            });
        },
        add: function (data) {
            if (this.autoOpenWhenAdd) {
                this.openCart();
            }
            this._cartController.addItem(data);
        },
        remove: function (id) {
            this._cartController.removeItem(id);
        },
        clean: function () {
            this._cartController.clean();
        },
        updateQty: function (id, qty) {
            this._cartController.updateItemQty([id], [qty]);
        }
    };
    DC.cart.Cart = Class.extend(DC.cart.Cart);
}(window));
(function (window) {
    DC.cart.Item = {
        id: undefined,
        name: "no name",
        thumbnail: null,
        description: "item description",
        type: "DUMMY",
        currency_symbol: "$",
        currency: "DOLLAR",
        price: 0,
        shipping: undefined,
        shipping2: undefined,
        qty: 0,
        total: 0,
        weight: 0,
        allowMultiple: false,
        init: function (data) {
            if (data.id == "undefined" || data.id == undefined) {
                data.id = "undefined"; //Crypto.MD5(data.name);
            }
            if (data.price != undefined) {
                data.price = parseFloat(data.price);
            }
            if (data.shipping != undefined) {
                data.shipping = parseFloat(data.shipping);
            }
            if (data.shipping2 != undefined) {
                data.shipping2 = parseFloat(data.shipping2);
            }
            if (typeof data.allowMultiple == "string" && (data.allowMultiple.toLowerCase() == "false" || data.allowMultiple.toLowerCase() == "no")) {
                data.allowMultiple = false;
            }
            if (data.allowMultiple == false || data.allowMultiple == 0) {
                data.allowMultiple = false;
            }
            $.extend(this, data);
        }
    };
    window.DC.cart.Item = Class.extend(DC.cart.Item);
    DC.cart.CartEvent = {
        items: null,
        init: function (type, items) {
            this._super(type);
            this.items = items;
        }
    };
    window.DC.cart.CartEvent = DC.Event.extend(DC.cart.CartEvent);
    $.extend(DC.cart.CartEvent, {
        ADD: "cart_add",
        REMOVE: "cart_remove",
        UPDATE: "cart_update"
    });
    DC.cart.CartController = {
        id: "DEFAULT_NAME",
        version: "0.1",
        items: null,
        currency: "DOLLAR",
        needShipping: false,
        shipping: 0,
        address: null,
        count: 0,
        serverOptions: null,
        paymentOptions: null,
        total: 0,
        subTotal: 0,
        maxAllowed: null,
        openNewCheckOutWindow: false,
        _storage: null,
        onUpdate: DC.NOOP,
        onItemAdd: DC.NOOP,
        onItemRemove: DC.NOOP,
        onCheckout: DC.NOOP,
        init: function (options) {
            if (options) {
                $.extend(this, options);
            }
            this._storage = new DC.CookieStorage({
                id: this.id,
                version: this.version + "_" + this.currency
            });
            this.items = {};
            var tempItems = this._storage.get("cart");
            if (tempItems) {
                for (var i in tempItems) {
                    var item = tempItems[i];
                    this.items[item.id] = new DC.cart.Item(item);
                }
            }
            this._updateCount();
            this.onUpdate(this);
        },
        _update: function () {
            this._updateCount();
            this._storage.set("cart", this.items);
            this.onUpdate(this);
        },
        _updateCount: function () {
            var count = 0;
            this.needShipping = false;
            this.total = 0;
            this.subTotal = 0;
            this.shipping = 0;
            for (var idx in this.items) {
                if (this.items[idx]) {
                    if (this.items[idx].shipping != undefined) {
                        this.needShipping = true;
                        this.shipping += this.items[idx].shipping;
                        if (this.items[idx].shipping2 != undefined) {
                            this.needShipping = true;
                            this.shipping += this.items[idx].shipping2 * (this.items[idx].qty - 1);
                        }
                    }
                    var tt = this.items[idx].qty * this.items[idx].price;
                    if (tt > 0) {
                        this.subTotal = this.subTotal + tt;
                    }
                    count++;
                }
            }
            this.total = this.subTotal + this.shipping;
            this.count = count;
        },
        addItem: function (item) {
            var tempitem;
            if (item.id == "undefined" || item.id == undefined) {
                item.id = "undefined"; //Crypto.MD5(item.name);
            }
            
            //phc
			if (this.count < this.maxAllowed)
			{
            
				if (this.items[item.id]) {
					tempitem = this.items[item.id];
					tempitem.currency = this.currency;
				} else {
					tempitem = new DC.cart.Item(item);
					this.items[item.id] = tempitem;
				}
				tempitem.currency = this.currency;
				if (tempitem.allowMultiple) {
					if (item.qtys == undefined) {
						if (item.qtyInput) {
							if ($("#" + item.qtyInput)) {
								tempitem.qty += Number($("#" + item.qtyInput).val());
							}
						} else {
							tempitem.qty = tempitem.qty + 1;
						}
					} else {
						tempitem.qty = tempitem.qty + item.qtys;
					}
				} else {
					tempitem.qty = 1;
				}
				tempitem.total = tempitem.qty * item.price;
				if (tempitem.qty > 0) {

					this.onItemAdd(tempitem);
					this._update();
				} else {
					this.items[item.id] = null;
				}
				
			}	
			
        },
        removeItem: function (id) {
            if (id != undefined) {
                this.updateItemQty([id], [0]);
            }
        },
        updateItemQty: function (ids, qtys) {
            if (ids && qtys) {
                for (var i in ids) {
                    var id = ids[i];
                    var qty = qtys[i];
                    if (this.items[id] && qty != undefined) {
                        var tempitem = this.items[id];
                        if (qty > 0) {
                            tempitem.qty = qty;
                        } else {
                            this.onItemRemove(tempitem);
                            delete this.items[id];
                        }
                    }
                }
            }
            this._update();
        },
        getAllItems: function () {
            var a = [];
            for (var idx in this.items) {
                if (this.items[idx]) {
                    a.push(this.items[idx]);
                }
            }
            return a;
        },
        getItemsForPurchase: function () {
            var a = [];
            for (var idx in this.items) {
                if (this.items[idx]) {
                    a.push({
                        "qty": this.items[idx].qty,
                        "id": this.items[idx].id,
                        "class": this.items[idx]["class"]
                    });
                }
            }
            return a;
        },
        clean: function () {
            log("clean");
            this.items = {};
            this._update();
        },
        getPaymentButton: function () {
            if (this.paymentOptions != null) {
                return this.getURLPaymentButton();
            }
            return this.getPaypalButton();
        },
        getURLPaymentButton: function () {
            var self = this;
            var items = "";
            var address = "";
            var i = 1;
            for (var idx in this.items) {
                var item = this.items[idx];
                items += '<input type="hidden" name="item_name_' + i + '" value="' + item.name + '">';
                items += '<input type="hidden" name="amount_' + i + '" value="' + item.price + '">';
                items += '<input type="hidden" name="item_number_' + i + '" value="' + item.id + '">';
                items += '<input type="hidden" name="quantity_' + i + '" value="' + item.qty + '">';
                if (item.shipping > 0) {
                    items += '<input type="hidden" name="shipping_' + i + '" value="' + item.shipping + '">';
                }
                if (item.shipping2 > 0) {
                    items += '<input type="hidden" name="shipping2_' + i + '" value="' + item.shipping2 + '">';
                }
                if (item.weight > 0) {
                    items += '<input type="hidden" name="weight_' + i + '" value="' + item.weight * qty + '">';
                }
                i++;
            }
            var address_key = {
                "city": "city",
                "country": "country",
                "firstname": "first_name",
                "lastname": "last_name",
                "line1": "address1",
                "line2": "address2",
                "phone": "night_ phone_b",
                "zip": "zip"
            };
            if (this.needShipping && this.address) {
                for (var n in this.address) {
                    address += '<input type="hidden" name="' + address_key[n] + '" value="' + this.address[n] + '">';
                }
            }
            address += '<input type="hidden" name="currency_code" value="' + this.currency + '">';
            for (var p in this.serverOptions) {
                if (p != "server") {
                    address += '<input type="hidden" name="' + p + '" value="' + this.paymentOptions[p] + '">';
                }
            }
            if (this.paymentOptions.submitButton == undefined) {
                this.paymentOptions.submitButton = '<div class="float button mask" style="width: 98px; height: 22px;"><p>Check Out</p></div>';
            }
            var target = "";
            if (this.openNewCheckOutWindow) {
                target = 'target="_blank"';
            }
            var id = this.id + "_SUBMIT_BUTTON";
            var button = $('<form id="' + id + '" action="' + this.paymentOptions.server + '" method="post" ' + target + ">" + items + address + this.paymentOptions.submitButton + "</form>");
            button.click(function (e) {
                $("#" + id).trigger("submit");
                self.onCheckout(self);
            });
            return button;
        },
        getPaypalButton: function () {
            var self = this;
            var items = "";
            var address = "";
            var i = 1;
            var ccn = "";
            for (var idx in this.items) {
                var item = this.items[idx];
                items += '<input type="hidden" name="item_name_' + i + '" value="' + item.name + '">';
                items += '<input type="hidden" name="amount_' + i + '" value="' + item.price + '">';
                items += '<input type="hidden" name="item_number_' + i + '" value="' + item.id + '">';
                items += '<input type="hidden" name="quantity_' + i + '" value="' + item.qty + '">';
                if (item.shipping > 0) {
                    items += '<input type="hidden" name="shipping_' + i + '" value="' + item.shipping + '">';
                }
                if (item.shipping2 > 0) {
                    items += '<input type="hidden" name="shipping2_' + i + '" value="' + item.shipping2 + '">';
                }
                if (item.weight > 0) {
                    items += '<input type="hidden" name="weight_' + i + '" value="' + item.weight * qty + '">';
                }
                ccn += (i>1?",":"") + item.id;
                i++;
            }
            var address_key = {
                "city": "city",
                "country": "country",
                "firstname": "first_name",
                "lastname": "last_name",
                "line1": "address1",
                "line2": "address2",
                "phone": "night_ phone_b",
                "zip": "zip"
            };
            if (this.needShipping && this.address) {
                for (var n in this.address) {
                    address += '<input type="hidden" name="' + address_key[n] + '" value="' + this.address[n] + '">';
                }
            }
            address += '<input type="hidden" name="currency_code" value="' + this.currency + '">';
            for (var p in this.serverOptions) {
                if (p != "server") {
                    address += '<input type="hidden" name="' + p + '" value="' + this.serverOptions[p] + '">';
                }
            }
            if (this.serverOptions.server == undefined) {
                this.serverOptions.server = ""; //https://www-dev.artcenter.edu/acol-acn/WebAdvisor?&type=P&pid=ST-XWNSTS027&FORCEIDX=12345
            }
            var target = "";
            if (this.openNewCheckOutWindow) {
                target = 'target="_blank"';
            }
            var id = this.id + "_SUBMIT_BUTTON";
            //var button = $('<form id="' + id + '" action="' + this.serverOptions.server + '" method="post" ' + target + '><input type="hidden" name="cmd" value="_cart"> <input type="hidden" name="upload" value="1"> <input type="hidden" name="business" value="' + this.serverOptions.business + '">' + items + address 
            //				+ '<img src="register_now.jpg" align="left" style="margin-right:7px;"/></form>');
            
           
          
            var button = ""; // $('<a class=\"fancybox\" data-fancybox-type=\"iframe\" href=\"https://www-dev.artcenter.edu/acol-acn/WebAdvisor?&type=P&pid=ST-XWNSTS027&FORCEIDX=12345&CCN=' + ccn + '\" id=\"register_class_link\" onclick=\"javascript:window.open(\'coursepopup.jsp\', \'wn_classdescription\',\'width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX=\'+(window.screen.width - 480));\"><img src=\"register_now.jpg\"></a>');
            
            
            //button.click(function (e) {
            //    $("#" + id).trigger("submit");
            //    self.onCheckout(self);
            //});
            return button;
        },
        getfreeItems: function () {
            var f = true;
            for (var idx in this.items) {
                if (this.items[idx].price != 0) {
                    f = false;
                    break;
                }
            }
            if (f) {
                f = (this.total() <= 0);
            }
            return f;
        }
    };
    DC.cart.CartController = Class.extend(DC.cart.CartController);
}(window));
(function (window) {
    DC.cart.ContatinerView = {
        leftButton: null,
        rightButton: null,
        _header: null,
        _footer: null,
        _content: null,
        _headerContainer: null,
        _title: null,
        _titleContainer: null,
        _step1: null,
        _step2: null,
        _step3: null,
        _contentContainer: null,
        _controlContainer: null,
        _headerWidth: 100,
        _haveAddress: false,
        onRightButtonClick: DC.NOOP,
        onLeftButtonClick: DC.NOOP,
        createChildren: function () {
            this._super();
            var self = this;
            this._header = new DC.Container({
                styles: "header",
                width: this.width,
                height: 0
            });
            this._footer = new DC.Container({
                styles: "footer",
                width: this.width,
                height: 0
            });
            this._step1 = new DC.Text({
                styles: "step selected",
                text: '<div class="tag">' + DC.cart.lang["step1"] + "</div> " + DC.cart.lang["step1_text"]
            });
            this._step2 = new DC.Text({
                styles: "step",
                text: '<div class="tag">' + DC.cart.lang["step2"] + "</div> " + DC.cart.lang["step2_text"]
            });
            this._step3 = new DC.Text({
                styles: "step",
                text: '<div class="tag">' + DC.cart.lang["step3"] + "</div> " + DC.cart.lang["step3_text"]
            });
            this._headerContainer = new DC.HBox({
                gap: 0,
                styles: "header_container",
                width: this.width
            });
            this._headerContainer.addChild(this._step1);
            this._headerContainer.addChild(this._step2);
            this._headerContainer.addChild(this._step3);
            this._title = new DC.Text({
                styles: "title",
                text: "<This is title"
            });
            this._titleContainer = new DC.Container({
                styles: "title_container",
                width: this.width
            });
            this._titleContainer.addChild(this._title);
            this._contentContainer = new DC.Container({
                styles: "content_container",
                width: this.width
            });
            this._controlContainer = new DC.Container({
                styles: "control_container",
                width: this.width
            });
            this.leftButton = new DC.Button({
                styles: "left_button",
                text: "Left",
                onClick: function () {
                    self.onLeftButtonClick();
                }
            });
            this.rightButton = new DC.Button({
                styles: "right_button",
                text: "Right",
                onClick: function () {
                    self.onRightButtonClick();
                }
            });
            this._controlContainer.addChild(this.leftButton);
            this._controlContainer.addChild(this.rightButton);
            this.addClass("cartcontainer");
        },
        createComplete: function () {
            this._super();
            this.addChild(this._header);
            //this.addChild(this._headerContainer);
            this.addChild(this._titleContainer);
            this.addChild(this._contentContainer);
            this.addChild(this._controlContainer);
            this.addChild(this._footer);
        },
        setSize: function (w, h) {
            var hh = this.defaultHeight - $(".cartcontainer > .header").height() - $(".cartcontainer > .footer").height() - $(".cartcontainer > .title_container").height() - $(".cartcontainer > .control_container").height() - $(".cartcontainer > .header_container").height();
            if (hh > 0) {
                this._contentContainer.setSize(this.width, hh);
            }
            this._super(w, h);
            this._header.setSize();
            this._footer.setSize();
            if (this._haveAddress) {
                this._headerWidth = this.innerWidth / 3;
            } else {
                this._headerWidth = this.innerWidth / 2;
            }
            this._step1.setSize(this._headerWidth);
            this._step2.setSize(this._headerWidth);
            this._step3.setSize(this._headerWidth);
            this._headerContainer.setSize(this.innerWidth);
            if (this._content) {
                this._content.setSize(this._contentContainer.width, this._contentContainer.height);
            }
        },
        setNeedShipping: function (address) {
            this._haveAddress = address;
            this._headerContainer.removeAllChildren();
            if (address) {
                this._headerWidth = this.innerWidth / 3;
                this._step3.setText('<div class="tag">' + DC.cart.lang["step3"] + "</div> " + DC.cart.lang["step3_text"]);
                this._headerContainer.addChild(this._step1);
                this._headerContainer.addChild(this._step2);
                this._headerContainer.addChild(this._step3);
            } else {
                this._step3.setText('<div class="tag">' + DC.cart.lang["step2"] + "</div> " + DC.cart.lang["step3_text"]);
                this._headerWidth = this.innerWidth / 2;
                this._headerContainer.addChild(this._step1);
                this._headerContainer.addChild(this._step3);
            }
        },
        setContent: function (content) {
            if (this._contentContainer) {
                if (this._content) {
                    this._contentContainer.removeChild(this._content);
                }
                this._content = content;
                this._contentContainer.addChild(content);
                this.setSize();
            }
        },
        setSection: function (value) {
            this._step1.removeClass("selected");
            this._step2.removeClass("selected");
            this._step3.removeClass("selected");
            if (value == 1) {
                this._step1.addClass("selected");
            } else {
                if (value == 2) {
                    this._step2.addClass("selected");
                } else {
                    if (value == 3) {
                        this._step3.addClass("selected");
                    }
                }
            }
        },
        setTitle: function (value) {
            this._title.setText(value);
        },
        setHeader: function (value) {
            if (value && value != "") {
                this._header.ui.append(value);
            } else {
                this._header.setVisible(false);
            }
        },
        setFooter: function (value) {
            if (value && value != "") {
                this._footer.ui.append(value);
            } else {
                this._footer.setVisible(false);
            }
        }
    };
    window.DC.cart.ContatinerView = DC.VBox.extend(DC.cart.ContatinerView);
}(window));
(function (window) {
    DC.cart.CartItemRenderer = {
        thumbnail: null,
        title: null,
        itemid: null,
        price: null,
        qty: null,
        delete_button: null,
        onItemRemove: DC.NOOP,
        onItemUpdate: DC.NOOP,
        createChildren: function () {
            this._super();
            var self = this;
            this.leftContainer = new DC.Container({
                styles: "container"
            });
            this.leftContainer.removeClass("mask");
            this.thumbnail = new DC.Image({
                styles: "thumbnail",
                width: 30,
                height: 30
            });
            this.title = new DC.Text({
                styles: "title"
            });
            this.itemid = new DC.Text({
                styles: "itemid"
            });
            this.leftContainer.addChild(this.thumbnail);
            this.leftContainer.addChild(this.title);
            this.leftContainer.addChild(this.itemid);
            this.price = new DC.Text({
                styles: "price"
            });
            this.qty = new DC.TextInput({
                styles: "qty",
                onChange: function (d) {
                    self.data.qty = DC.num(self.qty.value());
                    self.dispatchEvent(new DC.cart.CartEvent(DC.cart.CartEvent.CHANGE, self.data));
                }
            });
            this.qty.setVisible(false);
            this.delete_button = new DC.Button({
                text: DC.cart.lang["button_delete"],
                styles: "delete_button",
                onClick: function () {
                    self.dispatchEvent(new DC.cart.CartEvent(DC.cart.CartEvent.REMOVE, self.data));
                }
            });
        },
        createComplete: function () {
            this._super();
            this.addChild(this.leftContainer);
            this.addChild(this.price);
            this.addChild(this.qty);
            this.addChild(this.delete_button);
        },
        commitSize: function () {
            this._super();
            this.qty.setSize(25);
            if (this.data.thumbnail) {
                this.thumbnail.setVisible(true);
                this.title.ui.css({
                    left: this.thumbnail.width + 10
                });
                this.itemid.ui.css({
                    left: this.thumbnail.width + 10
                });
            } else {
                this.thumbnail.setVisible(false);
                this.title.ui.css({
                    left: ""
                });
                this.itemid.ui.css({
                    left: ""
                });
            }
        },
        commitProperties: function (prop, value) {
            switch (prop) {
            case "data":
                this.title.setText(this.data.name);
                this.itemid.setText(this.data.id);
                this.thumbnail.setSource(this.data.thumbnail);
                this.price.setText(this.data.price);
                if (this.data.price == 0) {
                    this.price.setText(" ");
                } else {
                    this.price.setText(""); //DC.Currency[this.data.currency] + this.data.price * this.data.qty);
                } if (this.data.allowMultiple) {
                    this.qty.setVisible(true);
                    this.qty.setValue(this.data.qty);
                } else {
                    this.qty.setVisible(false);
                }
                break;
            }
        }
    };
    DC.cart.CartItemRenderer = DC.DataRenderer.extend(DC.cart.CartItemRenderer);
    DC.cart.CartView = {
        list: null,
        infoContainer: null,
        totalLabel: null,
        updateButton: null,
        promo_label: null,
        promo_text: null,
        promo_input: null,
        promo_button: null,
        _ds: null,
        _updataItemsLaterList: null,
        onItemRemove: DC.NOOP,
        onItemUpdate: DC.NOOP,
        onPromoCode: DC.NOOP,
        createChildren: function () {
            this._super();
            var self = this;
            this._updataItemsLaterList = {};
            this.list = new DC.Table({
                styles: "item_table",
                width: this.width,
                itemRenderer: DC.cart.CartItemRenderer
            });
            this._ds = new DC.DataSource();
            this.list.setDataSource(this._ds);
            this.list.addEventListener(DC.cart.CartEvent.REMOVE, function (e) {
                self.onItemRemove(e.items);
            });
            this.list.addEventListener(DC.cart.CartEvent.CHANGE, function (e) {
                self._saveUpdateItems(e.items.id, e.items.qty);
            });
            this.infoContainer = new DC.Container({
                styles: "info_container",
                width: this.width
            });
            this.totalLabel = new DC.Text({
                styles: "total_label",
                text: DC.cart.lang["label_total"]
            });
            this.updateButton = new DC.Button({
                styles: "update_button",
                text: DC.cart.lang["button_update"],
                onClick: function () {
                    log("up");
                    self._updateItems();
                }
            });
            this.addClass("cartview");
        },
        createComplete: function () {
            this._super();
            this.infoContainer.addChild(this.totalLabel);
            //this.infoContainer.addChild(this.updateButton);
            this.addChild(this.list);
            this.addChild(this.infoContainer);
        },
        commitSize: function () {
            this._super();
            this.infoContainer.setSize(this.width);
            this.list.setSize(this.width, this.height - this.infoContainer.height);
            this.list.setXY(0, 0);
            this.infoContainer.setXY(0, this.height - this.infoContainer.height);
        },
        _saveUpdateItems: function (id, qty) {
            if (id != undefined) {
                this._updataItemsLaterList[id] = qty;
            }
        },
        _updateItems: function () {
            var ids = [];
            var qtys = [];
            for (var i in this._updataItemsLaterList) {
                ids.push(i);
                qtys.push(this._updataItemsLaterList[i]);
            }
            this.onItemUpdate(ids, qtys);
        },
        update: function (cart) {
            this._updataItemsLaterList = {};
            if (cart.count > 0) {
                this.list.setVisible(true);
                this.infoContainer.setVisible(true);
                this.totalLabel.setText('<div class="amount">' + DC.cart.lang["label_total"] + cart.count + "</div>");
                this.totalLabel.ui.css({
                    width: "",
                    height: ""
                });
                this.updateButton.ui.css({
                    right: this.updateButton.width + this.totalLabel.width + 10
                });
                this._ds.load(cart.getAllItems());
            } else {
                this.list.setVisible(false);
                this.infoContainer.setVisible(false);
            }
        }
    };
    window.DC.cart.CartView = DC.Container.extend(DC.cart.CartView);
}(window));
(function (window) {
    DC.cart.AddressView = {
        form: null,
        createChildren: function () {
            this._super();
            this.addClass("shippingview");
            this.form = new DC.Form({
                id: "address",
                gap: 5,
                width: this.width,
                labelWidth: 120,
                data: DC.cart.lang.addressform
            });
        },
        createComplete: function () {
            this._super();
            this.addChild(this.form);
        },
        setSize: function (w, h) {
            this._super(w, h);
            this.form.setSize(this.width);
        },
        getShipping: function () {
            return this.form.values();
        }
    };
    window.DC.cart.AddressView = DC.Container.extend(DC.cart.AddressView);
}(window));
(function (window) {
    DC.cart.PaymentView = {
        payButtonContainer: null,
        detailContainer: null,
        createChildren: function () {
            this._super();
            this.addClass("paymentview");
            this.payButtonContainer = new DC.Container({
                styles: "pay_button_container",
                width: this.width
            });
            this.detailContainer = new DC.Text({
                styles: "detail_container"
            });
        },
        createComplete: function () {
            this._super();
            this.addChild(this.detailContainer);
            this.addChild(this.payButtonContainer);
        },
        setSize: function (w, h) {
            this._super(w, h);
        },
        updatePayment: function (cart) {
            var detail = (cart.count == 1) ? DC.cart.lang["label_item1_cost"].replace("%S", cart.count) : DC.cart.lang["label_item_cost"].replace("%S", cart.count);
            if (cart.needShipping) {
                detail += ""; //DC.cart.lang["label_shipping_cost"].replace("%S", DC.Currency[cart.currency] + cart.shipping) + "<br/>";
            }
            //detail += DC.cart.lang["label_total_cost"].replace("%S", DC.Currency[cart.currency] + cart.total) + "<br/>";
            this.detailContainer.setText(detail);
            this.payButtonContainer.ui.removeClass("mask");
            this.payButtonContainer.ui.empty();
            this.payButtonContainer.ui.append(cart.getPaymentButton());
        }
    };
    window.DC.cart.PaymentView = DC.Container.extend(DC.cart.PaymentView);
}(window));
(function (window) {
    $.fn.extend({
        DCAJAXCart: function (options) {
            var defaults = {
                width: 500,
                height: 400
            };
            var options = $.extend(defaults, options);
            var self = this;
            return this.each(function () {
                options.widget = self;
                options.footer = '';
                self.cart = new DC.cart.Cart(options);
                for (var fn in self.cart) {
                    if (typeof self.cart[fn] == "function") {
                        var f = function () {
                            self.cart[arguments.callee.FUNCTION_NAME].apply(self.cart, arguments);
                        };
                        f["FUNCTION_NAME"] = fn;
                        self[fn] = f;
                    }
                }
                self.addButton = function (target, data) {
                    $(target).click(function () {
                        self.cart.add(data);
                    });
                };
            });
        }
    });
}(window));