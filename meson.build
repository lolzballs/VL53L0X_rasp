project('vl53l0x', 'c')

subdir('api')
subdir('platform')

includes = [platform_inc, api_inc]

libtof = shared_library(
  'tof',
  platform_sources,
  api_sources,
  include_directories: includes,
  install: true,
)

install_headers(platform_headers, subdir: 'vl53l0x')
install_headers(api_headers, subdir: 'vl53l0x')

subdir('examples')

pkg = import('pkgconfig')

pkg.generate(
  libraries: libtof,
  subdirs: 'vl53l0x',
  version: '1.0',
  name: 'libtof',
  filebase: 'tof',
  description: 'ToF VL53L0X'
)

