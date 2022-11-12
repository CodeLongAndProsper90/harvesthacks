import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:svgator_player_flutter/svgator_player_flutter.dart';

class Logo extends StatefulWidget {
    final double? width;
    final double? height;
    

    Logo({
        Key? key,
        this.width,
        this.height,
      
    }): super(key: key);

  @override
  UntitledgifState createState() => new UntitledgifState();
}

class UntitledgifState extends State<Logo> {
  final _key = UniqueKey();
  
  @override
  Widget build(BuildContext context) {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      debugPrint("SVGator's Flutter animations run only on Android or iOS!");
      return SizedBox.shrink();
    }
    return Container(
        width: this.widget.width,
        height: this.widget.height,
        child: WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'about:blank',
          
          onWebViewCreated: (WebViewController webViewController) {
            
            _loadHtmlFromAssets(webViewController);
          },
          onPageFinished: (String url) {
            if (url == 'about:blank') {
              return;
            }
            
          },
        )
    );
  }

  _loadHtmlFromAssets(webViewController) async {
    String Svg = "<svg id=\"eE9VOgW2ljK1\" xmlns=\"http:\/\/www.w3.org\/2000\/svg\" xmlns:xlink=\"http:\/\/www.w3.org\/1999\/xlink\" viewBox=\"0 0 300 300\" shape-rendering=\"geometricPrecision\" text-rendering=\"geometricPrecision\"><text dx=\"0\" dy=\"0\" font-family=\"&quot;eE9VOgW2ljK1:::Raleway&quot;\" font-size=\"15\" font-weight=\"400\" transform=\"translate(108.787903 155.113943)\" stroke-width=\"0\"><tspan y=\"0\" font-size=\"15\" font-weight=\"400\" stroke-width=\"0\"><![CDATA[\r\n \r\n]]><\/tspan><tspan y=\"0\" font-size=\"36\" font-weight=\"400\" stroke-width=\"0\"><![CDATA[\r\nRisin'\r\n]]><\/tspan><\/text><rect width=\"21.872111\" height=\"21.872111\" rx=\"0\" ry=\"0\" transform=\"translate(150 110.704931)\" fill=\"#fff\" stroke-width=\"0\"\/><ellipse id=\"eE9VOgW2ljK6\" rx=\"8.691407\" ry=\"8.691407\" transform=\"translate(160.936056 174.526073)\" fill=\"#efbf21\" fill-opacity=\"0\" stroke-width=\"0\"\/>\r\n<script><![CDATA[\r\n${SVGatorPlayer.getPlayer("5c7f360c")};(function(s,i,o,w,a,b){w[o]=w[o]||{};w[o][s]=w[o][s]||[];w[o][s].push(i);})('5c7f360c',{\"root\":\"eE9VOgW2ljK1\",\"version\":\"2022-05-04\",\"animations\":[{\"elements\":{\"eE9VOgW2ljK6\":{\"transform\":{\"keys\":{\"o\":[{\"t\":0,\"v\":{\"x\":160.936056,\"y\":174.526073,\"type\":\"cusp\",\"end\":{\"x\":28.033426,\"y\":174.526073}}},{\"t\":1500,\"v\":{\"x\":160.936056,\"y\":123.885635,\"type\":\"cusp\",\"start\":{\"x\":118.27164,\"y\":50.190405}}}]}}}},\"s\":\"MQDA1ZGE5NTA5MmEzYTWA4ZmEyOTc5ZDljNTAI2ODYxNWU1ZTVlNWFGBNTA5Mjk3YTA5MzkxYFTI5NzlkOWM1MDY4NWJY1YTUwOTdhMjkzYTAS4ZmEyOTc5ZDljYTE1TMDY4NWY1YTUwOTQ5NDzlhVTlhNTA2ODVmNWBE1MFU4ZjlhYTI5M2EPwOWM4ZmEyOTM1MDY4UTDk0OGY5YWExOTM1YMTUwYTFJOWU5MzkzOTVI1MDY4NWY1YTUwOTQE5ZWExNTA2ODVmUDVlYNWVhYg|\"}],\"options\":\"MJDAxMDg4MmY4MDgxNmJU3ZjgxMmY0NzJmNzkV3Y0I2ZVc3MTJmOGE\/Y\"},'__SVGATOR_PLAYER__',window)\r\n]]><\/script>\r\n\r\n<style><![CDATA[\r\n@font-face {font-family: 'eE9VOgW2ljK1:::Raleway';font-style: normal;font-weight: 400;src: url(data:font\/ttf;charset=utf-8;base64,AAEAAAASAQAABAAgR0RFRgBuAA4AAAHYAAAAMkdQT1OP5pg5AAAEqAAAAOpHU1VCs4qylQAAA9QAAADUT1MvMoPZZzgAAALoAAAAYFNUQVTneMwnAAACRAAAAEhjbWFwAU8BUAAAAowAAABcY3Z0IBSgArkAAANIAAAAimZwZ23iGZ5aAAAMHAAAD5RnYXNwAAAAEAAAASwAAAAIZ2x5Zt0HAc8AAAmMAAACkGhlYWQSYR3EAAACDAAAADZoaGVhB+YC3wAAAYwAAAAkaG10eA1pAk4AAAGwAAAAKGxvY2EEXQO8AAABNAAAABZtYXhwAr0QjgAAAUwAAAAgbmFtZTOQWmQAAAcwAAACWnBvc3T\/nwAyAAABbAAAACBwcmVwTyjDAgAABZQAAAGcAAEAAf\/\/AA8AAAAyAGwAhQCXAKcA2gEmATgBOAFIAAAAAQAAAAoAaQAHAG4ABgACABAALwCaAAAB+A+DAAMAAwADAAAAAAAA\/5wAMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAOs\/xYAAAU3\/x3+hwUaAAEAAAAAAAAAAAAAAAAAAAAKAmAAMgKNAFkA2gBLANoASwDaAEsCRwBLAeMAIADFAEUA\/wAAAAAAMgABAAIAIgAAAAAAAAAOAAEAAwAAABAAAAAQAAAAEAABAAAAAgACAAEAAgABAAUABgABAAAAAQAAAAQGqG\/RgddfDzz1AAsD6AAAAADT3F4jAAAAANsrdHb\/Hf8hBRoEfwAAAAYAAgAAAAAAAAABAAEACAACAAAAFAACAAAAJAACd2dodAEAAABpdGFsARMAAQAEABQAAwAAAAIBBAGQAAACvAAAAAMAAQACARQAAAAAAAEAAAAAAAIAAAADAAAAFAADAAEAAAAUAAQASAAAAA4ACAACAAYAIAAnAFIAaQBuAHP\/\/wAAACAAJwBSAGkAbgBz\/\/\/\/6P\/g\/6\/\/mf+X\/5MAAQAAAAAAAAAAAAAAAAAAAAQCNgGQAAUAAAKKAlgAAABLAooCWAAAAV4AMgE3AAAAAAAAAAAAAAAAoAAC\/1AAIFsAAAAAAAAAAE5PTkUAwAAA+wYDrP8WAAAEggDqIAABlwAAAAACBwLGAAAAIAADAtoACgLGAAUCOwARAgcACAAA\/\/sAAP\/2AAD\/9v8r\/\/YCxgAKAAD\/9gAAABQAFAAUABQAFAAUABQAFAAUABQAFAAUABQAFAAUABQAFAAUABQAJwAUABEAFAAUABQAFAAUABQAFgARABQADwAUABEAFAAUABEAFAAXACUAKAIcAAUBpP+rAb0BSgGkAAAAAQAAAAoAdgC0AANERkxUAGJjeXJsAF5sYXRuABQAAAAFQVpFIABCQ1JUIAA6S0FaIAAyVEFUIAAqVFJLIAAiAAD\/\/wABAAQAAP\/\/AAEAAwAA\/\/8AAQACAAD\/\/wABAAEAAP\/\/AAEAAAAAAAAABAAAAAD\/\/wAAAAVsb2NsADhsb2NsADJsb2NsACxsb2NsACZsb2NsACAAAAABAAIAAAABAAEAAAABAAAAAAABAAMAAAABAAQABQAMAAwADAAMAAwAAQAAAAEACAABAAYAAgABAAEAAgABAAAACgAqADgAA0RGTFQAFGN5cmwAFGxhdG4AFAAEAAAAAP\/\/AAEAAAABa2VybgAIAAAAAQAAAAEABAACAAgAAgCMAAoAAgBMAAQAAABuAFoABQAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP\/3AAD\/+wAAAAAAAP\/+AAAAAP\/7\/\/sAAAAAAAAAAAAAABH\/9wAAAAEABQABAAIABQAGAAcAAQABAAcAAQADAAAAAAACAAQABQABAAEABwADAAAAAAAAAAEAAgAEAAEADgAEAAAAAgAcABYAAQACAAcACAABAAf\/6wABAAj\/6wAAQPs\/ND5VPhAGVT0o\/x88KPofOyenHzon\/x85J6cfOCb\/Hzcl\/x82JacfNST\/HzQkZB8zI\/8fMiOnHzEi+h8wIv8fLyH\/Hy4g\/x8tH\/8fLB7\/Hysd\/x8qHacfKRz\/HyEb\/x8gGv8fHxn\/Hx4Y\/x8dF\/8fHBb\/HxtAGf9bGEAW\/1saQBn\/WxdAFv9bFRlAFv9aE0sSVRFLEFUSWRBZDUsMVQVLBFUMWQRZDzIOVQtLClUHSwZVATIAVQ5ZcA4BClkGWR8GPwZfBn8Gnwa\/Bt8G\/wYIAFkfAD8ATwBfAJ8ABQlkCFUDZAJVCFkCWQ8CHwJfAn8CvwIFEAADQEAFAbgBkLBUK0u4B\/9SS7AJUFuwAYiwJVOwAYiwQFFasAaIsABVWltYsQEBjlmFjY0AHUJLsJBTWLIDAAAdQlmxAgJDUVixBAOOWUJzACsAKysrcwArcwArACtzACsrKysrACsAKysrACsAKysrASsBKwErASsBKwErACsrASsAKysBKwArKysBKwArKwErKwArKysrASsrACsrKysrKysrGAAAAAwAlgADAAEECQAAAMgA\/AADAAEECQABAA4A7gADAAEECQACAA4A4AADAAEECQADADQArAADAAEECQAEAB4AjgADAAEECQAFABoAdAADAAEECQAGAB4AVgADAAEECQAOADQAIgADAAEECQEAAAwAFgADAAEECQEEAA4A4AADAAEECQETAAwACgADAAEECQEUAAoAAABSAG8AbQBhAG4ASQB0AGEAbABpAGMAVwBlAGkAZwBoAHQAaAB0AHQAcAA6AC8ALwBzAGMAcgBpAHAAdABzAC4AcwBpAGwALgBvAHIAZwAvAE8ARgBMAFIAYQBsAGUAdwBhAHkALQBSAGUAZwB1AGwAYQByAFYAZQByAHMAaQBvAG4AIAA0AC4AMAAyADYAUgBhAGwAZQB3AGEAeQAgAFIAZQBnAHUAbABhAHIANAAuADAAMgA2ADsATgBPAE4ARQA7AFIAYQBsAGUAdwBhAHkALQBSAGUAZwB1AGwAYQByAFIAZQBnAHUAbABhAHIAUgBhAGwAZQB3AGEAeQBDAG8AcAB5AHIAaQBnAGgAdAAgADIAMAAxADAAIABUAGgAZQAgAFIAYQBsAGUAdwBhAHkAIABQAHIAbwBqAGUAYwB0ACAAQQB1AHQAaABvAHIAcwAgACgAaQBtAHAAYQBsAGwAYQByAGkAQABnAG0AYQBpAGwALgBjAG8AbQApACwAIAB3AGkAdABoACAAUgBlAHMAZQByAHYAZQBkACAARgBvAG4AdAAgAE4AYQBtAGUAIAAiAFIAYQBsAGUAdwBhAHkAIgAuAAAAAwAyAAACLgLGAAwAGQAdAAAlFCMhIiY1ETQzITIVAxE0IyEiFREUFjMhMgcBNwECLiH+QBALEwHXEjQP\/osQCg0BYRwc\/mk0AZ8dHQwNApYXFf2ZAjgSE\/3GCgsWAoEb\/WkAAAIAWQAAAmcCxgAQABsAG0ANEQsPDwAbAQJyDQAIcgArMisyETkvMzMwMTMRITIeAhUUBgYHEyMDIxERMzI2NjU0JiYjI1kBLC5MOR8nRzCuT6fS6Co+IidBKOICxiZBTykzWj4K\/u4BBv76AUQuSyorSS0AAgBLAAAAjwLaAAMABwAOtQUEAQYACgA\/P84yMDEzETMRAzUzFUtEREQCCf33AnZkZAABAEsAAACPAgkAAwAMtQEGcgAKcgArKzAxMxEzEUtEAgn99\/\/\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\/\/+wdiuwBCWwBCULsAclsAolsHcrsAolsAglsAgluP\/\/sHYrsAIlsAIlC7AKJbAHJbB3K1mwCiVGsAolRmCwCCVGsAglRmCwBiWwBiULsAwlsAwlsAwmILAAUFghsGobsGxZK7AEJbAEJQuwCSWwCSWwCSYgsABQWCGwahuwbFkrI7AKJUawCiVGYGGwIGMjsAglRrAIJUZgYbAgY7EBDCVUWAQbBVmwCiYgELADJTqwBiawBiYLsAcmIBCKOrEBByZUWAQbBVmwBSYgELACJTqKigsjIBAjOi0sI7ABVFi5AABAABu4QACwAFmKsAFUWLkAAEAAG7hAALAAWbB9Ky0siooIDYqwAVRYuQAAQAAbuEAAsABZsH0rLSwIsAFUWLkAAEAAG7hAALAAWQ2wfSstLLAEJrAEJggNsAQmsAQmCA2wfSstLCABRiMARrAKQ7ALQ4pjI2JhLSywCSuwBiUusAUlfcWwBiWwBSWwBCUgsABQWCGwahuwbFkrsAUlsAQlsAMlILAAUFghsGobsGxZKxiwCCWwByWwBiWwCiWwbyuwBiWwBSWwBCYgsABQWCGwZhuwaFkrsAUlsAQlsAQmILAAUFghsGYbsGhZK1RYfbAEJRCwAyXFsAIlELABJcWwBSYhsAUmIRuwBiawBCWwAyWwCCawbytZsQACQ1RYfbACJbCCK7AFJbCCKyAgaWGwBEMBI2GwYGAgaWGwIGEgsAgmsAgmirACFziKimEgaWFhsAIXOBshISEhWRgtLEtSsQECQ1NaWCMQIAE8ADwbISFZLSwjsAIlsAIlU1ggsAQlWDwbOVmwAWC4\/+kcWSEhIS0ssAIlR7ACJUdUiiAgEBGwAWCKIBKwAWGwhSstLLAEJUewAiVHVCMgErABYSMgsAYmICAQEbABYLAGJrCFK4qKsIUrLSywAkNUWAwCiktTsAQmS1FaWAo4GwohIVkbISEhIVktLLCYK1gMAopLU7AEJktRWlgKOBsKISFZGyEhISFZLSwgsAJDVLABI7gAaCN4IbEAAkO4AF4jeSGwAkMjsCAgXFghISGwALgATRxZioogiiCKI7gQAGNWWLgQAGNWWCEhIbABuAAwHFkbIVmwgGIgXFghISGwALgAHRxZI7CAYiBcWCEhIbAAuAAMHFmKsAFhuP+rHCMhLSwgsAJDVLABI7gAgSN4IbEAAkO4AHcjeSGxAAJDirAgIFxYISEhuABnHFmKiiCKIIojuBAAY1ZYuBAAY1ZYsAQmsAFbsAQmsAQmsAQmGyEhISG4ADiwACMcWRshWbAEJiOwgGIgXFiKXIpaIyEjIbgAHhxZirCAYiBcWCEhIyG4AA4cWbAEJrABYbj\/kxwjIS0=) format('truetype');}\r\n]]><\/style>\r\n<\/svg>\r\n";
    String fileText = SVGatorPlayer.wrapPage(Svg);
    String dataUrl = Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString();
    webViewController.loadUrl(dataUrl);
  }
}