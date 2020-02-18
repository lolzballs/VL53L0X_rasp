project('vl53l0x', 'c')

subdir('api')
subdir('platform')

includes = [platform_inc, api_inc]

libtof = shared_library(
  'tof',
  platform_sources,
  api_sources,
  include_directories: includes 
)

subdir('examples')


