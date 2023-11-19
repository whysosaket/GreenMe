import React, {useState} from 'react'

function App() {
  const [score,setScore]=useState(0);
  
  const handleIncrease=()=>{
    console.log(score)
  }
  const handleDecrease=()=>{
    console.log(score)
  }
  const handleChange=(event)=>{
    setScore(event.target.value);
    
  }

  return (
    <div className=' '>


      <form className='w-96 margin-auto'>
        <div className="mb-6">
          <label  className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Enter Count</label>
          <input onChange={handleChange} type="number" id="count" className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="1,2,3,..." required />
        </div>
        
        
        <button type="button" onClick={handleIncrease} className="mx-2 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Increase</button>
        <button type="button" onClick={handleDecrease} className="mx-2 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Decrese</button>
      </form>

    </div>
  )
}

export default App