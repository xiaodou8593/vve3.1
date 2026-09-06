# 姿态修正优化 TODO list

## vve:object/_regular
1. [x] np优化math:uvw/_nvec_to
2. [x] np点乘(u,v,w),sstemp_ni, i=1..12
3. [x] 全局替换点乘代码(mcfunction, mcfi)
4. [x] 删除其余regular/surface_i(mcfunction, mcfi)
5. [x] 全局替换regular/surface_i调用代码(mcfunction, mcfi)

## vve:object/regular/surface_i
6. [x] np实现数学库整数开根号和浮点数开根号
7. [x] regular/surface_i调用开根号
8. [x] np实现vec单位化
9. [x] np叉乘内联调用
10. [x] np优化math:quat/_mult

## vve:object/_regular_angular
11. [x] np化消除法向角速度

## 载具姿态修正研究
12. [x] np优化math:uvw/_vecto
13. [x] 调用vec单位化(np)
14. [ ] np优化math:uvw/_tovec
15. [ ] np优化消除nvec方向位移
16. [ ] 调用vve:object/_regular_angular