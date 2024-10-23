<?php

namespace App\Http\Controllers\Api\Resource;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;

class CrudController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::all();

        $data = [
            'data' => $products
        ];

        return response()->json($data);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'nama_produk'=> 'required|string|min:1',
            'kode_produk'=> 'required|string|min:1',
            'harga'=> 'required|integer|min:1',
        ]);

        $product = Product::create($validatedData);

        return response()->json(['data' => $product, 'message' => 'Successfully added'],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        return response()->json($product);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $validatedData = $request->validate([
            'nama_produk' => 'required|string|min:1',
            'kode_produk' => 'required|string|min:1',
            'harga' => 'required|integer|min:1',
        ]);

        $product->update($validatedData);


        $updatedProduct = [
            'id' => $product->id,
            'nama_produk' => $product->nama_produk,
            'kode_produk' => $product->kode_produk,
            'harga' => $product->harga,

        ];

        return response()->json(['product' => $updatedProduct, 'message' => 'Successfully updated'], 200);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['data'=> false,'message' => 'Product not found'], 404);
        }

        $product->delete();

        return response()->json([ 'data'=>true ,'message' => 'Successfully deleted'],200);
    }
}
