#open_ad_sdk
	-keep class com.bytedance.sdk.openadsdk.** { *; }
	-keep public interface com.bytedance.sdk.openadsdk.downloadnew.** {*;}
	-keep class com.ss.**{*;}
	-dontwarn com.ss.**
	# miitmdid
	-keep class com.bun.miitmdid.core.** {*;}
	-dontwarn com.bun.miitmdid.core.**
	
	#广点通 start
	-keep class com.qq.e.** {*;}
	-dontwarn com.qq.e.**
	#广点通 end

	#快手
	-keep class org.chromium.** {*;}
	-keep class org.chromium.** { *; }
	-keep class aegon.chrome.** { *; }
	-keep class com.kwai.**{ *; }
	-dontwarn com.kwai.**
	-dontwarn com.kwad.**
	-dontwarn com.ksad.**
	-dontwarn aegon.chrome.**
	#快手

	# WindAd
	-keep class com.sigmob.**{*;}
	-dontwarn com.sigmob.**
	# WindAd	
	
	
#baidu start
-ignorewarnings
-dontwarn com.baidu.mobads.sdk.api.**
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class com.baidu.mobads.** { *; }
-keep class com.style.widget.** {*;}
-keep class com.component.** {*;}
-keep class com.baidu.ad.magic.flute.** {*;}
-keep class com.baidu.mobstat.forbes.** {*;}
#baidu end

#oaid start
-keep class com.asus.msa.**{*;}
-keep class com.bun.**{*;}
-keep class com.huawei.hms.ads.identifier.**{*;}
-keep class com.netease.nis.sdkwrapper.**{*;}
-keep class com.samsung.android.deviceidservice.**{*;}
-keep class com.zui.**{*;}
-keep class XI.**{*;}
#oaid end

#openset start
-keep class com.kc.openset.**{*;}
-dontwarn com.kc.openset.**
#openset end

#-------------- okhttp3 start-------------
# OkHttp3
# https://github.com/square/okhttp
# okhttp
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.squareup.okhttp.* { *; }
-keep interface com.squareup.okhttp.** { *; }
-dontwarn com.squareup.okhttp.**
	
# okhttp 3
-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**
	
# Okio
-dontwarn com.squareup.**
-dontwarn okio.**
-keep public class org.codehaus.* { *; }
-keep public class java.nio.* { *; }
#----------okhttp end--------------
	
# log start
-keep class com.aliyun.sls.android.producer.* { *; }
-keep interface com.aliyun.sls.android.producer.* { *; }
# log end

# 倍孜混淆
-dontwarn com.beizi.fusion.**
-dontwarn com.beizi.ad.**
-keep class com.beizi.fusion.** {*; }
-keep class com.beizi.ad.** {*; }

-keep class com.qq.e.** {
    public protected *;
}

-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

-dontwarn  org.apache.**

sdk加固
-keep @com.qihoo.SdkProtected.OSETSDK.Keep class **{*;}
-keep,allowobfuscation @interface com.qihoo.SdkProtected.OSETSDK.Keep

##Glide
-dontwarn com.bumptech.glide.**
-keep class com.bumptech.glide.**{*;}
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

#拼多多
-keep class com.xunmeng.** {*;}

# 阿里TanxAd start
-dontwarn com.alibaba.fastjson.**

-keep class com.alibaba.fastjson.**{*;}
-keep class com.bumptech.glide.**{*;}

-keep class com.alimm.tanx.**{*;}

# 有进程间通信,保证service相关不被混淆
#-keep public class * extends android.app.Service
#-keep public class * extends android.content.BroadcastReceiver

# 自动曝光数据的防混淆
-keep class * implements java.io.Serializable{
     <fields>;
    <methods>;
}
# 阿里TanxAd end
