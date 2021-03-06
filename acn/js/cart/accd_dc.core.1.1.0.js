/* 
 * Digicrafts JS Framework
 * @version 1.0.0
 * Copyright (c) 2011 DIGICRAFTS. All Right Reserved.
 *
 * http://www.digicrafts.com.hk/components
 *
 *  This software is the proprietary information of
 *  DIGICRAFTS. ("Proprietary Information").  You shall not
 *  disclose such Proprietary Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into
 *  with DIGICRAFTS.
 *
 *
 */
(function (window) {
    window.DC = window.DC || {};
    window.DC.NOOP = function () {};
    var initializing = false,
        fnTest = /xyz/.test(function () {
            xyz;
        }) ? /\b_super\b/ : /.*/;
    this.Class = function () {};
    Class.extend = function (prop) {
        var _super = this.prototype;
        initializing = true;
        var prototype = new this();
        initializing = false;
        for (var name in prop) {
            prototype[name] = typeof prop[name] == "function" && typeof _super[name] == "function" && fnTest.test(prop[name]) ? (function (name, fn) {
                return function () {
                    var tmp = this._super;
                    this._super = _super[name];
                    var ret = fn.apply(this, arguments);
                    this._super = tmp;
                    return ret;
                };
            })(name, prop[name]) : prop[name];
        }

        function Class() {
            if (!initializing && this.init) {
                this.init.apply(this, arguments);
            }
        }
        Class.prototype = prototype;
        Class.constructor = Class;
        Class.extend = arguments.callee;
        return Class;
    };
    var Interface = {
        _currentTarget: null,
        init: function (options) {
            if (options && options.delegate) {
                this.setDelegate(options.delegate);
            }
        },
        setDelegate: function (delegate) {
            if (delegate) {
                var self = this;
                var fn;
                if (this.delegate) {
                    for (fn in this) {
                        if (typeof this[fn] == "function" && fn.substring(0, 1) == "I" && this.delegate[fn.substring(1, fn.length)]) {
                            delete this.delegate[fn.substring(1, fn.length)];
                        }
                    }
                }
                for (fn in this) {
                    if (typeof this[fn] == "function") {
                        if (fn.substring(0, 1) == "I") {
                            var f = function () {
                                self[arguments.callee.FUNCTION_NAME].apply(self, arguments);
                            };
                            f["FUNCTION_NAME"] = fn;
                            delegate[fn.substring(1, fn.length)] = f;
                        }
                    } else {}
                }
                this.delegate = delegate;
            }
        }
    };
    window.Interface = Class.extend(Interface);
    DC.synthesize = function (prop, target) {
        if (target[prop] != undefined) {
            var s = "set" + prop.charAt(0).toUpperCase() + prop.slice(1);
            target[s] = function (value) {
                this[prop] = value;
                if (this.commitProperties) {
                    this.commitProperties(prop, value);
                }
            };
        }
    };
    var Error = {
        id: 0,
        msg: "",
        init: function (id, msg) {
            this.id = id;
            this.msg = msg;
        },
        toString: function () {
            return "[Error (id=" + this.id + " msg=" + this.msg + ")]";
        }
    };
    window.DC.Error = Class.extend(Error);
}(window));
DC.BLANK_IMAGE = "data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==";
DC.LOGO = "data:image/gif;base64,R0lGODlhjgAUANU/ANPS0+Pj4yglJUlGRry6uzk2N8zLy9zc3MTDw+7t7vX19a2srLe1tvn5+aWkpPHx8WViYpSSk4yKi+rq6l1aW/z8/HRycn16e4WDhGxqarKxsZ6cnFVSU09MTXh1doiGh0E9Pi8rLGdlZWBdXY+NjVhVVoB+f3BtbrCur7i3t7WztKmoqDQwMbSzs+fm5tjX12NgYaempvz7/KKgoODf38fGx2toab++vtDPz5mXmFJPUHJwcHl3d5GQkCMfIP///yH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpEMjc5RkU1QjVBNzUxMUUwQkFDOUQ4QkEwOEFFQjY0NiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpEMjc5RkU1QzVBNzUxMUUwQkFDOUQ4QkEwOEFFQjY0NiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkQyNzlGRTU5NUE3NTExRTBCQUM5RDhCQTA4QUVCNjQ2IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkQyNzlGRTVBNUE3NTExRTBCQUM5RDhCQTA4QUVCNjQ2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAQAAPwAsAAAAAI4AFAAABv/An3BILBqPyKRyyWw6n9AmgJGqUm+114OoSFG9L+JEcxlRRh9DcWolKIiv2ckMkeC43mqVgAC4jgExK4OEKA1EBl96XgiJi48MNxVCLxEidBJqQhMAb0YNID6io6MFJp4apD4aQgEXLKqiMBNCoKQsngQcsaImhz8ovKIhGVtEFLwFvz8TIcIlocKiIz8Iu7wjCS4EADVHCNKjOUIwpCBvCLDSFkLgpOwyF+E+K0Ij8xFEBMIQRDHr83wgSBVuwYsAP8IYsaCKxz1SGH4EEADxhwt1ojjg0EGKgxCGpBD8wEBKwAoDzkb1+EGD4igQF1KKilhrgLAPREqoCsFTxwn/njJFCeDZAYdLHwIWtFClQkEkTUQSYPQB4sc+UgR+5FAF4IcJVXeiifLwQ6q5CgeO+hDxA4BaBj8iqIrxw+YoVkIc3CK1YMgLtR8STJjwQHACHqRCABCsAPEodv9GCUDYgJaRBaok/DhBqoCCCnZF6SgbdMCPG6pYYSal+SupFD/kjQqRAHTiB25HsUgg5EEB3SJI3RFCouSBT2J99Os9lcSPHiNgwECzBJnkAw+C8vhhQBVOvaTyRehAvgMF3taFHpCR3PODqWy7v6sAgRRO4u9szLZsaxQFIRVMIsRVdw2Bw04ReNJEWqSU8MMKqnjj2ihZ6SQZQke01NEPDI5i/0I1BYAgIghZyfZSchR44oJMIRzAkSgDCOhOKR0MUIIxP+hXCo4uqCUKCCg40cNcP1gIYwUK/FZKAx2KIoIBHvAgJQ8eICQXKQ78MIMqajTg5Zc/JCkNBZIM4ZgoOInF1kfC2DDEiqRcUMQGwpygIBIyhOYDbRqq9AMDqnwoQWoPlfKZniHQ8qIoHQhoxFKdKbnnfQkdVcADCmCkWVlTkXLDEFuSAtUQNXTACztK1KDKCT8Ud90PwZECQAXt4ZCcD87JN0oGbakyDgALBLvACjTAqsoLACTG2w/1jTIDS0cF+cNqo5DQggYMLHMNjDIgsUFQPiijhImifJqcg3CO0v/BD6rOR5B6samSFUkX/mAqKTQ0Q8q6oYryXzWkDHBIu6IMV2i4jvqlVj5CJLBDBhBnAMALUzWahG9nzShKPXSSMs6QIRk7ioMYv6RAf7L0SoqbHY+ywQ/b+kBXBYv6kNUP4PmwG7SkwHDEByUVm5cqxSb3YRLvipJPejpvUfNkzAYskVpZJu0DTsm+Fq9w9iY2QZMh/EGtD24KQa8PMcalyrNFKJAcNUMczGqTPgyHRDmkZHCwD5plPYrPtHZkwN5dNTtKV1ajkEJQZPktSj9Aj+Km26ToIIIIE8RK9g95JvZHEaiFN4SYo3hggJFrKdGnNB1scbYoeDHNCwgN9FjBuRAE1/lGZKOkEPgodG0Vy26h5aoKr0ZwRoo3tdyqygCfI+GqMCxYwNt7txhzA7iXj4ITyC4DKIGPosFlzy0NECjKC7bHAsMDR7Gyg7xGTGTOMuw6H25gSyTCwP//SwEfFjOEB6gAgAwYVQAiAAMKXEAkNAAgb/wHQBxxyBJn2MEMFAKgGyBQDS844P8+FQAUqOCEKNTACxSgghZcizcIQCAB8LeJFiCwK20jQBkoAAEMIOBOUQiiEIdIxCIaUQlBAAA7";
(function (window) {
    var Debug = {
        _console: null,
        log: function () {
            if (Debug.debug && !DC.System.isIE && !DC.System.isOpera && window["console"]) {
                var msg = "";
                if (arguments) {
                    if (arguments.length > 1) {
                        for (var i = 0; i < arguments.length; i++) {
                            msg += arguments[i] + " ";
                        }
                    } else {
                        msg = arguments[0];
                    }
                }
                window.console.log(msg);
            }
        },
        debug: false
    };
    DC.Debug = Debug;
    window.log = DC.log = Debug.log;
}(window));
(function (window) {
    DC.num = function (value) {
        return parseInt(value, 10) || 0;
    };
    DC.roundNumber = function (num, dec) {
        var result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);
        return result;
    };
    DC.System = {
        isIPhone: false,
        isIPad: false,
        isAndroid: false,
        isIOS: false,
        isTouch: false,
        isIE: false,
        isFirefox: false,
        isOpera: false,
        isSafari: false,
        isChrome: false
    };
    DC.System.isIPhone = RegExp("iPhone").test(navigator.userAgent);
    DC.System.isIPad = RegExp("iPad").test(navigator.userAgent);
    DC.System.isIOS = DC.System.isIPad || DC.System.isIPhone;
    DC.System.isAndroid = RegExp("Android").test(navigator.userAgent);
    DC.System.isTouch = DC.System.isIOS || DC.System.isAndroid;
    DC.System.isIE = RegExp("MSIE").test(navigator.userAgent);
    DC.System.isFirefox = RegExp("Gecko").test(navigator.userAgent);
    DC.System.isOpera = RegExp("Opera").test(navigator.userAgent);
    DC.System.isSafari = RegExp("Safari").test(navigator.userAgent);
    DC.System.isChrome = RegExp("Chrome").test(navigator.userAgent);
    DC.Alignment = {
        TOP: 0,
        RIGHT: 1,
        BOTTOM: 2,
        LEFT: 3,
        MIDDLE: 4,
        CENTER: 5,
        TOP_LEFT: 10,
        TOP_RIGHT: 11,
        BOTTOM_LEFT: 10,
        BOTTOM_RIGHT: 11,
        VERTICAL: 50,
        HORIZONTAL: 51,
        AUTO: 99,
        HIDE: 100
    };
    DC.Size = {
        AUTO: 0,
        AUTO_WIDTH: 1,
        AUTO_HEIGHT: 2,
        STRETCH: 3,
        CLIP: 4,
        AUTO_FILL: 5,
        NONE: 999,
        "getSize": function (width, height, constraintW, constraintH, mode, alignment) {
            if (mode == undefined) {
                mode = this.AUTO_FILL;
            }
            var w = width;
            var h = height;
            if (mode == this.STRETCH) {
                w = constraintW;
                h = constraintH;
            } else {
                if (mode == this.AUTO_WIDTH) {
                    w = constraintW;
                    h = height * constraintW / width;
                } else {
                    if (mode == this.AUTO_HEIGHT) {
                        h = constraintH;
                        w = width * constraintH / height;
                    } else {
                        if (mode == this.AUTO) {
                            if (constraintH > constraintW) {
                                if (width < height) {
                                    h = constraintH;
                                    w = width * constraintH / height;
                                    if (w > constraintW) {
                                        w = constraintW;
                                        h = height * constraintW / width;
                                    }
                                } else {
                                    w = constraintW;
                                    h = height * constraintW / width;
                                    if (h > constraintH) {
                                        h = constraintH;
                                        w = width * constraintH / height;
                                    }
                                }
                            } else {
                                if (width > height) {
                                    w = constraintW;
                                    h = height * constraintW / width;
                                    if (h > constraintH) {
                                        h = constraintH;
                                        w = width * constraintH / height;
                                    }
                                } else {
                                    h = constraintH;
                                    w = width * constraintH / height;
                                    if (w > constraintW) {
                                        w = constraintW;
                                        h = height * constraintW / width;
                                    }
                                }
                            }
                        } else {
                            if (mode == this.AUTO_FILL) {
                                if (constraintH > constraintW) {
                                    h = constraintH;
                                    w = width * constraintH / height;
                                    if (w < constraintW) {
                                        w = constraintW;
                                        h = height * constraintW / width;
                                    }
                                } else {
                                    w = constraintW;
                                    h = height * constraintW / width;
                                    if (h < constraintH) {
                                        h = constraintH;
                                        w = width * constraintH / height;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            var tx = (constraintW - w) / 2;
            var ty = (constraintH - h) / 2;
            switch (alignment) {
            case DC.Alignment.LEFT:
                tx = 0;
                break;
            case DC.Alignment.RIGHT:
                tx = constraintW - w;
                break;
            case DC.Alignment.TOP:
                ty = 0;
                break;
            case DC.Alignment.BOTTOM:
                ty = (constraintH - h);
                break;
            }
            return {
                width: w,
                height: h,
                tx: tx,
                ty: ty
            };
        }
    };
    DC.HCI = {
        DEFAULT_EVENT: function (e) {
            e.preventDefault();
        },
        disableDrag: function () {
            $("body").bind("dragstart", this.DEFAULT_EVENT);
        },
        enableDrag: function () {
            $("body").unbind("dragstart", this.DEFAULT_EVENT);
        },
        disableTouch: function () {
            $(document).bind("touchmove", this.DEFAULT_EVENT);
            $(document).bind("MozTouchMove", this.DEFAULT_EVENT);
        },
        enableTouch: function () {
            $(document).unbind("touchmove");
            $(document).unbind("moztouchmove");
        }
    };
}(window));
(function (window) {
    DC.Event = {
        type: "event",
        target: null,
        init: function (type) {
            this.type = type;
        },
        clone: function () {
            return new Event(this.type);
        },
        toString: function () {
            return "[Event (type=" + this.type + ")]";
        }
    };
    DC.Event = Class.extend(DC.Event);
    DC.EventDispatcher = {
        _listener: null,
        init: function (options) {
            this._listener = [];
            this._super(options);
        },
        IdispatchEvent: function (e) {
            if (e && this._listener[e.type]) {
                for (var i in this._listener[e.type]) {
                    this._listener[e.type][i].call(e.target, e);
                }
            }
        },
        IaddEventListener: function (type, f) {
            this._listener[type] = this._listener[type] || [];
            this._listener[type].push(f);
        },
        IremoveEventListener: function (type, f) {
            if (f && this._listener[type]) {
                for (var i in this._listener[type]) {
                    if (this._listener[type][i] == f) {
                        this._listener[type].splice(i, 0);
                    }
                }
            } else {
                this._listener[type] = null;
                delete this._listener[type];
            }
        }
    };
    DC.EventDispatcher = Interface.extend(DC.EventDispatcher);
    DC.ErrorEvent = {
        error: null,
        init: function (type, error) {
            this._super(type);
            this.error = error;
        }
    };
    DC.ErrorEvent = DC.Event.extend(DC.ErrorEvent);
    $.extend(DC.ErrorEvent, {
        ERROR: "error"
    });
}(window));
(function (window) {
    var XMLParser = {
        parse: null
    };
    DC.XMLParser = Class.extend(XMLParser);
    var DCXMLParser = {
        parse: function (xml, options) {
            if ($(xml).find("items").size() > 0) {
                var result = [];
                $(xml).find("item").each(function () {
                    var node = $(this);
                    var item = {};
                    item["source"] = options.imagePath + node.attr("source");
                    item["thumbnail"] = options.imagePath + node.attr("thumbnail");
                    item["category"] = node.attr("category");
                    $(this).children().each(function () {
                        item[this.nodeName] = $(this).text();
                    });
                    result.push(item);
                });
                return result;
            } else {
                return null;
            }
        }
    };
    DC.DCXMLParser = DC.XMLParser.extend(DCXMLParser);
    var LRXMLParser = {
        parse: function (xml, options) {
            if ($(xml).find("mediaGroup").size() > 0) {
                var result = [];
                $(xml).find("item").each(function () {
                    var item = {};
                    if (DC.System.isIE) {
                        if ($(this).find("description").get(0)) {
                            item.description = $(this).find("description").get(0).text;
                        }
                        if ($(this).find("title").get(0)) {
                            item.title = $(this).find("title").get(0).text;
                        }
                        if ($(this).find("category").get(0)) {
                            item.category = $(this).find("category").get(0).text;
                        }
                    } else {
                        if ($(this).find("description").get(0)) {
                            item.description = $(this).find("description").get(0).textContent;
                        }
                        if ($(this).find("title").get(0)) {
                            item.title = $(this).find("title").get(0).textContent;
                        }
                        if ($(this).find("category").get(0)) {
                            item.category = $(this).find("category").get(0).textContent;
                        }
                    }
                    $(this).find("rendition").each(function () {
                        var node = $(this);
                        var size = node.attr("size");
                        var source = node.attr("src");
                        var w = node.attr("width");
                        var h = node.attr("height");
                        switch (size) {
                        case "small":
                            item.smallSource = imagePath + source;
                            item.smallWidth = w;
                            item.smallHeight = h;
                            break;
                        case "medium":
                            item.mediumSource = imagePath + source;
                            item.mediumWidth = w;
                            item.mediumHeight = h;
                            break;
                        case "large":
                            item.largeSource = imagePath + source;
                            item.largeWidth = w;
                            item.largeHeight = h;
                            break;
                        default:
                            item.thumbSource = imagePath + source;
                            item.thumbWidth = w;
                            item.thumbHeight = h;
                            break;
                        }
                        item.thumbnail = item.thumbSource;
                        item.source = item.largeSource;
                        item.width = w;
                        item.height = h;
                    });
                    result.push(item);
                });
                return result;
            } else {
                return null;
            }
        }
    };
    DC.LRXMLParser = DC.XMLParser.extend(LRXMLParser);
    var PSXMLParser = {
        parse: function (xml, options) {
            if ($(xml).find("gallery").size() > 0) {
                var result = [];
                var thumbpath = imagePath + $(xml).find("thumbnail").attr("base");
                var largepath = imagePath + $(xml).find("large").attr("base");
                $(xml).find("image").each(function () {
                    var item = {};
                    var node = $(this);
                    item.thumbnail = thumbpath + node.attr("thumbnpath");
                    item.source = largepath + node.attr("path");
                    item.width = node.attr("width");
                    item.height = node.attr("height");
                    result.push(item);
                });
                return result;
            } else {
                return null;
            }
        }
    };
    DC.PSXMLParser = DC.XMLParser.extend(PSXMLParser);
}(window));
(function (window) {
    DC.DataSourceEvent = {
        index: -1,
        data: null,
        init: function (type, data, index) {
            this._super(type);
            this.data = data;
            if (index != undefined) {
                this.index = index;
            }
        }
    };
    window.DC.DataSourceEvent = DC.Event.extend(DC.DataSourceEvent);
    $.extend(DC.DataSourceEvent, {
        COMPLETE: "datasource_complete",
        UPDATE: "datasource_update",
        DATA_READY: "data_ready",
        DATA_ADD: "data_add",
        DATA_REMOVE: "data_remove"
    });
    DC.DataSource = {
        source: null,
        relativepath: true,
        data: null,
        loaded: false,
        onError: DC.NOOP,
        onComplete: DC.NOOP,
        onUpdate: DC.NOOP,
        onDataReady: DC.NOOP,
        init: function (options) {
            $.extend(this, options);
            if (this.source) {
                this.load(this.source);
            }
        },
        processData: function () {},
        handleDataLoadComplete: function (data) {
            this.data = data;
            this.loaded = true;
            this.onComplete(new DC.DataSourceEvent(DC.DataSourceEvent.COMPLETE, data));
        },
        length: function () {
            return this.data.length;
        },
        getItemAt: function (index) {
            return this.data ? this.data[index] : null;
        },
        addItem: function (data) {
            if (this.data) {
                this.addItemAt(data, this.data.length);
            }
        },
        addItemAt: function (data, index) {
            if (this.data) {
                if (index >= this.data.length) {
                    this.data.push(data);
                } else {
                    this.data.splice(index, 0, data);
                    index = this.data.length - 1;
                }
                this.onDataUpdate(new DC.DataSourceEvent(DC.DataSourceEvent.DATA_ADD, data, index));
            }
        },
        removeItem: function (data) {
            for (var i in this.data) {
                if (this.data[i] == data) {
                    this.removeItemAt(i);
                }
            }
        },
        removeItemAt: function (index) {
            if (this.data && index >= 0) {
                if (index >= this.data.length) {
                    this.data.pop();
                } else {
                    this.data.splice(index, 1);
                }
                this.onDataUpdate(new DC.DataSourceEvent(DC.DataSourceEvent.DATA_REMOVE, this.data, index));
            }
        },
        load: function (src) {
            this.loaded = false;
            if (src) {
                if ((src.constructor.toString().indexOf("Array") != -1)) {
                    this.handleDataLoadComplete(src);
                }
            }
        }
    };
    window.DC.DataSource = Class.extend(DC.DataSource);
}(window));
(function (window) {
    var XMLDataSource = {
        parsers: [DC.DCXMLParser, DC.LRXMLParser, DC.PSXMLParser],
        parse: function (xml) {
            var result = [];
            var imagePathArray;
            var imagePath = "";
            if (this.relativepath == true) {
                imagePathArray = this.source.split("/");
                imagePathArray.pop();
                if (imagePathArray.length > 0) {
                    imagePath = imagePathArray.join("/") + "/";
                }
            }
            var options = {
                imagePath: imagePath
            };
            for (idx in this.parsers) {
                var parser = new this.parsers[idx];
                result = parser.parse(xml, options);
                if (result) {
                    break;
                }
            }
            return result;
        },
        load: function (src) {
            this._super(src);
            var self = this;
            self.source = src;
            if (src != "" && src != undefined) {
                if ($.isArray(src) || $.isPlainObject(src)) {} else {
                    if ($.browser.msie) {
                        var xdr = false;
                        if (!xdr) {
                            try {
                                xdr = new ActiveXObject("MSXML2.XMLHTTP");
                            } catch (e) {
                                xdr = false;
                            }
                        }
                        if (!xdr) {
                            try {
                                xdr = new ActiveXObject("Microsoft.XMLHTTP");
                            } catch (e) {
                                xdr = false;
                            }
                        }
                        if (!xdr && window.XDomainRequest) {
                            try {
                                xdr = new XDomainRequest();
                            } catch (e) {
                                xdr = false;
                            }
                        }
                        xdr.open("get", src);
                        xdr.onreadystatechange = function () {
                            this.onreadystatechange = null;
                            if (xdr.readyState == 4) {
                                var dom = new ActiveXObject("Microsoft.XMLDOM");
                                dom.async = false;
                                dom.loadXML(xdr.responseText);
                                var results = self.parse(dom);
                                self.handleDataLoadComplete(results);
                            }
                        };
                        xdr.send();
                    } else {
                        $.ajax({
                            url: src,
                            dataType: DC.System.isIE ? "text" : "xml",
                            success: function (data) {
                                this.success = null;
                                var xml;
                                if (typeof data == "string") {
                                    xml = new ActiveXObject("Microsoft.XMLDOM");
                                    xml.async = false;
                                    xml.loadXML(data);
                                } else {
                                    xml = data;
                                }
                                var results = self.parse(xml);
                                self.handleDataLoadComplete(results);
                            }
                        });
                    }
                }
            }
        }
    };
    DC.XMLDataSource = DC.DataSource.extend(XMLDataSource);
}(window));
(function (window) {
    DC.Storage = {
        id: "DEFAULT_STORAGE",
        version: "1.0",
        data: null,
        lastupdate: 0,
        onUpdate: DC.NOOP,
        init: function (options) {
            if (options) {
                $.extend(this, options);
            }
            this.createStorage();
        },
        createStorage: function () {},
        saveStorage: function () {
            this.onUpdate(this);
        },
        set: function (key, data) {
            this.data[key] = data;
            this.saveStorage();
        },
        clean: function (key) {
            delete this.data[key];
            this.data[key] = null;
            this.saveStorage();
        },
        get: function (key) {
            return this.data[key];
        }
    };
    window.DC.Storage = Class.extend(DC.Storage);
    DC.CookieStorage = {
        _getCookie: function (name) {
            if (document.cookie.length > 0) {
                var start = document.cookie.indexOf(name + "=");
                if (start != -1) {
                    start = start + name.length + 1;
                    var end = document.cookie.indexOf(";", start);
                    if (end == -1) {
                        end = document.cookie.length;
                    }
                    return unescape(document.cookie.substring(start, end));
                }
            }
            return "";
        },
        _setCookie: function (name, value, expiredays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toUTCString());
        },
        createStorage: function () {
            var storage = this._getCookie(this.id);
            if (storage != null && storage != "") {
                this.data = window.JSON.parse(storage);
                if (this.data.version == undefined || this.data.version == null || this.data.version != this.version) {
                    this.data = {
                        "version": this.version
                    };
                }
            } else {
                this.data = {
                    "version": this.version
                };
            }
            this._super();
        },
        saveStorage: function () {
            var storage = JSON.stringify(this.data);
            this._setCookie(this.id, storage, 1000);
            this._super();
        }
    };
    window.DC.CookieStorage = DC.Storage.extend(DC.CookieStorage);
}(window));
(function (window) {
    DC.easing = {
        linear: "linear",
        easeInQuad: "ease-in",
        easeOutQuad: "ease-out",
        easeInOutQuad: "ease-in-out",
        easeInCubic: "ease-in",
        easeOutCubic: "ease-out",
        easeInOutCubic: "ease-in-out",
        easeInQuart: "ease-in",
        easeOutQuart: "ease-out",
        easeInOutQuart: "ease-in-out",
        easeInQuint: "ease-in",
        easeOutQuint: "ease-out",
        easeInOutQuint: "ease-in-out",
        easeInSine: "ease-in",
        easeOutSine: "ease-out",
        easeInOutSine: "ease-in-out",
        easeInExpo: "ease-in",
        easeOutExpo: "ease-out",
        easeInOutExpo: "ease-in-out",
        easeInCirc: "ease-in",
        easeOutCirc: "ease-out",
        easeInOutCirc: "ease-in-out",
        easeInElastic: "ease-in",
        easeOutElastic: "ease-out",
        easeInOutElastic: "ease-in-out",
        easeInBack: "ease-in",
        easeOutBack: "cubic-bezier(0, 1, 1, 1)",
        easeInOutBack: "ease-in-out",
        easeInBounce: "ease-in",
        easeOutBounce: "ease-out",
        easeInOutBounce: "ease-in-out"
    };
    DC.transform = {
        enabled: false,
        setTransform: function (target, x, y, t, ease, s, f) {
            var pos = {
                left: x,
                top: y
            };
            if (target.parent) {
                pos.left += target.parent._paddingB.left;
                pos.top += target.parent._paddingB.top;
            }
            if (t > 0) {
                ease = ease || "linear";
                target.ui.animate(pos, t, ease, f);
            } else {
                target.ui.css(pos);
            }
        },
        _setTransform: function (target, x, y, t, ease, s, f) {
            target.ui.css({
                "-webkit-transform-origin": "0 0",
                "-webkit-transition-timing-function": DC.easing[ease],
                "-webkit-transition-duration": t + "s",
                "-webkit-transform": "translate3d(" + x + "px," + y + "px,0) scale(" + s + ")"
            });
        },
        _android_setTransform: function (target, x, y, t, ease, s, f) {
            target.ui.css({
                "-webkit-transform-origin": "0 0",
                "-webkit-transition-timing-function": DC.easing[ease],
                "-webkit-transition-duration": t + "s",
                "-webkit-transform": "translate(" + x + "px," + y + "px) scale(" + s + ")"
            });
        },
        _moz_setTransform: function (target, x, y, t, ease, s, f) {
            target.ui.css({
                "-moz-transform-origin": "0 0",
                "-moz-transition-timing-function": DC.easing[ease],
                "-moz-transition-duration": t + "s",
                "-moz-transform": "translate(" + x + "px," + y + "px) scale(" + s + ")"
            });
        },
        _o_setTransform: function (target, x, y, t, ease, s, f) {
            target.ui.css({
                "-o-transform-origin": "0 0",
                "-o-transition-timing-function": DC.easing[ease],
                "-o-transition-duration": t + "s",
                "-o-transform": "translate(" + x + "px," + y + "px) scale(" + s + ")"
            });
        }
    };
    if ($.browser.webkit) {
        if (DC.System.isAndroid) {
            DC.transform.enabled = true;
            DC.transform.setTransform = DC.transform._android_setTransform;
        } else {
            DC.transform.enabled = true;
            DC.transform.setTransform = DC.transform._setTransform;
        }
    } else {
        if ($.browser.mozilla) {
            DC.transform.enabled = true;
            DC.transform.setTransform = DC.transform._moz_setTransform;
        } else {
            if ($.browser.opera) {
                DC.transform.enabled = true;
                DC.transform.setTransform = DC.transform._o_setTransform;
            }
        }
    }
}(window));
(function (window) {
    DC.UI_ID = 0;
    DC.UI = {
        UID: "ui",
        id: "",
        x: 0,
        y: 0,
        scale: 1,
        width: "",
        height: "",
        defaultWidth: "",
        defaultHeight: "",
        innerWidth: "",
        innerHeight: "",
        visible: true,
        clipping: true,
        styles: "",
        background: false,
        parent: null,
        root: null,
        ui: null,
        enabled: true,
        _padding: null,
        _paddingWithoutBorder: null,
        _background: null,
        init: function (options) {
            $.extend(this, options);
            this._padding = {
                left: 0,
                right: 0,
                top: 0,
                bottom: 0
            };
            this._paddingWithoutBorder = {
                left: 0,
                right: 0,
                top: 0,
                bottom: 0
            };
            this.UID = "ui_" + DC.UI_ID;
            DC.UI_ID++;
            if (options) {
                this.defaultWidth = (options.width == undefined) ? "" : options.width;
                this.defaultHeight = (options.height == undefined) ? "" : options.height;
            }
            this.createChildren();
            this.setClipping(this.clipping);
            this.createComplete();
            this.setSize();
        },
        createChildren: function () {
            this.ui = $('<div class="float"></div>');
            if (this.id != "") {
                this.ui.attr("id", this.id);
            }
            if (this.styles != "") {
                this.ui.addClass(this.styles);
            }
            this.setBackground(this.background);
        },
        createComplete: function () {},
        invalidatelLayout: function (w, h) {
            this.setWidth(this.width);
            this.setHeight(this.height);
        },
        commitSize: function () {
            if (this.ui) {
                if (DC.transform.enabled) {
                    this.ui.width(this.innerWidth);
                    this.ui.height(this.innerHeight);
                } else {
                    this.ui.width(this.innerWidth * this.scale);
                    this.ui.height(this.innerHeight * this.scale);
                }
            }
        },
        setWidth: function (value) {
            if (value == undefined || value == "" || isNaN(value)) {
                if (this.defaultWidth != "") {
                    this.width = this.defaultWidth;
                } else {
                    this.ui.width("");
                    this.width = this.ui.outerWidth();
                }
                this.innerWidth = this.width - this._padding.left - this._padding.right;
            } else {
                this._paddingWithoutBorder.left = DC.num(this.ui.css("padding-left"));
                this._paddingWithoutBorder.right = DC.num(this.ui.css("padding-right"));
                this._padding.left = this._paddingWithoutBorder.left + DC.num(this.ui.css("border-left-width"));
                this._padding.right = this._paddingWithoutBorder.right + DC.num(this.ui.css("border-right-width"));
                this.width = value;
                this.innerWidth = value - this._padding.left - this._padding.right;
            }
        },
        setHeight: function (value) {
            if (value == undefined || value == "" || isNaN(value)) {
                if (this.defaultHeight != "") {
                    this.height = this.defaultHeight;
                } else {
                    this.ui.height("");
                    this.height = this.ui.outerHeight();
                }
                this.innerHeight = this.height - this._padding.top - this._padding.bottom;
            } else {
                this._paddingWithoutBorder.top = DC.num(this.ui.css("padding-top"));
                this._paddingWithoutBorder.bottom = DC.num(this.ui.css("padding-bottom"));
                this._padding.top = this._paddingWithoutBorder.top + DC.num(this.ui.css("border-top-width"));
                this._padding.bottom = this._paddingWithoutBorder.bottom + DC.num(this.ui.css("border-bottom-width"));
                this.height = value;
                this.innerHeight = value - this._padding.top - this._padding.bottom;
            }
        },
        css: function () {
            if (this.ui) {
                this.ui.css(arguments[0], arguments[1]);
            }
        },
        addClass: function (cls) {
            if (this.ui) {
                this.ui.addClass(cls);
            }
        },
        removeClass: function (cls) {
            if (this.ui) {
                this.ui.removeClass(cls);
            }
        },
        attachTo: function (id) {
            log("attach to");
            this.addClass("dc_ui");
            $(id).append(this.ui);
            this.setRoot(this);
            this.setSize();
        },
        setEnabled: function (value) {
            this.enabled = value;
            if (value) {
                this.removeClass("disabled");
            } else {
                this.addClass("disabled");
            }
        },
        setRoot: function (root) {
            this.root = root;
        },
        setVisible: function (value, animate) {
            if (this.visible != value) {
                this.visible = value;
                if (this.ui) {
                    if (animate) {
                        if (this.visible) {
                            this.ui.fadeIn();
                        } else {
                            this.ui.fadeOut();
                        }
                    } else {
                        if (this.visible) {
                            this.ui.show();
                        } else {
                            this.ui.hide();
                        }
                    }
                }
            }
        },
        setSize: function (w, h) {
            if (w != undefined && w != "") {
                this.width = w;
            }
            if (h != undefined && h != "") {
                this.height = h;
            }
            this.invalidatelLayout(w, h);
            if (this.root) {
                this.commitSize();
            }
            if (this._background) {
                this._background.width(this.width);
                this._background.height(this.height);
            }
        },
        setXY: function (x, y, t, ease, f) {
            this.x = x;
            this.y = y;
            DC.transform.setTransform(this, x, y, t, ease, this.scale);
        },
        setScale: function (x, y, s, t, ease, f) {
            this.scale = s;
            this.x = x;
            this.y = y;
            if (!DC.transform.enabled) {
                this.setSize();
            }
            DC.transform.setTransform(this, x, y, t, ease, this.scale);
        },
        setClipping: function (value) {
            if (this.ui) {
                this.clipping = value;
                if (value) {
                    this.ui.addClass("mask");
                } else {
                    this.ui.removeClass("mask");
                }
            }
        },
        setBackground: function (value) {
            if (value) {
                this.background = value;
                this._background = $('<div class="float background"></div');
                this.ui.prepend(this._background);
            } else {
                if (this._background) {
                    this.background = value;
                    this._background.remove();
                    this._background = null;
                }
            }
        }
    };
    DC.UI = Class.extend(DC.UI);
}(window));
(function (window) {
    var ListEvent = {
        index: -1,
        data: null,
        init: function (type, data, index) {
            this._super(type);
            this.data = data;
            this.index = index;
        }
    };
    DC.ListEvent = DC.Event.extend(ListEvent);
    $.extend(DC.ListEvent, {
        SELECT: "list_item_select",
        CLICK: "list_item_click",
        OVER: "list_item_over",
        OUT: "list_item_out"
    });
    var ListController = {
        name: "ListController",
        datasource: null,
        itemRenderer: null,
        _items: null,
        _pool: null,
        init: function (options) {
            $.extend(this, options);
            this._super(options);
            this._items = [];
            this._pool = [];
            new DC.EventDispatcher({
                delegate: this.delegate
            });
            if (this.datasource) {
                this.IsetDataSource(this.datasource);
            }
        },
        handleDataSourceComplete: function (e) {
            this._build(this.datasource);
        },
        handleItemEvent: function (type, i, item) {
            this.delegate.dispatchEvent(new DC.ListEvent(type, item.data, i));
        },
        _build: function (ds) {
            if (this.delegate && this.delegate.build) {
                this.delegate.build(ds);
            }
        },
        destroy: function () {},
        getItem: function (i, data, options) {
            var item = null;
            var self = this;
            if (this._pool.length > 0) {
                item = this._pool.pop();
            } else {
                item = new this.itemRenderer(options);
            } if (DC.System.isTouch) {
                item.ui.hover(function () {
                    DC.HCI.disableDrag();
                    $(this).addClass("over");
                    self.handleItemEvent(DC.ListEvent.OVER, i, item);
                }, function () {
                    DC.HCI.enableDrag();
                    $(this).removeClass("over");
                    self.handleItemEvent(DC.ListEvent.OUT, i, item);
                });
            } else {}
            item.ui.click(function () {
                self.handleItemEvent(DC.ListEvent.CLICK, i, item);
            });
            item.dispatchEvent = function (e) {
                self.delegate.dispatchEvent(e);
            };
            item.setData(data);
            return item;
        },
        removeItem: function (item) {
            item.ui.unbind();
            this._pool.push(item);
        },
        setSelectedItemIndex: function (index) {},
        IsetDataSource: function (ds) {
            if (ds) {
                var self = this;
                this.datasource = ds;
                ds.onDataUpdate = function (e) {
                    if (self.delegate != undefined) {
                        if (e.type == DC.DataSourceEvent.DATA_ADD) {
                            if (self.delegate.handleDataSourceAdd != undefined) {
                                self.delegate.handleDataSourceAdd(e);
                            }
                        } else {
                            if (e.type == DC.DataSourceEvent.DATA_REMOVE) {
                                if (self.delegate.handleDataSourceRemove != undefined) {
                                    self.delegate.handleDataSourceRemove(e);
                                }
                            }
                        }
                    }
                };
                if (ds.loaded) {
                    this._build(ds);
                } else {
                    ds.onComplete = function (e) {
                        self.handleDataSourceComplete(e);
                    };
                }
            }
        }
    };
    DC.ListController = Interface.extend(ListController);
}(window));
(function (window) {
    DC.ScrollController = {
        verticalScrollPolicy: "auto",
        horizontalScrollPolicy: "auto",
        verticalScrollPosition: 0,
        horizontalScrollPosition: 0,
        maxVerticalScrollPosition: 0,
        maxHorizontalScrollPosition: 0,
        boundEnabled: true,
        momentumEnabled: true,
        showScrollBar: "off",
        snap: {
            x: 0,
            y: 0
        },
        bound: false,
        scale: 1,
        minScale: 1,
        maxScale: 1,
        allowScale: false,
        allowScroll: true,
        isGesture: false,
        isLastGesture: false,
        isMove: false,
        isMouseDown: false,
        isOver: false,
        _hscroll: "auto",
        _vscroll: "auto",
        _hscrollbar: null,
        _vscrollbar: null,
        _containerWidth: 0,
        _containerHeight: 0,
        _contentWidth: 0,
        _contentHeight: 0,
        _last: null,
        _speed: null,
        _lastPointerPosition: null,
        _lastPointerMiddlePosition: null,
        _lastOffsetPosition: null,
        _tempOffsetPosition: null,
        _currentOffsetPosition: null,
        _targetOffsetPosition: null,
        _lastScrollPosiiton: 0,
        _timer: -1,
        onScroll: DC.NOOP,
        handleMouseOver: function (e) {
            this.isOver = true;
            this._showScrollbar();
        },
        handleMouseOut: function (e) {
            this.isOver = false;
            if (this.showScrollBar == "auto") {
                this._hideScrollbarLater();
            }
        },
        handleMouseDown: function (e) {
            var self = this;
            if (!this.allowScroll) {
                return;
            }
            DC.HCI.disableDrag();
            this._showScrollbar();
            $("body").bind("mouseup", function (e) {
                DC.HCI.enableDrag();
                self.target.ui.unbind("mousemove");
                self.handleMouseUp(e);
            });
            this.isMouseDown = true;
            this.isMove = false;
            this._startScroll();
            this._lastPointerPosition.x = e.pageX;
            this._lastPointerPosition.y = e.pageY;
        },
        handleMouseUp: function (e) {
            $("body").unbind("mouseup");
            if (!this.allowScroll) {
                return;
            }
            this._endScroll();
            this.isMouseDown = false;
        },
        handleMouseMove: function (e) {
            if (this.isMouseDown) {
                this._pointerMove(e.pageX, e.pageY);
            }
        },
        handleTouchStart: function (e) {
            if (!this.isGesture) {
                this.isMove = false;
                DC.HCI.disableTouch();
                this._showScrollbar();
                this._startScroll();
                this._lastPointerPosition.x = e.originalEvent.targetTouches[0].clientX;
                this._lastPointerPosition.y = e.originalEvent.targetTouches[0].clientY;
                if (e.originalEvent.targetTouches.length == 1) {
                    this._lastPointerMiddlePosition.x = this._lastPointerPosition.x;
                    this._lastPointerMiddlePosition.y = this._lastPointerPosition.y;
                } else {
                    this._lastPointerMiddlePosition.x = (this._lastPointerPosition.x + e.originalEvent.targetTouches[1].clientX) / 2;
                    this._lastPointerMiddlePosition.y = (this._lastPointerPosition.y + e.originalEvent.targetTouches[1].clientY) / 2;
                }
            }
        },
        handleGestureStart: function (e) {
            this.isGesture = true;
            this.isLastGesture = false;
        },
        handleTouchMove: function (e) {
            if (!this.isGesture) {
                this._pointerMove(e.originalEvent.targetTouches[0].clientX, e.originalEvent.targetTouches[0].clientY);
            }
        },
        handleGestureChange: function (e) {
            this.isGesture = true;
            this.allowScroll = false;
            if (this.allowScale) {
                this._hscroll = this._vscroll = "auto";
                var s = e.originalEvent.scale * this.scale;
                var xx = (this._lastPointerMiddlePosition.x - this._targetOffsetPosition.x);
                var yy = (this._lastPointerMiddlePosition.y - this._targetOffsetPosition.y);
                var x = xx - (xx - this._currentOffsetPosition.x) * s / this.scale;
                var y = yy - (yy - this._currentOffsetPosition.y) * s / this.scale;
                this.scrollTo(x, y, 0, s);
            }
        },
        handleGestureEnd: function (e) {
            if (this.allowScale) {
                this._updateScale(e.originalEvent.scale * this.scale);
            }
            this._speed.x = this._speed.y = 0;
            this.isLastGesture = true;
        },
        handleTouchEnd: function (e) {
            if (this.isLastGesture) {
                this.isLastGesture = false;
            } else {
                this.isGesture = false;
                this.allowScroll = true;
            } if (this.showScrollBar == "auto") {
                this._hideScrollbarLater();
            }
            DC.HCI.enableTouch();
            this._endScroll();
        },
        _allowScroll: function (value) {
            this.allowScroll = value;
        },
        _showScrollbar: function () {
            if (this.showScrollBar == "auto") {
                if (this._timer) {
                    clearTimeout(this._timer);
                }
                if (this._vscroll != "off" && this._vscrollbar) {
                    this._vscrollbar.setVisible(true, true);
                }
                if (this._hscroll != "off" && this._hscrollbar) {
                    this._hscrollbar.setVisible(true, true);
                }
            }
        },
        _hideScrollbarLater: function () {
            var self = this;
            if (this._timer) {
                clearTimeout(this._timer);
            }
            this._timer = setTimeout(function () {
                if (self._vscrollbar) {
                    self._vscrollbar.setVisible(false, true);
                }
                if (self._hscrollbar) {
                    self._hscrollbar.setVisible(false, true);
                }
            }, 1000);
        },
        _startScroll: function () {
            this.bound = false;
            this._currentOffsetPosition.x = this._tempOffsetPosition.x = this._lastOffsetPosition.x;
            this._currentOffsetPosition.y = this._tempOffsetPosition.y = this._lastOffsetPosition.y;
            var offset = this.target.ui.offset();
            this._targetOffsetPosition.x = offset.left;
            this._targetOffsetPosition.y = offset.top;
        },
        _endScroll: function () {
            var x = this._lastOffsetPosition.x;
            var y = this._lastOffsetPosition.y;
            var t = 0.3;
            var cx = Math.abs(this._speed.x);
            var cy = Math.abs(this._speed.y);
            if (cx > 20) {
                x = x + cx * this._speed.x / 5;
                t *= cx / 10;
            }
            if (cy > 20) {
                y = y + cy * this._speed.y / 5;
                t *= cy / 10;
            }
            if (this.snap.x > 5) {
                x = Math.round(x / this.snap.x) * this.snap.x;
            }
            if (this.snap.y > 5) {
                y = Math.round(y / this.snap.y) * this.snap.y;
            }
            if (x > 0) {
                x = 0;
                this.bound = true;
                t = 0.3;
            } else {
                if (x < -this.maxHorizontalScrollPosition) {
                    x = -this.maxHorizontalScrollPosition;
                    this.bound = true;
                    t = 0.3;
                }
            } if (y > 0) {
                y = 0;
                this.bound = true;
            } else {
                if (y < -this.maxVerticalScrollPosition) {
                    y = -this.maxVerticalScrollPosition;
                    this.bound = true;
                }
            }
            this.scrollTo(x, y, t);
        },
        _pointerMove: function (x, y) {
            var tx = x - this._lastPointerPosition.x;
            var ty = y - this._lastPointerPosition.y;
            if (tx > 5 || ty > 5) {
                this.isMove = true;
            }
            this._speed.x = x - this._last.x;
            this._speed.y = y - this._last.y;
            this._last.x = x;
            this._last.y = y;
            this._currentOffsetPosition.x = this._tempOffsetPosition.x + tx;
            this._currentOffsetPosition.y = this._tempOffsetPosition.y + ty;
            this.scrollTo(this._tempOffsetPosition.x + tx, this._tempOffsetPosition.y + ty, 0.02);
        },
        _addEvents: function (target) {
            if (target) {
                var self = this;
                if (DC.System.isTouch) {
                    target.ui.bind({
                        touchstart: function (e) {
                            DC.HCI.disableTouch();
                            self.handleTouchStart(e);
                        },
                        touchmove: function (e) {
                            self.handleTouchMove(e);
                        },
                        touchend: function (e) {
                            DC.HCI.enableTouch();
                            self.handleTouchEnd(e);
                        },
                        gesturestart: function (e) {
                            self.handleGestureStart(e);
                        },
                        gesturechange: function (e) {
                            self.handleGestureChange(e);
                        },
                        gestureend: function (e) {
                            self.handleGestureEnd(e);
                        }
                    });
                } else {
                    target.ui.bind("mousedown", function (e) {
                        self.handleMouseDown(e);
                        if (self.allowScroll) {
                            target.ui.bind("mousemove", function (e) {
                                self.handleMouseMove(e);
                            });
                        }
                    });
                    target.ui.bind("mouseover", function (e) {
                        if (!self.isOver) {
                            self.handleMouseOver(e);
                        }
                    });
                    target.ui.bind("mouseout", function (e) {
                        var offset = target.ui.offset();
                        if (e.pageX < offset.left || e.pageX > offset.left + target.width || e.pageY < offset.top || e.pageY > offset.top + target.height) {
                            self.handleMouseOut(e);
                        }
                    });
                }
            }
        },
        _removeEvents: function (target) {
            if (DC.System.isTouch) {
                target.ui.unbind("touchstart");
                target.ui.unbind("touchmove");
                target.ui.unbind("touchend");
                target.ui.unbind("gesturestart");
                target.ui.unbind("gesturechange");
                target.ui.unbind("gestureend");
            } else {
                target.ui.unbind("mousedown");
                target.ui.unbind("mouseover");
                target.ui.unbind("mouseout");
            }
        },
        _updateScrollBar: function (containerW, containerH, contentW, contentH) {
            var self = this;
            this.maxHorizontalScrollPosition = contentW - containerW;
            this.maxVerticalScrollPosition = contentH - containerH;
            var sw = DC.System.isTouch ? 5 : 15;
            if (this.maxHorizontalScrollPosition <= 0) {
                this.maxHorizontalScrollPosition = 0;
                if (this._hscrollbar) {
                    this._hscrollbar.setVisible(false);
                }
            } else {
                if (this.showScrollBar != "off") {
                    if (this._hscrollbar == null) {
                        this._hscrollbar = new DC.BaseScrollbar({
                            onMouseOver: function () {
                                self._allowScroll(false);
                            },
                            onMouseOut: function () {
                                self._allowScroll(true);
                            },
                            onScroll: function (value) {
                                self.scrollTo(-self.maxHorizontalScrollPosition * value, -self.verticalScrollPosition, Math.abs(self._lastScrollPosiiton - value) * 6);
                                self._lastScrollPosiiton = value;
                            }
                        });
                        this.target.addChild(this._hscrollbar);
                    }
                    this._hscrollbar.setVertical(false);
                    this._hscrollbar.contentPercentage = containerW / contentW;
                    this._hscrollbar.setXY(2, containerH - sw - 2);
                    this._hscrollbar.setSize(containerW - sw - 10, sw);
                    this._showScrollbar();
                }
            } if (this.maxVerticalScrollPosition <= 0) {
                this.maxVerticalScrollPosition = 0;
                if (this._vscrollbar) {
                    this._vscrollbar.setVisible(false);
                }
            } else {
                if (this.showScrollBar != "off") {
                    if (this._vscrollbar == null) {
                        this._vscrollbar = new DC.BaseScrollbar({
                            onMouseOver: function () {
                                self._allowScroll(false);
                            },
                            onMouseOut: function () {
                                self._allowScroll(true);
                            },
                            onScroll: function (value) {
                                self.scrollTo(-self.horizontalScrollPosition, -self.maxVerticalScrollPosition * value, Math.abs(self._lastScrollPosiiton - value) * 6);
                                self._lastScrollPosiiton = value;
                            }
                        });
                        this.target.addChild(this._vscrollbar);
                    }
                    this._vscrollbar.setVertical(true);
                    this._vscrollbar.contentPercentage = containerH / contentH;
                    this._vscrollbar.setXY(containerW - sw - 2, 2);
                    this._vscrollbar.setSize(sw, containerH - sw - 10);
                    this._showScrollbar();
                }
            }
            this._hscroll = (this.maxHorizontalScrollPosition == 0) ? "off" : this.horizontalScrollPolicy;
            this._vscroll = (this.maxVerticalScrollPosition == 0) ? "off" : this.verticalScrollPolicy;
        },
        _updateScale: function (s) {
            this.scale = s;
            if (this.scale > this.maxScale) {
                this.scale = this.maxScale;
            } else {
                if (this.scale < this.minScale) {
                    this.scale = this.minScale;
                }
            }
            this._updateScrollBar(this._containerWidth, this._containerHeight, this._contentWidth * this.scale, this._contentHeight * this.scale);
        },
        init: function (options) {
            $.extend(this, options);
            this._super(options);
            this.setTarget(options.target);
        },
        updateRectangle: function (containerW, containerH, contentW, contentH) {
            var self = this;
            this._containerWidth = containerW;
            this._containerHeight = containerH;
            this._contentWidth = contentW;
            this._contentHeight = contentH;
            this._updateScrollBar(containerW, containerH, contentW, contentH);
            this.scrollTo(0, 0);
        },
        scrollTo: function (x, y, t, s) {
            if (this.horizontalScrollPosition != x || this.verticalScrollPosition != y || s != this.scale) {
                if (this._vscroll == "off") {
                    y = 0;
                }
                if (this._hscroll == "off") {
                    x = 0;
                }
                s = (s == undefined) ? this.scale : s;
                this.horizontalScrollPosition = -x;
                this.verticalScrollPosition = -y;
                this._lastOffsetPosition.x = x;
                this._lastOffsetPosition.y = y;
                if (this._vscrollbar) {
                    this._vscrollbar.setValue(this.verticalScrollPosition / this.maxVerticalScrollPosition);
                }
                if (this._hscrollbar) {
                    this._hscrollbar.setValue(this.horizontalScrollPosition / this.maxHorizontalScrollPosition);
                }
                this.onScroll(x, y, s, t);
            }
        },
        scaleTo: function (s, t) {
            if (s) {
                var lastScale = this.scale;
                this._updateScale(s);
                var x = this._containerWidth / 2 - (this._containerWidth / 2 + this.horizontalScrollPosition) * this.scale / lastScale;
                var y = this._containerHeight / 2 - (this._containerHeight / 2 + this.verticalScrollPosition) * this.scale / lastScale;
                if (x > 0) {
                    x = 0;
                    this.bound = true;
                } else {
                    if (x < -this.maxHorizontalScrollPosition) {
                        x = -this.maxHorizontalScrollPosition;
                        this.bound = true;
                    }
                } if (y > 0) {
                    y = 0;
                    this.bound = true;
                } else {
                    if (y < -this.maxVerticalScrollPosition) {
                        y = -this.maxVerticalScrollPosition;
                        this.bound = true;
                    }
                }
                this.scrollTo(x, y, t);
            }
        },
        setTarget: function (value) {
            this._last = {
                x: 0,
                y: 0
            };
            this._speed = {
                x: 0,
                y: 0
            };
            this._lastPointerMiddlePosition = {
                x: 0,
                y: 0
            };
            this._lastPointerPosition = {
                x: 0,
                y: 0
            };
            this._lastOffsetPosition = {
                x: 0,
                y: 0
            };
            this._tempOffsetPosition = {
                x: 0,
                y: 0
            };
            this._currentOffsetPosition = {
                x: 0,
                y: 0
            };
            this._targetOffsetPosition = {
                x: 0,
                y: 0
            };
            if (value) {
                this.target.setXY(0, 0);
                this.target = value;
                this._addEvents(this.target);
            } else {
                if (this.target) {
                    this._removeEvents(this.target);
                    this.target = null;
                }
            }
        }
    };
    window.DC.ScrollController = Interface.extend(DC.ScrollController);
}(window));
(function (window) {
    DC.AbstractLayout = {
        target: null,
        gap: 3,
        width: "",
        height: "",
        needPreprocess: false,
        sizes: null,
        count: 0,
        init: function (options) {
            $.extend(this, options);
        },
        layout: function (children) {
            var c = null;
            var size;
            this.count = children.length;
            this.sizes = {};
            this.reset();
            for (var i in children) {
                c = children[i];
                size = this.getSize(c);
                this.sizes[c.UID] = size;
            }
            if (this.needPreprocess) {
                this.preprocess(children);
            }
            for (var k in children) {
                c = children[k];
                size = this.sizes[c.UID];
                c.setSize(size.width, size.height);
                var pos = this.getPosition(c, children);
                c.setXY(pos.x, pos.y);
            }
            return this.getLayoutSize();
        },
        getPosition: function (c, children) {
            return null;
        },
        getSize: function (c) {
            return null;
        },
        getLayoutSize: function () {
            return null;
        },
        reset: function () {},
        preprocess: function () {}
    };
    window.DC.AbstractLayout = Class.extend(DC.AbstractLayout);
    DC.BoxLayout = {
        vertical: false,
        _maxW: 0,
        _maxH: 0,
        _avg: 0,
        _avgCount: 0,
        _avgTotal: 0,
        reset: function () {
            this._avg = 0;
            this._avgCount = 0;
            this._avgTotal = 0;
        },
        preprocess: function (children) {
            if (this.count - this._avgCount > 0) {
                var ss = (this.width - this._avgTotal) / (this.count - this._avgCount) - this.gap * 2;
                for (var i in children) {
                    c = children[i];
                    size = this.sizes[c.UID];
                    if (!this.vertical && c.defaultWidth == "") {
                        size.width = ss;
                    } else {
                        if (this.vertical && c.defaultHeight == "") {
                            size.height = ss;
                        }
                    }
                }
            }
        },
        getSize: function (c) {
            var s = this.vertical ? c.ui.outerHeight() : c.ui.outerWidth();
            var ss = {
                width: 0,
                height: 0
            };
            if (c.visible) {
                if (this.vertical) {
                    ss.width = (this.width == "") ? c.width : this.width;
                    ss.height = (c.defaultHeight == "") ? s : c.defaultHeight;
                    if (c.defaultHeight != "") {
                        this._avgTotal += ss.height;
                        this._avgCount++;
                    }
                } else {
                    ss.width = (c.defaultWidth == "") ? s : c.defaultWidth;
                    ss.height = (this.height == "") ? c.height : this.height;
                    this._max = (this._max > ss.height) ? this._max : ss.height;
                    if (c.defaultWidth != "") {
                        this._avgTotal += ss.width;
                        this._avgCount++;
                    }
                } if (ss.width == 0) {
                    ss.width = c.ui.outerWidth();
                }
                if (ss.height == 0) {
                    ss.height = c.ui.outerHeight();
                }
                this._maxW = (this._maxW > ss.width) ? this._maxW : ss.width;
                this._maxH = (this._maxH > ss.height) ? this._maxH : ss.height;
            }
            return ss;
        },
        getPosition: function (c, children) {
            var pos = 0;
            if (this.vertical) {
                for (var i in children) {
                    var cc = children[i];
                    if (cc == c) {
                        break;
                    } else {
                        if (cc.visible) {
                            pos += cc.height + this.gap;
                        }
                    }
                }
                return {
                    x: 0,
                    y: pos
                };
            } else {
                for (var k in children) {
                    var cd = children[k];
                    if (cd == c) {
                        break;
                    } else {
                        if (cd.visible) {
                            pos += cd.width + this.gap;
                        }
                    }
                }
                return {
                    x: pos,
                    y: 0
                };
            }
        },
        getLayoutSize: function () {
            var sizes = {
                width: 0,
                height: 0
            };
            for (var i in this.sizes) {
                var size = this.sizes[i];
                if (this.vertical && size.height) {
                    sizes.height += size.height + this.gap;
                }
                if (!this.vertical && size.width) {
                    sizes.width += size.width + this.gap;
                }
            }
            if (this.width == "") {
                sizes.width = this._maxW;
            }
            if (sizes.width == 0) {
                sizes.width = this.width;
            }
            if (this.height == "") {
                sizes.height = this._maxH;
            }
            if (sizes.height == 0) {
                sizes.height = this.height;
            }
            return sizes;
        }
    };
    window.DC.BoxLayout = DC.AbstractLayout.extend(DC.BoxLayout);
    DC.GridLayout = {
        rowCount: 0,
        columnCount: 0,
        rowHeight: 30,
        columnWidth: 30,
        direction: 0,
        getSize: function (c) {
            return {
                width: this.columnWidth,
                height: this.rowHeight
            };
        },
        getPosition: function (c, children) {
            var i = c.INDEX;
            var u = 0;
            var v = 0;
            var c = (this.columnCount == 0 && this.rowCount != 0) ? Math.ceil(children.length / this.rowCount) : this.columnCount;
            u = i % c;
            v = Math.floor(i / c);
            return {
                x: u * (this.columnWidth + this.gap),
                y: v * (this.rowHeight + this.gap)
            };
        },
        getLayoutSize: function () {
            var w = 0;
            var h = 0;
            if (this.columnCount == 0 && this.rowCount != 0) {
                var c = Math.ceil(this.count / this.rowCount);
                w = c * (this.columnWidth + this.gap);
                h = this.rowCount * (this.rowHeight + this.gap);
            } else {
                if (this.rowCount == 0 && this.columnCount != 0) {
                    w = this.columnCount * (this.columnWidth + this.gap);
                    h = Math.ceil(this.count / this.columnCount) * (this.rowHeight + this.gap);
                } else {
                    w = this.columnCount * (this.columnWidth + this.gap);
                    h = this.rowCount * (this.rowHeight + this.gap);
                }
            }
            return {
                width: w,
                height: h
            };
        }
    };
    window.DC.GridLayout = DC.AbstractLayout.extend(DC.GridLayout);
}(window));
(function (window) {
    DC.Container = {
        children: null,
        container: null,
        layout: null,
        _layout: null,
        _childrenIndex: null,
        createChildren: function () {
            this._super();
            this.children = [];
            this._childrenIndex = {};
            this.container = this.ui;
            if (this.layout) {
                this._layout = new this.layout({
                    target: this
                });
            }
        },
        invalidatelLayout: function (w, h) {
            this._super(w, h);
            if (this.layout) {
                this._layout.width = this.innerWidth;
                this._layout.height = this.innerHeight;
                var sizes = this._layout.layout(this.children);
                if (sizes) {
                    this.innerHeight = sizes.height;
                    this.height = sizes.height + this._padding.bottom + this._padding.top;
                    this.innerWidth = sizes.width;
                    this.width = sizes.width + this._padding.right + this._padding.left;
                }
            }
        },
        setRoot: function (root) {
            this._super(root);
            for (var i in this.children) {
                this.children[i].setRoot(root);
            }
        },
        _updateIndex: function () {
            for (var i in this.children) {
                this.children[i].INDEX = i;
            }
        },
        addChild: function (child, updatelater) {
            this.addChildAt(child, this.children.length, updatelater);
        },
        removeChild: function (child) {
            for (var i in this.children) {
                if (this.children[i] == child) {
                    this.removeChildAt(i);
                }
            }
        },
        addChildAt: function (child, index, updatelater) {
            if (child && child.ui) {
                if (this._childrenIndex[child.UID]) {} else {
                    this._childrenIndex[child.UID] = true;
                    child.setRoot(this.root);
                    child.parent = this;
                    if (index >= this.children.length) {
                        this.children.push(child);
                    } else {
                        this.children.splice(index, 0, child);
                    }
                    this.container.append(child.ui);
                    this._updateIndex();
                    if (updatelater) {
                        updatelater;
                    } else {
                        if (this.root) {
                            this.root.setSize();
                        }
                    }
                }
            }
        },
        removeChildAt: function (index) {
            if (index >= 0 && index < this.children.length) {
                var child = this.children[index];
                if (this._childrenIndex[child.UID]) {
                    child.setRoot(null);
                    child.parent = null;
                    if (index >= this.children.length) {
                        this.children.pop();
                    } else {
                        this.children.splice(index, 1);
                    }
                    child.ui.detach();
                    this._updateIndex();
                    delete this._childrenIndex[child.UID];
                    if (this.root) {
                        this.root.setSize();
                    }
                    return child;
                } else {
                    return null;
                }
            }
        },
        removeAllChildren: function () {
            for (var i in this.children) {
                this.children[i].ui.detach();
            }
            this.children = [];
            this._childrenIndex = {};
        }
    };
    window.DC.Container = DC.UI.extend(DC.Container);
    DC.Box = {
        gap: 4,
        createChildren: function () {
            this.layout = DC.BoxLayout;
            this._super();
        },
        invalidatelLayout: function (w, h) {
            this._super(w, h);
            if (this.layout) {
                this._layout.vertical = this.vertical;
                this._layout.gap = this.gap;
            }
        }
    };
    window.DC.Box = DC.Container.extend(DC.Box);
    DC.VBox = {
        createChildren: function () {
            this.vertical = true;
            this._super();
        }
    };
    window.DC.VBox = DC.Box.extend(DC.VBox);
    DC.HBox = {
        createChildren: function () {
            this.vertical = false;
            this._super();
        }
    };
    window.DC.HBox = DC.Box.extend(DC.HBox);
    DC.Tile = {
        gap: 4,
        createChildren: function () {
            this.layout = DC.GridLayout;
            this._super();
        },
        invalidatelLayout: function (w, h) {
            this._super(w, h);
            if (this.layout) {
                this._layout.gap = this.gap;
            }
        }
    };
    window.DC.Tile = DC.Container.extend(DC.Tile);
    DC.ListBase = {
        contentClass: DC.Box,
        itemRenderer: null,
        itemRendererOptions: null,
        datasource: null,
        gap: 0,
        _listController: null,
        _contentContainer: null,
        createChildren: function () {
            this._super();
            var self = this;
            new DC.EventDispatcher({
                delegate: this
            });
            this._contentContainer = new this.contentClass({
                itemRenderer: this.itemRenderer,
                gap: this.gap
            });
            this.addChild(this._contentContainer);
            this._listController = new DC.ListController({
                datasource: this.datasource,
                delegate: this,
                itemRenderer: this.itemRenderer,
                itemRendererOptions: this.itemRendererOptions
            });
        },
        setSize: function (w, h) {
            this._super(w, h);
            if (this._contentContainer) {
                this._contentContainer.setSize();
            }
        },
        build: function (ds) {
            this._contentContainer.removeAllChildren();
            for (var i in ds.data) {
                this._contentContainer.addChild(this._listController.getItem(i, ds.getItemAt(i), this.itemRendererOptions), true);
            }
            this.setSize();
        },
        handleDataSourceAdd: function (e) {
            this._contentContainer.addChild(this._listController.getItem(e.index, e.data, this.itemRendererOptions));
        },
        handleDataSourceRemove: function (e) {
            var item = this._contentContainer.removeChildAt(e.index);
            this._listController.removeItem(item);
        }
    };
    window.DC.ListBase = DC.Container.extend(window.DC.ListBase);
    DC.ScrollListBase = {
        _scrollController: null,
        createChildren: function () {
            this._super();
            var self = this;
            this._scrollController = new DC.ScrollController({
                delegate: this,
                target: this,
                onScroll: function (x, y, s, t) {
                    if (t > 0.02) {
                        if (self._scrollController.bound) {
                            self._contentContainer.setScale(x, y, s, t, "easeOutBack");
                        } else {
                            self._contentContainer.setScale(x, y, s, t, "easeOutQuad");
                        }
                    } else {
                        self._contentContainer.setScale(x, y, s, 0);
                    }
                }
            });
        },
        setSize: function (w, h) {
            this._super(w, h);
            this._scrollController.updateRectangle(this.innerWidth, this.innerHeight, this._contentContainer.width, this._contentContainer.height);
        }
    };
    window.DC.ScrollListBase = DC.ListBase.extend(window.DC.ScrollListBase);
}(window));
(function (window) {
    DC.BaseScrollbar = {
        vertical: false,
        value: 0,
        contentPercentage: 0.5,
        _handler: null,
        _isMouseDownHandler: false,
        _currentPosition: {
            x: 0,
            y: 0
        },
        _mouseDownPosition: {
            x: 0,
            y: 0
        },
        _maxPosition: 0,
        _handlerSize: 20,
        onMouseDown: DC.NOOP,
        onMouseUp: DC.NOOP,
        onMouseOver: DC.NOOP,
        onMouseOut: DC.NOOP,
        onScroll: DC.NOOP,
        createChildren: function () {
            this._currentPosition = {
                x: 0,
                y: 0
            };
            this._mouseDownPosition = {
                x: 0,
                y: 0
            };
            this.background = true;
            this._super();
            this.addClass("scrollbar");
            this._handler = new DC.UI({
                styles: "handler"
            });
            DC.synthesize("vertical", this);
            DC.synthesize("value", this);
            DC.synthesize("contentPercentage", this);
            this.setVertical(this.vertical);
            this.setValue(this.value);
            this.setContentPercentage(this.contentPercentage);
        },
        createComplete: function () {
            this._super();
            var self = this;
            this.addChild(this._handler);
            this._handler.ui.mouseover(function (e) {
                self.onMouseOver(e);
            });
            this._handler.ui.mouseout(function (e) {
                self.onMouseOut(e);
            });
            this._handler.ui.mousedown(function (e) {
                self._isMouseDownHandler = true;
                self._mouseDownPosition.x = e.pageX;
                self._mouseDownPosition.y = e.pageY;
                self._currentPosition.x = self._handler.x;
                self._currentPosition.y = self._handler.y;
                self.handleMouseDown(e);
            });
            this._background.mousedown(function (e) {
                if (self.vertical) {
                    self.setValue((e.pageY - offset.top) / self._background.height());
                } else {
                    self.setValue((e.pageX - offset.left) / self._background.width());
                }
                self.onScroll(self.value);
            });
        },
        commitSize: function () {
            this._super();
            if (this.vertical) {
                this._handlerSize = this.height * this.contentPercentage;
                this._maxPosition = this.height - this._handlerSize;
                this._handler.setSize(this.width, this._handlerSize);
            } else {
                this._handlerSize = this.width * this.contentPercentage;
                this._maxPosition = this.width - this._handlerSize;
                this._handler.setSize(this._handlerSize, this.height);
            }
        },
        commitProperties: function (prop, value) {
            switch (prop) {
            case "vertical":
                if (value) {
                    this.handleMouseMove = this.handleMouseMoveY;
                } else {
                    this.handleMouseMove = this.handleMouseMoveX;
                }
                break;
            case "value":
                if (this.vertical) {
                    this._handler.setXY(0, value * this._maxPosition);
                } else {
                    this._handler.setXY(value * this._maxPosition, 0);
                }
                break;
            case "contentPercentage":
                this.commitSize();
                break;
            }
        },
        handleMouseDown: function (e) {
            var self = this;
            self.onMouseDown(e);
            $("body").mousemove(function (e) {
                self.handleMouseMove(e);
            });
            $("body").mouseup(function (e) {
                self._mouseDownPosition.y = 0;
                self._mouseDownPosition.x = 0;
                self.onMouseUp(e);
                self._isMouseDownHandler = false;
                $("body").unbind("mouseup");
                $("body").unbind("mousemove");
            });
        },
        handleMouseMoveX: function (e) {
            var pos = this._currentPosition.x - (this._mouseDownPosition.x - e.pageX);
            if (pos < 0) {
                pos = 0;
            }
            if (pos > this._maxPosition) {
                pos = this._maxPosition;
            }
            this._handler.setXY(pos, 0);
            this.handleValueChange(pos / this._maxPosition);
        },
        handleMouseMoveY: function (e) {
            var pos = this._currentPosition.y - (this._mouseDownPosition.y - e.pageY);
            if (pos < 0) {
                pos = 0;
            }
            if (pos > this._maxPosition) {
                pos = this._maxPosition;
            }
            this._handler.setXY(0, pos);
            this.handleValueChange(pos / this._maxPosition);
        },
        handleMouseMove: this.handleMouseMoveY,
        handleValueChange: function (val) {
            if (val != this.value) {
                this.value = val;
                this.onScroll(val);
            }
        }
    };
    window.DC.BaseScrollbar = DC.Container.extend(DC.BaseScrollbar);
}(window));
(function (window) {
    DC.DataRenderer = {
        data: [],
        createChildren: function () {
            this._super();
            this.addClass("renderer");
            DC.synthesize("data", this);
        }
    };
    window.DC.DataRenderer = DC.Container.extend(DC.DataRenderer);
    DC.ThumbnailRenderer = {
        align: DC.Alignment.CENTER,
        resizeMode: DC.Size.AUTO_FILL,
        sourceLabel: "source",
        thumb: null,
        createChildren: function () {
            this._super();
            this.addClass("thumbnail");
            this.thumb = new DC.Image({
                resizeMode: this.resizeMode,
                alignment: this.align
            });
        },
        createComplete: function () {
            this._super();
            this.addChild(this.thumb);
        },
        setSize: function (w, h) {
            this._super(w, h);
            this.thumb.setSize(this.width, this.height);
        },
        commitProperties: function (prop, value) {
            switch (prop) {
            case "data":
                this.thumb.setSource(this.data[this.sourceLabel]);
                break;
            }
        }
    };
    window.DC.ThumbnailRenderer = DC.DataRenderer.extend(DC.ThumbnailRenderer);
}(window));
(function (window) {
    DC.Image = {
        source: null,
        resizeMode: DC.Size.AUTO_FILL,
        alignment: DC.Alignment.CENTER,
        _img: null,
        _imgWidth: 0,
        _imgHeight: 0,
        _imgContainer: null,
        onLoad: DC.NOOP,
        createComplete: function () {
            this.addClass("image");
            this._super();
            if (this.source) {
                this._load(this.source);
            }
        },
        commitSize: function () {
            this._super();
            if (this._img) {
                var size = DC.Size.getSize(this._imageWidth, this._imageHeight, this.width, this.height, this.resizeMode, this.alignment);
                if (DC.transform.enabled) {
                    this._img.width(size.width);
                    this._img.height(size.height);
                    this._img.css({
                        "margin-left": size.tx,
                        "margin-top": size.ty
                    });
                } else {
                    this._img.width(size.width * this.scale);
                    this._img.height(size.height * this.scale);
                    this._img.css({
                        "margin-left": size.tx * this.scale,
                        "margin-top": size.ty * this.scale
                    });
                }
            }
        },
        handleImageLoad: function (img) {
            this._imageWidth = img.width;
            this._imageHeight = img.height;
            this.removeClass("loading");
            this.ui.append(img);
            this.commitSize();
        },
        _load: function (src) {
            var self = this;
            if (this.img) {
                this._img.detach();
            } else {
                this._img = $('<img class="float"/>');
            }
            this._img.load(function () {
                this.load = null;
                self.handleImageLoad(this);
            });
            this.addClass("loading");
            this._img.attr("src", "");
            this._img.attr("src", src);
        },
        setSource: function (src) {
            if (src) {
                this.source = src;
                this._load(src);
            }
        }
    };
    window.DC.Image = DC.UI.extend(DC.Image);
}(window));
(function (window) {
    DC.Text = {
        text: "label",
        _container: null,
        createChildren: function () {
            this._super();
            this.addClass("text");
            this._container = $("<p></p>");
        },
        createComplete: function () {
            this._super();
            this.ui.append(this._container);
            this.setText(this.text);
        },
        upateText: function (txt) {
            this._container.empty();
            this._container.append(txt);
            this.width = "";
            this.setSize();
        },
        setText: function (txt) {
            if (txt) {
                this.text = txt;
            }
            this.upateText(this.text);
        }
    };
    window.DC.Text = DC.UI.extend(DC.Text);
}(window));
(function (window) {
    DC.Button = {
        icon: null,
        _icon: null,
        onClick: DC.NOOP,
        onOver: DC.NOOP,
        onOut: DC.NOOP,
        onDown: DC.NOOP,
        onUp: DC.NOOP,
        createChildren: function () {
            this._super();
            this.removeClass("text");
            this.addClass("button");
        },
        createComplete: function () {
            this._super();
            var self = this;
            this.setIcon(this.icon);
            if (DC.System.isTouch) {
                this.ui.bind("touchstart", function () {
                    self.handleMouseDown();
                });
                this.ui.bind("touchend", function () {
                    self.handleMouseUp();
                });
            } else {
                this.ui.hover(function () {
                    DC.HCI.disableDrag();
                    self.handleMouseOver();
                }, function () {
                    DC.HCI.enableDrag();
                    self.handleMouseOut();
                });
                this.ui.mousedown(function () {
                    self.handleMouseDown();
                });
                this.ui.mouseup(function () {
                    self.handleMouseUp();
                });
            }
            this.ui.click(function () {
                self.handleMouseClick();
            });
        },
        handleMouseOver: function () {
            if (this.enabled) {
                this.addClass("over");
                this.onOver();
            }
        },
        handleMouseOut: function () {
            if (this.enabled) {
                this.removeClass("over");
                this.onOut();
            }
        },
        handleMouseDown: function () {
            if (this.enabled) {
                this.addClass("down");
                this.onDown();
            }
        },
        handleMouseUp: function () {
            if (this.enabled) {
                this.removeClass("down");
                this.removeClass("over");
                this.onUp();
            }
        },
        handleMouseClick: function () {
            if (this.enabled) {
                this.onClick();
            }
        },
        setIcon: function (src) {
            if (typeof src == "string" && src != "") {
                this.icon = src;
                if (this._icon == null) {
                    this._icon = new Image();
                }
                this._icon.src = src;
                this._container.prepend(this._icon);
            } else {
                if (this._icon != null) {
                    $(this._icon).detach();
                }
            }
        }
    };
    window.DC.Button = DC.Text.extend(DC.Button);
}(window));
(function (window) {
    DC.TileThumbnail = {
        columnCount: 0,
        rowCount: 0,
        thumbnailWidth: 30,
        thumbnailHeight: 30,
        sourceLabel: "thumbnail",
        thumbnailResizeMode: DC.Size.AUTO,
        thumbnailAlign: DC.Alignment.CENTER,
        snap: {
            x: 0,
            y: 0
        },
        createChildren: function () {
            this.contentClass = DC.Tile;
            if (this.itemRenderer == null) {
                this.itemRenderer = DC.ThumbnailRenderer;
            }
            this.itemRendererOptions = {
                sourceLabel: this.sourceLabel,
                width: this.thumbnailWidth,
                height: this.thumbnailHeight,
                resizeMode: this.thumbnailResizeMode,
                align: this.thumbnailAlign
            };
            this._super();
            this._scrollController.showScrollBar = "auto";
            DC.synthesize("thumbnailWidth", this);
            DC.synthesize("thumbnailHeight", this);
            DC.synthesize("rowCount", this);
            DC.synthesize("columnCount", this);
            DC.synthesize("sourceLabel", this);
            this.setThumbnailWidth(this.thumbnailWidth);
            this.setThumbnailHeight(this.thumbnailHeight);
            this.setColumnCount(this.columnCount);
            this.setRowCount(this.rowCount);
            this.setSourceLabel(this.sourceLabel);
            this._listController.snap = this.snap;
        },
        commitProperties: function (prop, value) {
            if (this._contentContainer._layout) {
                this._contentContainer._layout.columnWidth = this.thumbnailWidth;
                this._contentContainer._layout.rowHeight = this.thumbnailHeight;
                this._scrollController.snap.x = this.thumbnailWidth;
                this._scrollController.snap.y = this.thumbnailHeight;
            }
            switch (prop) {
            case "cowCount":
                this._contentContainer._layout.rowCount = value;
                this.setSize();
                break;
            case "columnCount":
                this._contentContainer._layout.columnCount = value;
                this.setSize();
                break;
            case "thumbnailWidth":
                this._contentContainer._layout.columnWidth = value;
                this.setSize();
                break;
            case "thumbnailHeight":
                this._contentContainer._layout.rowHeight = value;
                this.setSize();
                break;
            }
        }
    };
    window.DC.TileThumbnail = DC.ScrollListBase.extend(DC.TileThumbnail);
    DC.Thumbnail = {
        vertical: false,
        createChildren: function () {
            this._super();
            this._scrollController.showScrollBar = "off";
            DC.synthesize("vertical", this);
            this.setVertical(this.vertical);
        },
        commitProperties: function (prop, value) {
            this._super(prop, value);
            switch (prop) {
            case "vertical":
                if (this._contentContainer._layout) {
                    if (value) {
                        this.columnCount = this._contentContainer._layout.columnCount = 1;
                        this.rowCount = this._contentContainer._layout.rowCount = 0;
                    } else {
                        this.columnCount = this._contentContainer._layout.columnCount = 0;
                        this.rowCount = this._contentContainer._layout.rowCount = 1;
                    }
                }
                this.setSize();
                break;
            }
        }
    };
    window.DC.Thumbnail = DC.TileThumbnail.extend(DC.Thumbnail);
}(window));
(function (window) {
    DC.Table = {
        createChildren: function () {
            this.contentClass = DC.VBox;
            this.itemRendererOptions = {
                width: this.width
            };
            this._super();
            this.addClass("table");
            this._scrollController.showScrollBar = "auto";
        },
        commitSize: function () {
            this._super();
            this._contentContainer.setWidth(this.width);
        }
    };
    window.DC.Table = DC.ScrollListBase.extend(DC.Table);
}(window));
(function (window) {
    DC.TooltipManager = {
        _current: null,
        show: function (ui, text, position) {
            if (this._current == null) {
                this._current = new DC.Tooltip({
                    "text": text
                });
            }
            this._current.setVisible(false, false);
            $("body").append(this._current.ui);
            this._current.setText(text);
            var p = ui.ui.offset();
            var x = p.left;
            var y = p.top;
            this._current.removeClass("top");
            this._current.removeClass("bottom");
            this._current.removeClass("left");
            this._current.removeClass("right");
            switch (position) {
            case DC.Alignment.TOP:
                this._current.addClass("top");
                y -= this._current.height - 5;
                break;
            default:
            case DC.Alignment.BOTTOM:
                this._current.addClass("bottom");
                if ($(window).height() < y + ui.height + 5) {
                    y -= this._current.height - 5;
                } else {
                    y += ui.height + 5;
                }
                break;
            case DC.Alignment.LEFT:
                this._current.addClass("left");
                x -= this._current.width - 5;
                break;
            case DC.Alignment.RIGHT:
                this._current.addClass("right");
                x += ui.width + 10;
                break;
            }
            this._current.ui.css({
                left: x,
                top: y
            });
            ui.onBlur = function () {
                log("blur");
                DC.TooltipManager.kill(true);
                ui.onBlur = DC.NOOP;
            };
            this._current.setVisible(true);
        },
        kill: function (force) {
            if (force) {
                this._current.setVisible(false, false);
            } else {
                this._current.setVisible(false, true);
            }
        }
    };
    DC.Tooltip = {
        _arrow: null,
        createChildren: function () {
            this._super();
            this._arrow = $('<div class="tooltip_arrow"><div class="tooltip_arrow_inner"></div></div>');
            this.addClass("tooltip");
        },
        createComplete: function () {
            this._super();
            this.ui.append(this._arrow);
            this.removeClass("mask");
            this.css({
                "z-index": 99999
            });
        }
    };
    window.DC.Tooltip = DC.Text.extend(DC.Tooltip);
}(window));
(function (window) {
    DC.Input = {
        tooltip: "",
        _input: null,
        onChange: DC.NOOP,
        onFocus: DC.NOOP,
        onBlur: DC.NOOP,
        createChildren: function () {
            this._super();
            this._input = this.buildInput();
            this.addClass("input");
        },
        createComplete: function () {
            this._super();
            var self = this;
            this.ui.append(this._input);
            this._input.change(function () {
                self.onChange(this.value);
            });
            this._input.blur(function () {
                self.onBlur();
            });
            this._input.focus(function () {
                if (self.tooltip != "") {
                    DC.TooltipManager.show(self, self.tooltip);
                }
                self.onFocus();
            });
        },
        buildInput: DC.NOOP,
        focus: function () {
            this._input.focus();
        },
        value: function () {
            return this._input.val();
        },
        setValue: function (value) {
            this._input.val(value);
        }
    };
    window.DC.Input = DC.UI.extend(DC.Input);
    DC.TextInput = {
        setSize: function (w, h) {
            this._super(w, h);
            this._input.css({
                "width": this.innerWidth - 2,
                "height": this.height - 2
            });
        },
        buildInput: function () {
            return $('<input id="' + this.id + '" name="' + this.id + '" type="text" value=""/>');
        },
        upateText: function (txt) {
            this._input.val(txt);
        }
    };
    window.DC.TextInput = DC.Input.extend(DC.TextInput);
    DC.TextArea = {
        rows: 2,
        cols: 20,
        createComplete: function () {
            this._super();
            var self = this;
            this._input.bind("size", function () {
                self.setSize();
            });
        },
        commitSize: function () {
            this._super();
        },
        buildInput: function () {
            return $('<textarea id="' + this.id + '" name="' + this.id + '" rows="' + this.rows + '" cols="' + this.cols + '"/>');
        }
    };
    window.DC.TextArea = DC.TextInput.extend(DC.TextArea);
    DC.ComboBox = {
        data: null,
        dataKey: "data",
        labelKey: "label",
        selectedItemLabel: "",
        selectedItemData: null,
        onchange: DC.NOOP,
        createChildren: function () {
            this._super();
            this.removeClass("mask");
        },
        createComplete: function () {
            this._super();
            var self = this;
            this._input.unbind("change");
            this._input.change(function () {
                self.onChange(self.id, self.data[self._input.attr("selectedIndex")]);
            });
            if (this.data) {
                this.setDataSource(this.data);
            }
        },
        buildInput: function () {
            return $('<select id="' + this.id + '" name="' + this.id + '" class="combobox"/>');
        },
        updateData: function (data) {
            this._input.empty();
            for (var idx in this.data) {
                var d = this.data[idx];
                var dd = ($.isPlainObject(d) && d[this.dataKey]) ? d[this.dataKey] : d;
                var label = ($.isPlainObject(d) && d[this.labelKey]) ? d[this.labelKey] : d;
                var option = '<option value="' + dd + '">' + label + "</option>";
                this._input.append(option);
            }
        },
        setDataSource: function (data) {
            if (data && $.isArray(data)) {
                this.data = data;
                this.updateData(data);
            }
        },
        setSelectedIndex: function (index) {}
    };
    window.DC.ComboBox = DC.Input.extend(DC.ComboBox);
}(window));
(function (window) {
    DC.FormValidateType = {
        OPTIONAL: "optional",
        EMAIL: "email"
    };
    DC.FormElementType = {
        TEXT_INPUT: "textinput",
        TEXT_AREA: "textarea",
        COMBOBOX: "combobox",
        createFormElement: function (form, type, data) {
            var h = (data.height) ? data.height : "";
            var id = data.id;
            var options = {
                "id": form + data.id,
                "height": h,
                "data": data.data
            };
            for (var fn in data) {
                if (typeof data[fn] == "function") {
                    options[fn] = data[fn];
                }
            }
            switch (data.type) {
            case DC.FormElementType.TEXT_INPUT:
                options.text = data.data;
                return new DC.TextInput(options);
                break;
            case DC.FormElementType.TEXT_AREA:
                options.text = data.data;
                return new DC.TextArea(options);
                break;
            case DC.FormElementType.COMBOBOX:
                if (data.dataKey) {
                    options.dataKey = data.dataKey;
                }
                if (data.labelKey) {
                    options.labelKey = data.labelKey;
                }
                return new DC.ComboBox(options);
                break;
            }
        }
    };
    DC.Form = {
        data: null,
        labelWidth: "",
        rowHeight: 22,
        _forms: null,
        _UI: null,
        init: function (options) {
            this._super(options);
            this.addClass("form");
        },
        createChildren: function () {
            this._super();
            if (this.data) {
                this.setData(this.data);
            }
        },
        _createBoxContent: function (data, box) {
            if (data.id && data.type) {
                var ui = this._UI[data.id] = DC.FormElementType.createFormElement(this.id, data.type, data);
                ui.extra = data;
                if (data.label && data.label != "") {
                    var label = new DC.Text({
                        styles: "label",
                        width: this.labelWidth,
                        text: data.label
                    });
                    box.addChild(label);
                }
                box.addChild(ui);
            }
        },
        _validate: function (input, validate) {
            var pattern = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
            if (validate == undefined) {
                validate = "";
            }
            if (validate.indexOf("optional") == -1 && (input == undefined || input == "")) {
                return false;
            }
            if (validate.indexOf("email") != -1 && !pattern.test(input)) {
                return false;
            }
            if (validate.indexOf("equal") != -1) {
                var start = validate.indexOf("equal") + 6;
                var end = validate.substring(start).indexOf(" ");
                var name = (end == -1) ? validate.substring(start) : validate.substring(start, end);
                var ui = this._UI[name];
                if (ui.value() != input) {
                    return false;
                }
            }
            return true;
        },
        setData: function (value) {
            if (value) {} else {
                return;
            }
            this._forms = [];
            this._UI = {};
            for (var i in this.data) {
                var data = this.data[i];
                data.height = (data.height == undefined) ? this.rowHeight : data.height;
                var box = (data.height) ? new DC.HBox({
                    "height": data.height
                }) : new DC.HBox();
                box._layout.needPreprocess = true;
                if (data) {
                    if ($.isArray(data)) {
                        for (var idx in data) {
                            this._createBoxContent(data[idx], box);
                        }
                    } else {
                        this._createBoxContent(data, box);
                    }
                }
                this.addChild(box);
            }
        },
        clearHighlight: function () {
            this.ui.find(".highlight").removeClass("highlight");
        },
        updateComboBox: function (id, value) {
            var ui = this._UI[id];
            if (ui) {
                ui.setDataSource(value);
            }
        },
        setValue: function (id, value) {
            var ui = this._UI[id];
            if (ui) {
                ui.setValue(value);
            }
        },
        values: function () {
            var result = {};
            this.clearHighlight();
            for (var idx in this._UI) {
                var ui = this._UI[idx];
                var value = ui.value();
                if (!this._validate(value, ui.extra.validate)) {
                    ui.focus();
                    ui.ui.addClass("highlight");
                    DC.TooltipManager.show(ui, ui.extra.alt, "error");
                    return null;
                }
                result[idx] = value;
            }
            return result;
        }
    };
    window.DC.Form = DC.VBox.extend(DC.Form);
}(window));
jQuery.extend(jQuery.easing, {
    easeInQuad: function (x, t, b, c, d) {
        return c * (t /= d) * t + b;
    },
    easeOutQuad: function (x, t, b, c, d) {
        return -c * (t /= d) * (t - 2) + b;
    },
    easeInOutQuad: function (x, t, b, c, d) {
        if ((t /= d / 2) < 1) {
            return c / 2 * t * t + b;
        }
        return -c / 2 * ((--t) * (t - 2) - 1) + b;
    },
    easeInCubic: function (x, t, b, c, d) {
        return c * (t /= d) * t * t + b;
    },
    easeOutCubic: function (x, t, b, c, d) {
        return c * ((t = t / d - 1) * t * t + 1) + b;
    },
    easeInOutCubic: function (x, t, b, c, d) {
        if ((t /= d / 2) < 1) {
            return c / 2 * t * t * t + b;
        }
        return c / 2 * ((t -= 2) * t * t + 2) + b;
    },
    easeInQuart: function (x, t, b, c, d) {
        return c * (t /= d) * t * t * t + b;
    },
    easeOutQuart: function (x, t, b, c, d) {
        return -c * ((t = t / d - 1) * t * t * t - 1) + b;
    },
    easeInOutQuart: function (x, t, b, c, d) {
        if ((t /= d / 2) < 1) {
            return c / 2 * t * t * t * t + b;
        }
        return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
    },
    easeInQuint: function (x, t, b, c, d) {
        return c * (t /= d) * t * t * t * t + b;
    },
    easeOutQuint: function (x, t, b, c, d) {
        return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
    },
    easeInOutQuint: function (x, t, b, c, d) {
        if ((t /= d / 2) < 1) {
            return c / 2 * t * t * t * t * t + b;
        }
        return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
    },
    easeInSine: function (x, t, b, c, d) {
        return -c * Math.cos(t / d * (Math.PI / 2)) + c + b;
    },
    easeOutSine: function (x, t, b, c, d) {
        return c * Math.sin(t / d * (Math.PI / 2)) + b;
    },
    easeInOutSine: function (x, t, b, c, d) {
        return -c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
    },
    easeInExpo: function (x, t, b, c, d) {
        return (t == 0) ? b : c * Math.pow(2, 10 * (t / d - 1)) + b;
    },
    easeOutExpo: function (x, t, b, c, d) {
        return (t == d) ? b + c : c * (-Math.pow(2, -10 * t / d) + 1) + b;
    },
    easeInOutExpo: function (x, t, b, c, d) {
        if (t == 0) {
            return b;
        }
        if (t == d) {
            return b + c;
        }
        if ((t /= d / 2) < 1) {
            return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
        }
        return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
    },
    easeInCirc: function (x, t, b, c, d) {
        return -c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
    },
    easeOutCirc: function (x, t, b, c, d) {
        return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
    },
    easeInOutCirc: function (x, t, b, c, d) {
        if ((t /= d / 2) < 1) {
            return -c / 2 * (Math.sqrt(1 - t * t) - 1) + b;
        }
        return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
    },
    easeInElastic: function (x, t, b, c, d) {
        var s = 1.70158;
        var p = 0;
        var a = c;
        if (t == 0) {
            return b;
        }
        if ((t /= d) == 1) {
            return b + c;
        }
        if (!p) {
            p = d * 0.3;
        }
        if (a < Math.abs(c)) {
            a = c;
            var s = p / 4;
        } else {
            var s = p / (2 * Math.PI) * Math.asin(c / a);
        }
        return -(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
    },
    easeOutElastic: function (x, t, b, c, d) {
        var s = 1.70158;
        var p = 0;
        var a = c;
        if (t == 0) {
            return b;
        }
        if ((t /= d) == 1) {
            return b + c;
        }
        if (!p) {
            p = d * 0.3;
        }
        if (a < Math.abs(c)) {
            a = c;
            var s = p / 4;
        } else {
            var s = p / (2 * Math.PI) * Math.asin(c / a);
        }
        return a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b;
    },
    easeInOutElastic: function (x, t, b, c, d) {
        var s = 1.70158;
        var p = 0;
        var a = c;
        if (t == 0) {
            return b;
        }
        if ((t /= d / 2) == 2) {
            return b + c;
        }
        if (!p) {
            p = d * (0.3 * 1.5);
        }
        if (a < Math.abs(c)) {
            a = c;
            var s = p / 4;
        } else {
            var s = p / (2 * Math.PI) * Math.asin(c / a);
        } if (t < 1) {
            return -0.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
        }
        return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * 0.5 + c + b;
    },
    easeInBack: function (x, t, b, c, d, s) {
        if (s == undefined) {
            s = 1.70158;
        }
        return c * (t /= d) * t * ((s + 1) * t - s) + b;
    },
    easeOutBack: function (x, t, b, c, d, s) {
        if (s == undefined) {
            s = 1.70158;
        }
        return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
    },
    easeInOutBack: function (x, t, b, c, d, s) {
        if (s == undefined) {
            s = 1.70158;
        }
        if ((t /= d / 2) < 1) {
            return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
        }
        return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
    },
    easeInBounce: function (x, t, b, c, d) {
        return c - jQuery.easing.easeOutBounce(x, d - t, 0, c, d) + b;
    },
    easeOutBounce: function (x, t, b, c, d) {
        if ((t /= d) < (1 / 2.75)) {
            return c * (7.5625 * t * t) + b;
        } else {
            if (t < (2 / 2.75)) {
                return c * (7.5625 * (t -= (1.5 / 2.75)) * t + 0.75) + b;
            } else {
                if (t < (2.5 / 2.75)) {
                    return c * (7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375) + b;
                } else {
                    return c * (7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375) + b;
                }
            }
        }
    },
    easeInOutBounce: function (x, t, b, c, d) {
        if (t < d / 2) {
            return jQuery.easing.easeInBounce(x, t * 2, 0, c, d) * 0.5 + b;
        }
        return jQuery.easing.easeOutBounce(x, t * 2 - d, 0, c, d) * 0.5 + c * 0.5 + b;
    }
});