import React from 'react'
import { Chart } from 'react-charts'
import { lfoIt, clipIt, offsetIt } from '../../../output/FPSound.NoteFunction.NoteComp'

export default () => {
  const data = React.useMemo(
    () => [
      {
        data: [...Array(100).keys()].map(x => (x / 100.0)).map(x => [x, clipIt(offsetIt(lfoIt(x)))])
      }
    ],
    []
  )
 
  const axes = React.useMemo(
    () => [
      { primary: true, type: 'linear', position: 'bottom' },
      { type: 'linear', position: 'left' }
    ],
    []
  )
 
  return (
    // A react-chart hyper-responsively and continuously fills the available
    // space of its parent element automatically
    <div
      style={{
        width: '100%',
        height: '300px'
      }}
    >
      <Chart data={data} axes={axes} />
    </div>
  )
}