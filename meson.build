project('vl53l0x', 'c')

subdir('api')
subdir('platform')

shared_library(
  'tof',
  platform_sources,
  api_sources,
  include_directories: [platform_inc, api_inc]
)
