

@foreach ($products as $p )

<h1>{{ $p->kode_produk }}</h1>
<h2>{{ $p->nama_produk }}</h2>
<p>Rp.{{ $p->harga }}</p>
@endforeach
