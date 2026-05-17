import { useState } from 'react'

const App = () => {
  const [list,uList] = useState([]);
  const [input,setInput] = useState("");

  const onToggle = (sourceIndex) =>{
    let nl = list.map((item,index)=>{
      if(index===sourceIndex)
        return{...item,state:!item.state}
    return item;
    }  );
    uList(nl);
  }

  return(
    <div>
      <h1>To-Do List</h1>
      <Display list={list} onToggle={onToggle}/>
      <br/><h3>Add Item</h3>
      <input value={input} onChange={(e)=>setInput(e.target.value)}/>
      <Button className="func" label="ADD" onClick={()=>{if(input=="") return "";
         let newItem = {
          text:input, state:false
         }
         let vl = [...list,newItem]; 
         uList(vl);
         setInput("")
      }}/><br/><table><tbody><tr>
        <td>      <Button className="func" label="CLEAN" onClick={()=>{
        let nl = list.filter(item=>!item.state);
        uList(nl);
      }}/></td>
        <td>       <Button className="func" label="CLEAR" onClick={()=>uList([])}/>
</td>
        </tr></tbody></table>

    </div>
  );
}

const Display = ({list,onToggle}) => {
  return(
    <>
      {list.map((item,index)=>(
        <Bar state={item.state}onToggle={()=>onToggle(index)} text={item.text} key={index}/>
      ))}
    </>
  );
}

const Bar = ({text,state,onToggle}) => {

  return(
    <table><tbody><tr>
    <td >{(!state)?<span>{text}</span>:<s><span>{text}</span></s>}</td>
     <td> <Button id="checker" onClick={onToggle} label={(!state)?"CHECK":"UNCHECK"}/><br/></td>
    </tr></tbody></table>
  );
}

const Button = (props) => <button onClick={props.onClick} class={props.className}>{props.label}</button>
export default App
