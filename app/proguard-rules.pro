# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/ka/Library/Android/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

#------- General START -------
-keep public class * extends java.lang.Exception
-keepattributes SourceFile,LineNumberTable
-dontobfuscate
-dontoptimize
#------- General END -------


#------- Glide START -------
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
#------- Glide END -------


#------- Gson START -------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature

# For using GSON @Expose annotation
-keepattributes *Annotation*

# Gson specific classes
-keep class sun.misc.Unsafe { *; }
#-keep class com.google.gson.stream.** { *; }
#------- Gson END -------


#------- Cupboard START -------
-keep class com.tmestudios.stickers.data.local.model.** {*;}
#------- Cupboard END -------


#------- Icepick START -------
-dontwarn icepick.**
-keep class icepick.** { *; }
-keep class **$$Icepick { *; }
-keepclasseswithmembernames class * {
    @icepick.* <fields>;
}
-keepnames class * { @icepick.State *;}
#------- Icepick START -------


#------- Fabric START -------
-keepattributes *Annotation*
#------- Fabric END -------


#------- Parceler START -------
-keep interface org.parceler.Parcel
-keep @org.parceler.Parcel class * { *; }
-keep class **$$Parcelable { *; }
#------- Parceler END -------


#------- OkHttp START -------
-dontwarn okhttp3.**
-dontwarn okio.**
#------- OkHttp END -------


#------- Retrofit2 START -------
-dontwarn retrofit2.Platform$Java8
#------- Retrofit2 END -------


#------- RxJava START -------
-dontwarn rx.internal.util.**
#------- RxJava END -------
