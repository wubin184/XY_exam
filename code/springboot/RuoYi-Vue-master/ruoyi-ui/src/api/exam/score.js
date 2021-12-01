import request from '@/utils/request'

// 查询成绩管理列表
export function listScore(query) {
  return request({
    url: '/exam/score/list',
    method: 'get',
    params: query
  })
}

// 查询成绩管理详细
export function getScore(id) {
  return request({
    url: '/exam/score/' + id,
    method: 'get'
  })
}

// 新增成绩管理
export function addScore(data) {
  return request({
    url: '/exam/score',
    method: 'post',
    data: data
  })
}

// 修改成绩管理
export function updateScore(data) {
  return request({
    url: '/exam/score',
    method: 'put',
    data: data
  })
}

// 删除成绩管理
export function delScore(id) {
  return request({
    url: '/exam/score/' + id,
    method: 'delete'
  })
}
