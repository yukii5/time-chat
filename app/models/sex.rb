class Sex < ActiveHash::Base
  self.data = [
    { id: 0, name: '未回答' },
    { id: 1, name: '男' },
    { id: 2, name: '女' },
  ]
end