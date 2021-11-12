import request from '@/utils/request'

// 查询题库管理列表
export function listQuestions(query) {
  return request({
    url: '/questions/questions/list',
    method: 'get',
    params: query
  })
}

// 查询题库管理详细
export function getQuestions(id) {
  return request({
    url: '/questions/questions/' + id,
    method: 'get'
  })
}

// 新增题库管理
export function addQuestions(data) {
  return request({
    url: '/questions/questions',
    method: 'post',
    data: data
  })
}

// 修改题库管理
export function updateQuestions(data) {
  return request({
    url: '/questions/questions',
    method: 'put',
    data: data
  })
}

// 删除题库管理
export function delQuestions(id) {
  return request({
    url: '/questions/questions/' + id,
    method: 'delete'
  })
}
