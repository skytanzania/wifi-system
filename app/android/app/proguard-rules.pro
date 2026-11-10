# Applied automatically by the Flutter Gradle plugin to release builds (R8).

# flutter_secure_storage (EncryptedSharedPreferences / Tink)
-keep class androidx.security.crypto.** { *; }
-keep class com.google.crypto.tink.** { *; }
-dontwarn com.google.errorprone.annotations.**
-dontwarn javax.annotation.**
-keepattributes Signature
-keepattributes *Annotation*

# printing / pdf (voucher printing) and Google Maps
-keep class net.nfet.flutter.printing.** { *; }
-keep class com.google.android.gms.maps.** { *; }
-dontwarn com.google.android.gms.**
