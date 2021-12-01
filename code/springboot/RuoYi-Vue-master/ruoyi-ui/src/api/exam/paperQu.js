import request from '@/utils/request'

// 查询试卷题目列表
export function listPaperQu(query) {
  return request({
    url: '/exam/paperQu/list',
    method: 'get',
    params: query
  })
}

// 查询试卷题目详细
export function getPaperQu(id) {
  return request({
    url: '/exam/paperQu/' + id,
    method: 'get'
  })
}

// 新增试卷题目
export function addPaperQu(data) {
  return request({
    url: '/exam/paperQu',
    method: 'post',
    data: data
  })
}

// 修改试卷题目
export function updatePaperQu(data) {
  return request({
    url: '/exam/paperQu',
    method: 'put',
    data: data
  })
}

// 删除试卷题目
export function delPaperQu(id) {
  return request({
    url: '/exam/paperQu/' + id,
    method: 'delete'
  })
}
