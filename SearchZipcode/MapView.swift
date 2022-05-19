//
//  MapView.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/19
//

import SwiftUI
import MapKit

struct MapView: View {
    let address: String
    @State private var map = MKCoordinateRegion()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $map)
                .onAppear {
                    self.getLocation(address: address){ location in
                        self.setMap(CLLocationCoordinate2D(latitude: location[0], longitude: location[1]))
                    }
                }
        }
    }
    
    private func getLocation(address: String,completion:@escaping ([CLLocationDegrees]) -> Void){
        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            guard let latitude = placemarks?.first?.location?.coordinate.latitude else { return }
            guard let longitude = placemarks?.first?.location?.coordinate.longitude else { return }
            print("DEBUG: latitude : \(latitude)")
            print("DEBUG: logitude : \(longitude)")
            completion([latitude,longitude])
        }
    }
    
    private func setMap(_ coordinate: CLLocationCoordinate2D){
        self.map = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

struct MapvView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(address: "東京都千代田区千代田")
    }
}
