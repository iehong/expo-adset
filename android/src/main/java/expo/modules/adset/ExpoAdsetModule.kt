package expo.modules.adset

import android.content.pm.PackageManager
import android.util.Log
import com.kc.openset.OSETVideoListener
import com.kc.openset.ad.OSETRewardVideoCache
import expo.modules.kotlin.modules.Module
import expo.modules.kotlin.modules.ModuleDefinition

class ExpoAdsetModule : Module() {
  override fun definition() = ModuleDefinition {
    val info =
      appContext.reactContext?.packageManager?.getApplicationInfo(
        appContext.reactContext?.packageName.toString(),
        PackageManager.GET_META_DATA
      )
    Name("ExpoAdset")
    Events("onReward")

    Function("reward") {
      OSETRewardVideoCache.getInstance().setOSETVideoListener(object : OSETVideoListener {
        override fun onError(p0: String?, p1: String?) {
          Log.d("OSETSDK", "onError-$p0-$p1")
          sendEvent(
            "onReward",
            mapOf("loaded" to false, "close" to true, "rewarded" to false)
          )
        }

        override fun onClick() {
        }

        override fun onClose(p0: String?) {
          sendEvent(
            "onReward",
            mapOf("loaded" to false, "close" to true, "rewarded" to false)
          )
        }

        override fun onLoad() {
          sendEvent(
            "onReward",
            mapOf("loaded" to true, "close" to false, "rewarded" to false)
          )
        }

        override fun onReward(p0: String?, p1: Int) {
          sendEvent(
            "onReward",
            mapOf("loaded" to false, "close" to false, "rewarded" to true)
          )
        }

        override fun onServiceResponse(p0: Int) {
        }

        override fun onShow(p0: String?) {
        }

        override fun onVideoEnd(p0: String?) {
        }

        override fun onVideoStart() {
        }
      }).showAd(appContext.currentActivity)
    }

    View(ExpoAdsetView::class) {
      Prop("name") { view: ExpoAdsetView, prop: String ->
        println(prop)
      }
    }
  }
}
