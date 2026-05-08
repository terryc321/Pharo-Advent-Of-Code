
# BlSpace


```
space := BlSpace new.
space root addChild: (BlElement new background: Color blue).
space show.
```

Now lets add another BlElement

```
space := BlSpace new.
space root addChild: (BlElement new background: Color blue ; position: 200@200; extent: 50@50).
space root addChild: (BlElement new background: Color red ; position: 100@100 ; extent: 50@50).
space show.
```



