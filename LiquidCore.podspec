Pod::Spec.new do |s|
  s.name = "LiquidCore"
  s.version = "0.7.0"
  s.summary = "Provides Node.js virtual machines to run inside iOS apps."
  s.description = <<-DESC
LiquidCore enables Node.js virtual machines to run inside iOS apps. It provides a complete runtime environment, including a virtual file system.
  DESC
  s.homepage = "https://github.com/LiquidPlayer/LiquidCore"
  s.license = {:type => "MIT", :file => "LICENSE.md"}
  s.author = {"Eric Lange" => "eric@flicket.tv"}
  s.platform = :ios, '11.0'
	s.source = {:git => "https://github.com/LiquidPlayer/LiquidCore.git", :tag => "#{s.version}"}
	s.libraries = ['z', 'c++']
	s.prepare_command = <<-CMD
		bash LiquidCore/src/ios/generate_node_javascript.sh
		bash LiquidCore/src/ios/generate_javascript_polyfills.sh
	CMD
	s.default_subspec = 'Core'

	s.subspec 'Core' do |cs|
		cs.dependency 'LiquidCore/openssl'
		cs.dependency 'LiquidCore/uv'
		cs.source_files =
			# cares
			"deps/node-10.15.3/deps/cares/include/*.h",
			"deps/node-10.15.3/deps/cares/src/ares_cancel.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares__close_sockets.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_create_query.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_data.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_destroy.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_expand_name.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_expand_string.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_fds.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_free_hostent.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_free_string.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_gethostbyaddr.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_gethostbyname.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares__get_hostent.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_getnameinfo.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_getopt.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_getsock.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_init.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_library_init.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_llist.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_mkquery.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_nowarn.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_options.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_aaaa_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_a_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_mx_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_naptr_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_ns_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_ptr_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_soa_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_srv_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_parse_txt_reply.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_process.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_query.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares__read_line.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_search.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_send.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_strcasecmp.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_strdup.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_strerror.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_strsplit.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_timeout.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares__timeval.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_version.{c,h}",
			"deps/node-10.15.3/deps/cares/src/ares_writev.{c,h}",
			"deps/node-10.15.3/deps/cares/src/bitncmp.{c,h}",
			"deps/node-10.15.3/deps/cares/src/inet_net_pton.{c,h}",
			"deps/node-10.15.3/deps/cares/src/inet_ntop.{c,h}",

			# http_parser
			"deps/node-10.15.3/deps/http_parser/http_parser.{c,h}",

			# nghttp2
			"deps/node-10.15.3/deps/nghttp2/lib/includes/*.h",
			"deps/node-10.15.3/deps/nghttp2/lib/includes/nghttp2/*.h",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_*.h",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_buf.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_callbacks.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_debug.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_frame.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_hd.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_hd_huffman.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_hd_huffman_data.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_helper.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_http.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_map.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_mem.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_npn.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_option.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_outbound_item.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_pq.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_priority_spec.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_queue.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_rcbuf.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_session.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_stream.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_submit.{c,h}",
			"deps/node-10.15.3/deps/nghttp2/lib/nghttp2_version.{c,h}",

			# v8_platform
			"deps/node-10.15.3/deps/v8/src/libplatform/default-foreground-task-runner.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/default-platform.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/default-worker-threads-task-runner.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/task-queue.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-buffer.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-config.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-object.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-writer.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/tracing/tracing-controller.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/libplatform/worker-thread.{cc,h}",

			# v8_libbase
			"deps/node-10.15.3/deps/v8/src/base/bits.cc",
			"deps/node-10.15.3/deps/v8/src/base/cpu.cc",
			"deps/node-10.15.3/deps/v8/src/base/debug/stack_trace.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/division-by-constant.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/file-utils.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/functional.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/ieee754.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/logging.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/once.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/page-allocator.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/platform/condition-variable.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/platform/mutex.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/platform/semaphore.cc",
			"deps/node-10.15.3/deps/v8/src/base/platform/time.cc",
			"deps/node-10.15.3/deps/v8/src/base/sys-info.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/utils/random-number-generator.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/debug/stack_trace_posix.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/platform/platform-macos.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/platform/platform-posix.{cc,h}",
			"deps/node-10.15.3/deps/v8/src/base/platform/platform-posix-time.{cc,h}",

			# node_lib
			"deps/node-10.15.3/src/async_wrap.{cc,h}",
			"deps/node-10.15.3/src/*.h",
			"deps/node-10.15.3/src/bootstrapper.{cc,h}",
			"deps/node-10.15.3/src/callback_scope.{cc,h}",
			"deps/node-10.15.3/src/cares_wrap.{cc,h}",
			"deps/node-10.15.3/src/connection_wrap.{cc,h}",
			"deps/node-10.15.3/src/connect_wrap.{cc,h}",
			"deps/node-10.15.3/src/debug_utils.{cc,h}",
			"deps/node-10.15.3/src/env.{cc,h}",
			"deps/node-10.15.3/src/exceptions.{cc,h}",
			"deps/node-10.15.3/src/fs_event_wrap.{cc,h}",
			"deps/node-10.15.3/src/handle_wrap.{cc,h}",
			"deps/node-10.15.3/src/heap_utils.{cc,h}",
			"deps/node-10.15.3/src/js_stream.{cc,h}",
			"deps/node-10.15.3/src/module_wrap.{cc,h}",
			"deps/node-10.15.3/src/node_api.{cc,h}",
			"deps/node-10.15.3/src/node_buffer.{cc,h}",
			"deps/node-10.15.3/src/node_config.{cc,h}",
			"deps/node-10.15.3/src/node_constants.{cc,h}",
			"deps/node-10.15.3/src/node_contextify.{cc,h}",
			"deps/node-10.15.3/src/node_domain.{cc,h}",
			"deps/node-10.15.3/src/node_encoding.{cc,h}",
			"deps/node-10.15.3/src/node_http2.{cc,h}",
			"deps/node-10.15.3/src/node_http_parser.{cc,h}",
			"deps/node-10.15.3/src/node_messaging.{cc,h}",
			"deps/node-10.15.3/src/node_options.{cc,h}",
			"deps/node-10.15.3/src/node_os.{cc,h}",
			"deps/node-10.15.3/src/node_platform.{cc,h}",
			"deps/node-10.15.3/src/node_perf.{cc,h}",
			"deps/node-10.15.3/src/node_postmortem_metadata.{cc,h}",
			"deps/node-10.15.3/src/node_process.{cc,h}",
			"deps/node-10.15.3/src/node_serdes.{cc,h}",
			"deps/node-10.15.3/src/node_trace_events.{cc,h}",
			"deps/node-10.15.3/src/node_types.{cc,h}",
			"deps/node-10.15.3/src/node_url.{cc,h}",
			"deps/node-10.15.3/src/node_util.{cc,h}",
			"deps/node-10.15.3/src/node_v8.{cc,h}",
			"deps/node-10.15.3/src/node_stat_watcher.{cc,h}",
			"deps/node-10.15.3/src/node_watchdog.{cc,h}",
			"deps/node-10.15.3/src/node_worker.{cc,h}",
			"deps/node-10.15.3/src/node_zlib.{cc,h}",
			"deps/node-10.15.3/src/node_i18n.{cc,h}",
			"deps/node-10.15.3/src/pipe_wrap.{cc,h}",
			"deps/node-10.15.3/src/sharedarraybuffer_metadata.{cc,h}",
			"deps/node-10.15.3/src/signal_wrap.{cc,h}",
			"deps/node-10.15.3/src/spawn_sync.{cc,h}",
			"deps/node-10.15.3/src/string_bytes.{cc,h}",
			"deps/node-10.15.3/src/string_decoder.{cc,h}",
			"deps/node-10.15.3/src/stream_base.{cc,h}",
			"deps/node-10.15.3/src/stream_pipe.{cc,h}",
			"deps/node-10.15.3/src/stream_wrap.{cc,h}",
			"deps/node-10.15.3/src/tcp_wrap.{cc,h}",
			"deps/node-10.15.3/src/timer_wrap.{cc,h}",
			"deps/node-10.15.3/src/tracing/agent.{cc,h}",
			"deps/node-10.15.3/src/tracing/node_trace_buffer.{cc,h}",
			"deps/node-10.15.3/src/tracing/node_trace_writer.{cc,h}",
			"deps/node-10.15.3/src/tracing/trace_event.{cc,h}",
			"deps/node-10.15.3/src/tracing/traced_value.{cc,h}",
			"deps/node-10.15.3/src/tty_wrap.{cc,h}",
			"deps/node-10.15.3/src/udp_wrap.{cc,h}",
			"deps/node-10.15.3/src/util.{cc,h}",
			"deps/node-10.15.3/src/uv.{cc,h}",
			"deps/node-10.15.3/src/node_code_cache_stub.{cc,h}",
			"deps/node-10.15.3/src/node_crypto.{cc,h}",
			"deps/node-10.15.3/src/node_crypto_bio.{cc,h}",
			"deps/node-10.15.3/src/node_crypto_clienthello.{cc,h}",
			"deps/node-10.15.3/src/tls_wrap.{cc,h}",

			# V82JSC
			"LiquidCore/src/ios/V82JSC/**/*.{cpp,h}",
			"deps/utfcpp/**/*.{h}",
			"deps/JavaScriptCore/private/*.h",
			"deps/Apple/**/*.h",
			"deps/node-10.15.3/deps/v8/src/assert-scope.cc",

			# generated files
			"LiquidCore/src/ios/gen/*.{c,cc}",

			# LiquidCore node modifications
			"LiquidCore/src/common/*.{cc,c,h}",
			"LiquidCore/src/ios/node_bridge.{cc,h}",

			# API
			"LiquidCore/src/ios/LiquidCore/*.h",
			"LiquidCore/src/ios/API/*.{h,m,cpp}"

		cs.public_header_files = [ "LiquidCore/src/ios/LiquidCore/*.h" ]
		cs.private_header_files = [
					"deps/node-10.15.3/src/*.h",
					"deps/node-10.15.3/deps/cares/include/*.h",
					"deps/node-10.15.3/deps/http_parser/*.h",
					"deps/node-10.15.3/deps/nghttp2/lib/**/*.h",
				]
		# Preserve header include paths.
		cs.preserve_paths = [
			"deps/node-10.15.3/deps/v8/include",
			"deps/node-10.15.3/deps/v8",
			"deps/node-10.15.3/deps/uv/include",
			"deps/node-10.15.3/deps/cares/include",
			"deps/node-10.15.3/src",
			"deps/node-10.15.3/deps/nghttp2/lib/includes",
			"deps/node-10.15.3/deps/openssl/openssl/include",
		]
		cs.frameworks = "JavaScriptCore"
		cs.xcconfig = {
				# System Header Search Paths
				:HEADER_SEARCH_PATHS => [
						# OTHER_CPLUSPLUSFLAGS -I includes
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/include",
						"${PODS_TARGET_SRCROOT}/deps/node-10.15.3/deps/v8",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/src/libplatform",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/src/libplatform/tracing",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/src/base",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/src",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/nghttp2/lib/includes",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/uv/include",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/cares/include",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/cares/config/darwin",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl/include",
						"$(PODS_TARGET_SRCROOT)/LiquidCore/src/ios",
						"$(PODS_TARGET_SRCROOT)/deps/utfcpp",
				].join(' '),
				:OTHER_CFLAGS => [
						'-D_DARWIN_USE_64_BIT_INODE=1',
						'-D_DARWIN_UNLIMITED_SELECT=1',
						'-DHTTP_PARSER_STRICT=0',
						'-D_LARGEFILE_SOURCE',
						'-D_FILE_OFFSET_BITS=64',
						'-DHAVE_CONFIG_H',
						'-DNODE_PLATFORM=\'"ios"\'',
						'-DNODE_WANT_INTERNALS=1',
						'-DV8_DEPRECATION_WARNINGS=1',
						'-DNODE_OPENSSL_SYSTEM_CERT_PATH=\'""\'',
						'-DHAVE_INSPECTOR=0',
						'-DNODE_SHARED_MODE',
						'-DNODE_USE_V8_PLATFORM=1',
						'-DHAVE_OPENSSL=1',
						'-DHTTP_PARSER_STRICT=0',

						'-D__POSIX__',
						'-D_REENTRANT=1',
						'-D_DARWIN_USE_64_BIT_INODE=1',
						'-D_LARGEFILE_SOURCE',
						'-D_FILE_OFFSET_BITS=64',
						'-DHAVE_CONFIG_H',
						'-D_GLIBCXX_USE_C99_MATH',

						'-DHTTP_MAX_HEADER_SIZE=8192',
						'-DHTTP_PARSER_STRICT=0',

						'-D_U_=',
						'-DBUILDING_NGHTTP2',
						'-DNGHTTP2_STATICLIB',

						'-DOPENSSL_NO_HW',
						'-DOPENSSL_NO_ASM',
						'-DDSO_DLFCN',
						'-DHAVE_DLFCN_H',
						'-DOPENSSL_THREADS',
						'-DOPENSSL_NO_DYNAMIC_ENGINE',
						'-DOPENSSL_PIC',
						'-DOPENSSLDIR=\'"/etc/ssl"\'',
						'-DENGINESDIR=\'"/dev/null"\'',
						'-DTERMIOS'

				].join(' '),
				:OTHER_CPLUSPLUSFLAGS => [
					'-D_DARWIN_USE_64_BIT_INODE=1',
					'-D_DARWIN_UNLIMITED_SELECT=1',
					'-DHTTP_PARSER_STRICT=0',
					'-D_LARGEFILE_SOURCE',
					'-D_FILE_OFFSET_BITS=64',
					'-DHAVE_CONFIG_H',
					'-DNODE_PLATFORM=\'"ios"\'',
					'-DNODE_WANT_INTERNALS=1',
					'-DV8_DEPRECATION_WARNINGS=1',
					'-DNODE_OPENSSL_SYSTEM_CERT_PATH=\'""\'',
					'-DHAVE_INSPECTOR=0',
					'-DNODE_SHARED_MODE',
					'-DNODE_USE_V8_PLATFORM=1',
					'-DHAVE_OPENSSL=1',
					'-DHTTP_PARSER_STRICT=0',

					'-D__POSIX__',
					'-D_REENTRANT=1',
					'-D_DARWIN_USE_64_BIT_INODE=1',
					'-D_LARGEFILE_SOURCE',
					'-D_FILE_OFFSET_BITS=64',
					'-DHAVE_CONFIG_H',
					'-D_GLIBCXX_USE_C99_MATH',

					'-DHTTP_MAX_HEADER_SIZE=8192',
					'-DHTTP_PARSER_STRICT=0',

					'-D_U_=',
					'-DBUILDING_NGHTTP2',
					'-DNGHTTP2_STATICLIB',

					'-DV8_GYP_BUILD',
					'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0',
					'-D_DARWIN_USE_64_BIT_INODE=1',
					'-DV8_EMBEDDER_STRING="-node.51"',
					'-DENABLE_DISASSEMBLER',
					'-DV8_PROMISE_INTERNAL_FIELD_COUNT=1',
					'-DV8_INTL_SUPPORT',
					'-DV8_CONCURRENT_MARKING',
					'-DDISABLE_UNTRUSTED_CODE_MITIGATIONS',

					'-Wno-inconsistent-missing-override',
					'-Wno-defaulted-function-deleted',
					'-DV8_OS_MACOSX',
					'-DV8_FAST_TLS_SUPPORTED_NOXXX',
					'-DBUILDING_NGHTTP2',
					'-DHAVE_INSPECTOR=0',
					'-DV8_INSPECTOR_USE_STL=1',
					'-DV8_INSPECTOR_USE_OLD_STL=1',
					'-D_GLIBCXX_USE_C99_MATH',
				].join(' '),

				'OTHER_CPLUSPLUSFLAGS[arch=arm64]'  => '$(inherited) -DV8_TARGET_ARCH_ARM64 -DNODE_ARCH=\"arm64\"',
				'OTHER_CPLUSPLUSFLAGS[arch=armv7]'  => '$(inherited) -DV8_TARGET_ARCH_ARM -DNODE_ARCH=\"armv7a\"',
				'OTHER_CPLUSPLUSFLAGS[arch=x86_64]'  => '$(inherited) -DV8_TARGET_ARCH_X64 -DNODE_ARCH=\"x64\"',

				# Disable warnings
				:CLANG_WARN_COMMA => 'NO',
				:CLANG_WARN_DOCUMENTATION_COMMENTS => 'NO',
				:GCC_WARN_64_TO_32_BIT_CONVERSION => 'NO',
				:GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS => 'NO',
				:GCC_WARN_UNUSED_VARIABLE => 'NO',
				:GCC_WARN_UNINITIALIZED_AUTOS => 'NO',
				:CLANG_WARN_UNREACHABLE_CODE => 'NO',
				:GCC_WARN_TYPECHECK_CALLS_TO_PRINTF => 'NO'
		}
	end

	s.subspec 'uv' do |us|
		us.source_files =
			"deps/node-10.15.3/deps/uv/src/fs-poll.{c,h}",
			"deps/node-10.15.3/deps/uv/src/inet.{c,h}",
			"deps/node-10.15.3/deps/uv/src/threadpool.{c,h}",
			"deps/node-10.15.3/deps/uv/src/*.h",
			"deps/node-10.15.3/deps/uv/src/timer.{c,h}",
			"deps/node-10.15.3/deps/uv/src/uv-data-getter-setters.{c,h}",
			"deps/node-10.15.3/deps/uv/src/uv-common.{c,h}",
			"deps/node-10.15.3/deps/uv/src/version.{c,h}",
			"LiquidCore/src/ios/uv_async.c", # <- hack to deal with name clash
			"deps/node-10.15.3/deps/uv/src/unix/core.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/dl.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/fs.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/getaddrinfo.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/getnameinfo.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/loop.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/loop-watcher.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/pipe.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/poll.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/process.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/signal.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/stream.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/tcp.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/thread.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/tty.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/udp.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/proctitle.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/darwin.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/fsevents.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/darwin-proctitle.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/bsd-ifaddrs.{c,h}",
			"deps/node-10.15.3/deps/uv/src/unix/kqueue.{c,h}",
			"deps/node-10.15.3/deps/uv/include/uv.h"
		us.private_header_files = [
			"deps/node-10.15.3/deps/uv/include/pthread-barrier.h",
			"deps/node-10.15.3/deps/uv/include/tree.h",
			"deps/node-10.15.3/deps/uv/include/uv-darwin.h",
			"deps/node-10.15.3/deps/uv/include/uv-errno.h",
			"deps/node-10.15.3/deps/uv/include/uv-threadpool.h",
			"deps/node-10.15.3/deps/uv/include/uv-unix.h",
			"deps/node-10.15.3/deps/uv/include/uv-version.h",
			"deps/node-10.15.3/deps/uv/include/uv.h",
			"deps/node-10.15.3/deps/uv/src/*.h",
		]
		us.xcconfig = {
			:HEADER_SEARCH_PATHS => [
					"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/uv/include",
					"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/uv/src",
					"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/uv/src/unix",
			].join(' '),
			:OTHER_CFLAGS => [
					'-D_DARWIN_USE_64_BIT_INODE=1',
					'-D_DARWIN_UNLIMITED_SELECT=1',
					'-D_LARGEFILE_SOURCE',
					'-D_FILE_OFFSET_BITS=64',
					'-D__POSIX__',
					'-D_REENTRANT=1',
					'-D_GLIBCXX_USE_C99_MATH',
					'-Wno-shorten-64-to-32',
					'-Wno-unreachable-code',
					'-Wno-comma',
			].join(' '),
		}
	end

	s.subspec 'openssl' do |os|
		os.source_files =
			"deps/node-10.15.3/deps/openssl/openssl/include/openssl/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/ssl/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/ssl/record/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/ssl/statem/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/aes/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/asn1/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/async/arch/async_null.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/async/arch/async_posix.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/async/arch/async_win.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/async/*.c",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/bf/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/bio/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/blake2/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/bn/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/buffer/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/camellia/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cast/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/chacha/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cmac/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cms/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_api.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_def.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_err.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_lib.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_mall.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_mod.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_sap.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_ssl.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_lcl.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cpt_err.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cryptlib.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cversion.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ebcdic.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ex_data.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/getenv.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/init.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/mem.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/mem_clr.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/mem_dbg.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/mem_sec.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/o_dir.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/o_fips.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/o_fopen.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/o_init.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/o_str.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/o_time.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/threads_none.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/threads_pthread.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/threads_win.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/uid.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/vms_rms.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ct/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/des/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/dh/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/dsa/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/dso/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ec/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/engine/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/err/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/evp/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/hmac/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/idea/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/kdf/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/lhash/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/md4/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/md5/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/mdc2/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/modes/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/objects/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ocsp/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/pem/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs12/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs7/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/poly1305/poly1305.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rand/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rc2/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rc4/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ripemd/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rsa/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/seed/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/sha/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/srp/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/stack/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ts/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/txt_db/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ui/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/whrlpool/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/x509/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/engines/e_capi.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/engines/e_padlock.{c,h}"
		os.exclude_files = [
			"deps/node-10.15.3/deps/openssl/openssl/crypto/arm_arch.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ppc_arch.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/sparc_arch.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/v3conf.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/v3prin.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/tabtest.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs7/pk7_enc.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ec/ecp_nistz*.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/aes/aes_x86core.c",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/bf/bf_cbc.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/des/ncbc_enc.c",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rc2/tab.{c,h}",
			"deps/node-10.15.3/deps/openssl/openssl/include/openssl/__DECC_INCLUDE_EPILOGUE.H",
			"deps/node-10.15.3/deps/openssl/openssl/include/openssl/__DECC_INCLUDE_PROLOGUE.H",
		]
		os.private_header_files = [
			"deps/node-10.15.3/deps/openssl/openssl/include/openssl/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/ssl/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/ssl/record/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/ssl/statem/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/aes/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/asn1/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/async/arch/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/bf/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/bio/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/blake2/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/bn/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/buffer/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/camellia/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cast/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/chacha/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cmac/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/cms/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/conf/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ct/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/des/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/dh/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/dsa/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/dso/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ec/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/engine/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/err/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/evp/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/hmac/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/idea/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/kdf/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/lhash/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/md4/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/md5/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/mdc2/*,h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/modes/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/objects/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ocsp/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/pem/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs12/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs7/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/poly1305/poly1305.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rand/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rc2/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rc4/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ripemd/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/rsa/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/seed/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/sha/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/srp/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/stack/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ts/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/txt_db/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/ui/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/whrlpool/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/x509/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/*.h",
			"deps/node-10.15.3/deps/openssl/openssl/engines/e_capi.h",
			"deps/node-10.15.3/deps/openssl/openssl/engines/e_padlock.h"
		]
		os.preserve_paths = [
			"deps/node-10.15.3/deps/openssl/openssl/include",
			"deps/node-10.15.3/deps/openssl/openssl/crypto/include",
		]
		os.xcconfig = {
				# System Header Search Paths
				:HEADER_SEARCH_PATHS => [
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl/include",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl/crypto/include",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl",
						"$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/config/archs/darwin64-x86_64-cc/no-asm/crypto",
					].join(' '),
				:OTHER_CFLAGS => [
						'-DOPENSSL_NO_HW',
						'-DOPENSSL_NO_ASM',
						'-DDSO_DLFCN',
						'-DHAVE_DLFCN_H',
						'-DOPENSSL_THREADS',
						'-DOPENSSL_NO_DYNAMIC_ENGINE',
						'-DOPENSSL_PIC',
						'-DOPENSSLDIR=\'"/etc/ssl"\'',
						'-DENGINESDIR=\'"/dev/null"\'',
						'-DTERMIOS',
						'-D__POSIX__',
						'-D_REENTRANT=1',
						'-D_DARWIN_USE_64_BIT_INODE=1',
						'-D_LARGEFILE_SOURCE',
						'-D_FILE_OFFSET_BITS=64',
						'-D_GNU_SOURCE',
						'-DHAVE_CONFIG_H',
				].join(' '),
				# Disable warnings
				:GCC_WARN_INHIBIT_ALL_WARNINGS => 'YES'
		}
	end
end
