
class Person {
  name:string
  age:number
  gf: Person

  constructor (name:string,age:number,gf?:Person) {
    this.name = name,
    this.age = age,
    this.gf = gf
  }
}

@Entry
@Component
struct four {
  idx:number = 1
  // @State p: Person = new Person('Jack',21,new Person('Rose',18))
  @State p: Person = new Person('Jack',21)
  // @State gf: Person[] = [
  // new Person('rose',18),
  // new Person('louse'，19)
  // ]
  @State gfs: Person[] = [new Person('张1', 20), new Person('张2', 20)]

  build() {
    Column(){
      Text(`${this.p.name}:${this.p.age}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>{
          this.p.age++
        })
      Button('添加')
        .onClick(()=>{
          this.gfs.push(new Person('女友'+ this.idx++,20))
        })
      Text('=女友列表=')
        .fontWeight(FontWeight.Bold)
        .fontSize(50)
      ForEach(
        this.gfs,
        (p, index) => {
          Row(){
            Text(`${p.name}:${p.age}`)
              // Text('${this.p.gf.name} : ${this.p.gf.age}')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .onClick(()=>{
                this.p.gf.age++
              })
            Button('删除')
              .onClick(()=>{
                this.gfs.splice(index,1)
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceAround)
        }
      )
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}