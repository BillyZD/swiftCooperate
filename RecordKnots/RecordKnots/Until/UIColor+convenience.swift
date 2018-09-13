//Licensed under the **MIT** license
//
//    > Copyright (c) 2015 Hyper Interaktiv AS
//        >
//        > Permission is hereby granted, free of charge, to any person obtaining
//> a copy of this software and associated documentation files (the
//> "Software"), to deal in the Software without restriction, including
//> without limitation the rights to use, copy, modify, merge, publish,
//> distribute, sublicense, and/or sell copies of the Software, and to
//> permit persons to whom the Software is furnished to do so, subject to
//> the following conditions:
//>
//> The above copyright notice and this permission notice shall be
//> included in all copies or substantial portions of the Software.
//>
//> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//> EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//> MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//> IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//> CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//> TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//> SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
import UIKit

// MARK: - Color Builders

public extension UIColor {

  public static func hex(_ string: String) -> UIColor {
    var hex = string.hasPrefix("#")
      ? String(string.characters.dropFirst())
      : string

    guard hex.characters.count == 3 || hex.characters.count == 6
      else { return UIColor.white.withAlphaComponent(0.0) }

    if hex.characters.count == 3 {
      for (index, char) in hex.characters.enumerated() {
        hex.insert(char, at: hex.characters.index(hex.startIndex, offsetBy: index * 2))
      }
    }

    return UIColor(
      red:   CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
      green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
      blue:  CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0, alpha: 1.0)
  }

  public func colorWithMinimumSaturation(_ minSaturation: CGFloat) -> UIColor {
    var (hue, saturation, brightness, alpha): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
    getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

    return saturation < minSaturation
      ? UIColor(hue: hue, saturation: minSaturation, brightness: brightness, alpha: alpha)
      : self
  }

  public func alpha(_ value: CGFloat) -> UIColor {
    return withAlphaComponent(value)
  }
}

// MARK: - Helpers

public extension UIColor {

  public func hex(withPrefix: Bool = true) -> String {
    var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
    getRed(&r, green: &g, blue: &b, alpha: &a)

    let prefix = withPrefix ? "#" : ""

    return String(format: "\(prefix)%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
  }

  public var isDark: Bool {
    let RGB = cgColor.components
    return (0.2126 * RGB![0])  + (0.7152 * RGB![1]) + (0.0722 * RGB![2])  < 0.5
  }

  public var isBlackOrWhite: Bool {
    let RGB = cgColor.components
    return (RGB![0] > 0.91 && RGB![1] > 0.91 && RGB![2] > 0.91) || (RGB![0] < 0.09 && RGB![1] < 0.09 && RGB![2] < 0.09)
  }

  public func isDistinctFrom(_ color: UIColor) -> Bool {
    let bg = cgColor.components
    let fg = color.cgColor.components
    let threshold: CGFloat = 0.25
    var result = false

    if fabs((bg?[0])! - (fg?[0])!) > threshold || fabs((bg?[1])! - (fg?[1])!) > threshold || fabs((bg?[2])! - (fg?[2])!) > threshold {
      if fabs((bg?[0])! - (bg?[1])!) < 0.03 && fabs((bg?[0])! - (bg?[2])!) < 0.03 {
        if fabs((fg?[0])! - (fg?[1])!) < 0.03 && fabs((fg?[0])! - (fg?[2])!) < 0.03 {
          result = false
        }
      }
      result = true
    }

    return result
  }

  public func isContrastingWith(_ color: UIColor) -> Bool {
    let bg = cgColor.components
    let fg = color.cgColor.components

    let bgLum = ( 0.2126 * bg![0] ) + (0.7152 * bg![1]) + (0.0722 * bg![2])
    let fgLum = 0.2126 * fg![0] + 0.7152 * fg![1] + 0.0722 * fg![2]
    let contrast = bgLum > fgLum
      ? (bgLum + 0.05) / (fgLum + 0.05)
      : (fgLum + 0.05) / (bgLum + 0.05)

    return 1.6 < contrast
  }
}

// MARK: - Gradient

public extension Array where Element : UIColor {

  public func gradient(_ transform: ((_ gradient: inout CAGradientLayer) -> CAGradientLayer)? = nil) -> CAGradientLayer {
    var gradient = CAGradientLayer()
    gradient.colors = self.map { $0.cgColor }

    if let transform = transform {
      transform(&gradient)
    }

    return gradient
  }
}
