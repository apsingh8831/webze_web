'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/asset/image/b1.jpg": "5d68052dc9aab694cc2de36e17af0391",
"assets/asset/image/b10.jpg": "40e0338fc367d3a1e602b74a7d786100",
"assets/asset/image/b11.jpg": "27f46c9feb6b359e78ce18a7be27b31d",
"assets/asset/image/b12.jpg": "f70bf4e44286fa015d2bbca5ae6f7379",
"assets/asset/image/b13.jpg": "424dcb0856b62c086d44b1a9964c7a50",
"assets/asset/image/b14.jpg": "48357a1eec708c5e56f6a1c04c536af0",
"assets/asset/image/b15.jpg": "befd9d7e0352326ab2f7cd0432e0c20a",
"assets/asset/image/b2.jpg": "17a9287e5626ea6497321b3fbaa8fde7",
"assets/asset/image/b3.jpg": "3e079afa25fa1f7b47326e59e31d59a2",
"assets/asset/image/b4.jpg": "8e178c08e5da857fd6e17c4d1b77a0f3",
"assets/asset/image/b5.jpg": "74abb27bc0f4483da69629a49f1dbbcd",
"assets/asset/image/b6.jpg": "ba07e7fa0ff09a7b53a1be947bfb01f6",
"assets/asset/image/b7.jpg": "a97ee78b88fe82284c6ab5b7eff0080e",
"assets/asset/image/b8.jpg": "49c972ac5ac34b1e254070b35c718399",
"assets/asset/image/b9.jpg": "a7b8cc91a51d4b533d90d84137ead14d",
"assets/asset/image/d1.jpg": "604b33d4a2806db8664b37506e9dbdf3",
"assets/asset/image/d2.jpg": "7a9f72337d19ad7214719554533ac352",
"assets/asset/image/d3.jpg": "e7af64d5a7733b7bb5d481ef5227e256",
"assets/asset/image/f1.png": "72f9eba7794814f63cfa6461171e7a2e",
"assets/asset/image/f2.png": "9d19571ba4c57c773a00a98ec4e368b3",
"assets/asset/image/f3.png": "8bb4a2aed72f8dd5a1e7fe87fd37f9ee",
"assets/asset/image/f4.png": "6a310cc9795ea2344d94f2873707d80c",
"assets/asset/image/faq.png": "446f4e775a8754e293d91138e0decf93",
"assets/asset/image/footer_image.png": "d9287f3ac28233427cd931a7dd998fb4",
"assets/asset/image/footer_image1.png": "5f50cf0a67a2fa0d6d8e7b124810a45f",
"assets/asset/image/g1.png": "d9287f3ac28233427cd931a7dd998fb4",
"assets/asset/image/i1.png": "fc23799cc235f46b9328327360e80a44",
"assets/asset/image/i2.png": "684fe4289325a8966eb9545fb74ae35e",
"assets/asset/image/i3.png": "36b00fca3be430013d088584117592f3",
"assets/asset/image/l1.png": "b685a9aa4d8447f4e0dfab48546fa877",
"assets/asset/image/l2.png": "3bac32b850e23afc891caa9c55930020",
"assets/asset/image/l3.png": "711d34a5023302db9325a5981e272566",
"assets/asset/image/l4.png": "fc2df79bbc6aef3f700fb87f9598511e",
"assets/asset/image/l5.png": "a49b790aadd2812bb7004edd4f4b2fc2",
"assets/asset/image/marketplace.png": "322a6f06cf32301fd83cf561e2c1840f",
"assets/asset/image/p1.png": "5f0d0ece42e21d2272476a465a9a033b",
"assets/asset/image/p2.png": "9803ef2699fe267e74b795d6ca317454",
"assets/asset/image/p3.png": "999b0aef63cda057530b7909fdf58b64",
"assets/asset/image/p4.png": "482bcd730dbb813925852dc197ae10c2",
"assets/asset/image/participant.svg": "dc214014e8f6e2b4c8c5812943488b52",
"assets/asset/image/read.svg": "f4579cf329b991181483f111830fff88",
"assets/asset/image/token.svg": "29dacfc1349e3108d582a049361eb746",
"assets/asset/image/webze.png": "d3e37caab2d0415f1aa28618f9d165bb",
"assets/AssetManifest.bin": "ba32a73eb38d48074238d2d205cd173b",
"assets/AssetManifest.bin.json": "ecafb8ec0efd0310d7c6a2a7ad9f2669",
"assets/AssetManifest.json": "8ad0b06c915b8f9d5b0a6f980b1a34f7",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/fonts/MaterialIcons-Regular.otf": "63a7d558c4b8cbfec43610551e75b212",
"assets/NOTICES": "233a6e795e6236ad002d1da64058e4ec",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "9976de1952b5d350e9f92db2ad87e721",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "f931d293e1230722815265650692d249",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "b2703f18eee8303425a5342dba6958db",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "5b8d20acec3e57711717f61417c1be44",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "fca6f13c431d51c15a9aa7a1da0545ab",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "10b0ebc038893d43f0bf8dae22584eed",
"/": "10b0ebc038893d43f0bf8dae22584eed",
"main.dart.js": "222a6e6b6ff4014acf0427ee96169307",
"manifest.json": "8ff6d40a1ce1e8a102758c5c17fc4a3f",
"version.json": "46c69775c0c6d32acf33991a12022503"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
