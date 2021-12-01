import request from '@/utils/request'

// 查询考试列表
export function listExamination(query) {
  return request({
    url: '/exam/examination/list',
    method: 'get',
    params: query
  })
}

// 查询考试详细
export function getExamination(id) {
  return request({
    url: '/exam/examination/' + id,
    method: 'get'
  })
}

// 新增考试
export function addExamination(data) {
  return request({
    url: '/exam/examination',
    method: 'post',
    data: data
  })
}

// 修改考试
export function updateExamination(data) {
  return request({
    url: '/exam/examination',
    method: 'put',
    data: data
  })
}

// 删除考试
export function delExamination(id) {
  return request({
    url: '/exam/examination/' + id,
    method: 'delete'
  })
}
