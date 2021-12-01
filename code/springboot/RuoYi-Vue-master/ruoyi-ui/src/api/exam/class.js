import request from '@/utils/request'

// 查询课程管理列表
export function listClass(query) {
  return request({
    url: '/exam/class/list',
    method: 'get',
    params: query
  })
}

// 查询课程管理详细
export function getClass(id) {
  return request({
    url: '/exam/class/' + id,
    method: 'get'
  })
}

// 新增课程管理
export function addClass(data) {
  return request({
    url: '/exam/class',
    method: 'post',
    data: data
  })
}

// 修改课程管理
export function updateClass(data) {
  return request({
    url: '/exam/class',
    method: 'put',
    data: data
  })
}

// 删除课程管理
export function delClass(id) {
  return request({
    url: '/exam/class/' + id,
    method: 'delete'
  })
}
