import java.util.Properties
import java.io.FileInputStream
import java.util.Base64

plugins {
    id("com.android.application")
    // id("com.google.gms.google-services")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val majorVersion = 1
val minorVersion = 0
val patchVersion = 0
val buildVersion = 1

val androidMinSdkVersion = 24
val androidTargetSdkVersion = 36
val androidCompileSdkVersion = 36

val code = majorVersion * 10000 + minorVersion * 1000 + patchVersion * 100 + buildVersion * 1
val name = String.format("%d.%d.%d", majorVersion, minorVersion, patchVersion)

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val dartEnvironmentVariables = if (project.hasProperty("dart-defines")) {
    project.property("dart-defines").toString()
        .split(",")
        .associate { entry ->
            val decoded = String(Base64.getDecoder().decode(entry), Charsets.UTF_8)
            val pair = decoded.split("=", limit = 2)
            pair[0] to (pair.getOrNull(1) ?: "")
        }
} else {
    emptyMap()
}

android {
    namespace = "design.morpheme.lite"
    compileSdk = androidCompileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = dartEnvironmentVariables["ANDROID_APPLICATION_ID"] ?: "design.morpheme.lite"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = androidMinSdkVersion
        targetSdk = androidTargetSdkVersion
        versionCode = flutter.versionCode // change "flutter.versionCode" to "code" for native version 
        versionName = flutter.versionName // change "flutter.versionName" to "name" for native version
        resValue("string", "app_name", dartEnvironmentVariables["APP_NAME"] ?: "Morpheme Lite")
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }

    buildTypes {
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}
