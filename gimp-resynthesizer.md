Resynthesizer for GIMP can be used to regenrate part of an image, based on other parts of the image.  This can be useful to clean up part of an image that has been corrupted (e.g. by dirt) or to remove something we don't want (e.g. remove a tent from a mountain image, or a watermark from TV footage).

First of all, we want to create an image containing all the textures we want the resynthesizer to use during regeneration.

It is important that this "source texture" does NOT contain the part of the image that we want to regenrate.  If it does, then resynthesizer will just regenrate the thing we wanted to remove!

There are two ways you might like to do this:

1. Use the entire image, minus the bit you want to regenerate

2. Or, select specific parts of the image you want to use for regeneration

Choosing 1. may require less planning on your part, but risks introducing things you didn't really want to regenerate.

Choosing 2. is good if you know exactly what you want, and you can easily select that from the original image.

> There is no need to specifically use transparency in any of this process.  Resynthesizer will not regenerate transparent / cut regions.  However, when you paste the clipboard to a new image, GIMP should produce an image with transparent areas.

## Approach 1

1. Select the region you want to clean up / regenerate / remove (e.g. using Free Select Tool, shortcut <kbd>F</kbd>)

2. Now use Select > Invert (<kbd>Ctrl-I</kbd>) to select everything else in the image

3. Edit > Copy

4. Edit > Paste as > New Image

## Approach 2

1. Select the region you want to use for regeneration, using any select tool you like (Free Select Tool F, Rectangle Select Tool R, Fuzzy Select Tool U)

2. Edit > Copy

3. Edit > Paste as > New Image

## Next

Resynthesizer will not regenerate transparent / cut regions.  So if you previously used Cut instead of Copy, you should undo, so there is no transparency in the region you want to regenerate.

1. Select the region you want to regenerate

2. Filters > Map > Resynthesize

3. Change the Texture Source to the new image you pasted earlier.  This is usually called "[Untitled]-N/Pasted Layer-M"

4. That's it!  Hit OK and see what the Resynthesizer produces!

Note: I do not use, or recommend, the advanced options "Make tileable" or "Use texture transfer"

So far I have only tried the default Context: "Random order, with context".  You may like to experiment with that.
