/**
 * Minified by jsDelivr using Terser v5.14.1.
 * Original file: /npm/toastify-js@1.12.0/src/toastify.js
 *
 * Do NOT use SRI with dynamically generated files! More information: https://www.jsdelivr.com/using-sri-with-dynamic-files
 */
/*!
 * Toastify js 1.12.0
 * https://github.com/apvarun/toastify-js
 * @license MIT licensed
 *
 * Copyright (C) 2018 Varun A P
 */
!(function (t, o) {
  "object" == typeof module && module.exports
    ? (module.exports = o())
    : (t.Toastify = o());
})(this, function (t) {
  var o = function (t) {
    return new o.lib.init(t);
  };
  function i(t, o) {
    return o.offset[t]
      ? isNaN(o.offset[t])
        ? o.offset[t]
        : o.offset[t] + "px"
      : "0px";
  }
  function s(t, o) {
    return (
      !(!t || "string" != typeof o) &&
      !!(t.className && t.className.trim().split(/\s+/gi).indexOf(o) > -1)
    );
  }
  return (
    (o.defaults = {
      oldestFirst: !0,
      text: "Toastify is awesome!",
      node: void 0,
      duration: 3e3,
      selector: void 0,
      callback: function () {},
      destination: void 0,
      newWindow: !1,
      close: !1,
      gravity: "toastify-top",
      positionLeft: !1,
      position: "",
      backgroundColor: "",
      avatar: "",
      className: "",
      stopOnFocus: !0,
      onClick: function () {},
      offset: { x: 0, y: 0 },
      escapeMarkup: !0,
      ariaLive: "polite",
      style: { background: "" },
    }),
    (o.lib = o.prototype =
      {
        toastify: "1.12.0",
        constructor: o,
        init: function (t) {
          return (
            t || (t = {}),
            (this.options = {}),
            (this.toastElement = null),
            (this.options.text = t.text || o.defaults.text),
            (this.options.node = t.node || o.defaults.node),
            (this.options.duration =
              0 === t.duration ? 0 : t.duration || o.defaults.duration),
            (this.options.selector = t.selector || o.defaults.selector),
            (this.options.callback = t.callback || o.defaults.callback),
            (this.options.destination =
              t.destination || o.defaults.destination),
            (this.options.newWindow = t.newWindow || o.defaults.newWindow),
            (this.options.close = t.close || o.defaults.close),
            (this.options.gravity =
              "bottom" === t.gravity ? "toastify-bottom" : o.defaults.gravity),
            (this.options.positionLeft =
              t.positionLeft || o.defaults.positionLeft),
            (this.options.position = t.position || o.defaults.position),
            (this.options.backgroundColor =
              t.backgroundColor || o.defaults.backgroundColor),
            (this.options.avatar = t.avatar || o.defaults.avatar),
            (this.options.className = t.className || o.defaults.className),
            (this.options.stopOnFocus =
              void 0 === t.stopOnFocus
                ? o.defaults.stopOnFocus
                : t.stopOnFocus),
            (this.options.onClick = t.onClick || o.defaults.onClick),
            (this.options.offset = t.offset || o.defaults.offset),
            (this.options.escapeMarkup =
              void 0 !== t.escapeMarkup
                ? t.escapeMarkup
                : o.defaults.escapeMarkup),
            (this.options.ariaLive = t.ariaLive || o.defaults.ariaLive),
            (this.options.style = t.style || o.defaults.style),
            t.backgroundColor &&
              (this.options.style.background = t.backgroundColor),
            this
          );
        },
        buildToast: function () {
          if (!this.options) throw "Toastify is not initialized";
          var t = document.createElement("div");
          for (var o in ((t.className =
            "toastify on " + this.options.className),
          this.options.position
            ? (t.className += " toastify-" + this.options.position)
            : !0 === this.options.positionLeft
            ? ((t.className += " toastify-left"),
              console.warn(
                "Property `positionLeft` will be depreciated in further versions. Please use `position` instead."
              ))
            : (t.className += " toastify-right"),
          (t.className += " " + this.options.gravity),
          this.options.backgroundColor &&
            console.warn(
              'DEPRECATION NOTICE: "backgroundColor" is being deprecated. Please use the "style.background" property.'
            ),
          this.options.style))
            t.style[o] = this.options.style[o];
          if (
            (this.options.ariaLive &&
              t.setAttribute("aria-live", this.options.ariaLive),
            this.options.node &&
              this.options.node.nodeType === Node.ELEMENT_NODE)
          )
            t.appendChild(this.options.node);
          else if (
            (this.options.escapeMarkup
              ? (t.innerText = this.options.text)
              : (t.innerHTML = this.options.text),
            "" !== this.options.avatar)
          ) {
            var s = document.createElement("img");
            (s.src = this.options.avatar),
              (s.className = "toastify-avatar"),
              "left" == this.options.position ||
              !0 === this.options.positionLeft
                ? t.appendChild(s)
                : t.insertAdjacentElement("afterbegin", s);
          }
          if (!0 === this.options.close) {
            var e = document.createElement("button");
            (e.type = "button"),
              e.setAttribute("aria-label", "Close"),
              (e.className = "toast-close"),
              (e.innerHTML = "&#10006;"),
              e.addEventListener(
                "click",
                function (t) {
                  t.stopPropagation(),
                    this.removeElement(this.toastElement),
                    window.clearTimeout(this.toastElement.timeOutValue);
                }.bind(this)
              );
            var n = window.innerWidth > 0 ? window.innerWidth : screen.width;
            ("left" == this.options.position ||
              !0 === this.options.positionLeft) &&
            n > 360
              ? t.insertAdjacentElement("afterbegin", e)
              : t.appendChild(e);
          }
          if (this.options.stopOnFocus && this.options.duration > 0) {
            var a = this;
            t.addEventListener("mouseover", function (o) {
              window.clearTimeout(t.timeOutValue);
            }),
              t.addEventListener("mouseleave", function () {
                t.timeOutValue = window.setTimeout(function () {
                  a.removeElement(t);
                }, a.options.duration);
              });
          }
          if (
            (void 0 !== this.options.destination &&
              t.addEventListener(
                "click",
                function (t) {
                  t.stopPropagation(),
                    !0 === this.options.newWindow
                      ? window.open(this.options.destination, "_blank")
                      : (window.location = this.options.destination);
                }.bind(this)
              ),
            "function" == typeof this.options.onClick &&
              void 0 === this.options.destination &&
              t.addEventListener(
                "click",
                function (t) {
                  t.stopPropagation(), this.options.onClick();
                }.bind(this)
              ),
            "object" == typeof this.options.offset)
          ) {
            var l = i("x", this.options),
              r = i("y", this.options),
              p = "left" == this.options.position ? l : "-" + l,
              d = "toastify-top" == this.options.gravity ? r : "-" + r;
            t.style.transform = "translate(" + p + "," + d + ")";
          }
          return t;
        },
        showToast: function () {
          var t;
          if (
            ((this.toastElement = this.buildToast()),
            !(t =
              "string" == typeof this.options.selector
                ? document.getElementById(this.options.selector)
                : this.options.selector instanceof HTMLElement ||
                  ("undefined" != typeof ShadowRoot &&
                    this.options.selector instanceof ShadowRoot)
                ? this.options.selector
                : document.body))
          )
            throw "Root element is not defined";
          var i = o.defaults.oldestFirst ? t.firstChild : t.lastChild;
          return (
            t.insertBefore(this.toastElement, i),
            o.reposition(),
            this.options.duration > 0 &&
              (this.toastElement.timeOutValue = window.setTimeout(
                function () {
                  this.removeElement(this.toastElement);
                }.bind(this),
                this.options.duration
              )),
            this
          );
        },
        hideToast: function () {
          this.toastElement.timeOutValue &&
            clearTimeout(this.toastElement.timeOutValue),
            this.removeElement(this.toastElement);
        },
        removeElement: function (t) {
          (t.className = t.className.replace(" on", "")),
            window.setTimeout(
              function () {
                this.options.node &&
                  this.options.node.parentNode &&
                  this.options.node.parentNode.removeChild(this.options.node),
                  t.parentNode && t.parentNode.removeChild(t),
                  this.options.callback.call(t),
                  o.reposition();
              }.bind(this),
              400
            );
        },
      }),
    (o.reposition = function () {
      for (
        var t,
          o = { top: 15, bottom: 15 },
          i = { top: 15, bottom: 15 },
          e = { top: 15, bottom: 15 },
          n = document.getElementsByClassName("toastify"),
          a = 0;
        a < n.length;
        a++
      ) {
        t = !0 === s(n[a], "toastify-top") ? "toastify-top" : "toastify-bottom";
        var l = n[a].offsetHeight;
        t = t.substr(9, t.length - 1);
        (window.innerWidth > 0 ? window.innerWidth : screen.width) <= 360
          ? ((n[a].style[t] = e[t] + "px"), (e[t] += l + 15))
          : !0 === s(n[a], "toastify-left")
          ? ((n[a].style[t] = o[t] + "px"), (o[t] += l + 15))
          : ((n[a].style[t] = i[t] + "px"), (i[t] += l + 15));
      }
      return this;
    }),
    (o.lib.init.prototype = o.lib),
    o
  );
});
//# sourceMappingURL=/sm/e1ebbfe1bf0b0061f0726ebc83434e1c2f8308e6354c415fd05ecccdaad47617.map
